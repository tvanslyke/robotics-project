#include "i2c_line_follower.h"
#include <avr/io.h>
#include <avr/interrupt.h>
#include <compat/twi.h>
#include "Arduino.h" // for digitalWrite
#include "Optional.h"
#include "assert.h"

static constexpr long i2c_clock_frequency = 400000l;

#ifndef cbi
#define cbi(sfr, bit) (_SFR_BYTE(sfr) &= ~_BV(bit))
#endif

#ifndef sbi
#define sbi(sfr, bit) (_SFR_BYTE(sfr) |= _BV(bit))
#endif

namespace ino {

void initialize_i2c()
{
	// activate internal pullups for twi.
	digitalWrite(SDA, 1);
	digitalWrite(SCL, 1);
	
	// initialize twi prescaler and bit rate
	cbi(TWSR, TWPS0);
	cbi(TWSR, TWPS1);
	TWBR = ((F_CPU / i2c_clock_frequency) - 16) / 2;
	
	/* twi bit rate formula from atmega128 manual pg 204
	SCL Frequency = CPU Clock Frequency / (16 + (2 * TWBR))
	note: TWBR should be 10 or higher for master mode
	It is 72 for a 16mhz Wiring board with 100kHz TWI */
	
	// enable twi module, acks, and twi interrupt
	TWCR = _BV(TWEN) | _BV(TWIE) | _BV(TWEA);
}

// static const char* status_name(int status) {
// 	switch(TW_STATUS){
// 		default: return "BAD_STATE";		 
// 		case TW_START: return "TW_START";		 
// 		case TW_REP_START: return "TW_REP_START"; 
// 		case TW_MT_SLA_ACK: return "TW_MT_SLA_ACK";
// 		case TW_MT_DATA_ACK: return "TW_MT_DATA_ACK";
// 		case TW_MT_SLA_NACK: return "TW_MT_SLA_NACK"; 
// 		case TW_MT_DATA_NACK: return "TW_MT_DATA_NACK";
// 		case TW_MT_ARB_LOST: return "TW_MT_ARB_LOST"; 
// 		case TW_MR_DATA_ACK: return "TW_MR_DATA_ACK"; 
// 		case TW_MR_SLA_ACK: return "TW_MR_SLA_ACK";	
// 		case TW_MR_DATA_NACK: return "TW_MR_DATA_NACK"; 
// 		case TW_MR_SLA_NACK: return "TW_MR_SLA_NACK"; 
// 		case TW_SR_SLA_ACK: return "TW_SR_SLA_ACK";	 
// 		case TW_SR_GCALL_ACK: return "TW_SR_GCALL_ACK"; 
// 		case TW_SR_ARB_LOST_SLA_ACK: return "TW_SR_ARB_LOST_SLA_ACK";	 
// 		case TW_SR_ARB_LOST_GCALL_ACK: return "TW_SR_ARB_LOST_GCALL_ACK"; 
// 		case TW_SR_DATA_ACK: return "TW_SR_DATA_ACK";			 
// 		case TW_SR_GCALL_DATA_ACK: return "TW_SR_GCALL_DATA_ACK"; 
// 		case TW_SR_STOP: return "TW_SR_STOP"; 
// 		case TW_SR_DATA_NACK: return "TW_SR_DATA_NACK";			 
// 		case TW_SR_GCALL_DATA_NACK: return "TW_SR_GCALL_DATA_NACK"; 
// 		case TW_ST_SLA_ACK: return "TW_ST_SLA_ACK";					
// 		case TW_ST_ARB_LOST_SLA_ACK: return "TW_ST_ARB_LOST_SLA_ACK"; 
// 		case TW_ST_DATA_ACK: return "TW_ST_DATA_ACK"; 
// 		case TW_ST_DATA_NACK: return "TW_ST_DATA_NACK"; 
// 		case TW_ST_LAST_DATA: return "TW_ST_LAST_DATA"; 
// 		case TW_NO_INFO: return "TW_NO_INFO";	 
// 		case TW_BUS_ERROR: return "TW_BUS_ERROR"; 
// 	}
// }

[[gnu::always_inline]]
static void i2c_busy_wait() {
	// yield_to(tim::coro::Coroutine::main);
}

[[nodiscard, gnu::always_inline]]
static uint8_t wait_for_interrupt() {
	while((TWCR & _BV(TWINT)) == 0) {
		i2c_busy_wait();
	}
	return TW_STATUS;
}

[[nodiscard, gnu::always_inline]]
static uint8_t send_start_condition() {
	TWCR = _BV(TWINT) | _BV(TWSTA) | _BV(TWEN);
	return wait_for_interrupt();
}

[[gnu::always_inline]]
static void send_stop_condition() {
	TWCR = _BV(TWINT) | _BV(TWSTO) | _BV(TWEN);
}

[[gnu::always_inline]]
static void send_ack() {
	TWCR = _BV(TWINT) | _BV(TWEA) | _BV(TWEN);
}

[[gnu::always_inline]]
static void send_nack() {
	TWCR = _BV(TWINT) | _BV(TWEN);
}

[[gnu::always_inline]]
static void clear_interrupt() {
	TWCR = _BV(TWINT) | _BV(TWEN);
}

[[nodiscard, gnu::always_inline]]
static uint8_t become_master_reader(uint8_t addr) {
	TWDR = (addr << 1u) | TW_READ;
	clear_interrupt();
	return wait_for_interrupt();
}

struct ScopedI2CTransmission {

	~ScopedI2CTransmission() {
		send_stop_condition();
	}
};

template <size_t N, class ... Readings>
/* Called only when we're in master reader mode. */
[[gnu::always_inline]]
static Optional<LineSensorReadings> receive_readings(Readings ... readings) {
	// Do this for the first N - 1 samples; the last sample has slightly different logic.
	static_assert(N > 0u);
	constexpr auto reading_count = sizeof ... (readings);
	send_ack();
	if(wait_for_interrupt() != TW_MR_DATA_ACK) {
		// NACK'd or got some otherwise-unexpected status;
		// end the transmission and return error.
		return nullopt;
	}
	uint8_t next_reading = TWDR;
	if constexpr(reading_count != (N - 1u)) {
		send_ack();
		if(wait_for_interrupt() != TW_MR_DATA_ACK) {
			// NACK'd or got some otherwise-unexpected status;
			// end the transmission and return error.
			return nullopt;
		}
		(void)TWDR;
		// more readings; recurse.
		return receive_readings<N>(readings ..., next_reading);
	} else {
		send_nack();
		if(wait_for_interrupt() != TW_MR_DATA_NACK) {
			// NACK'd or got some otherwise-unexpected status;
			// end the transmission and return error.
			return nullopt;
		}
		(void)TWDR;
		// no more readings
		// throw out the last reading because the last sensor is broken :(
		return Optional{LineSensorReadings{readings ...}};
	}
}

[[nodiscard]]
Optional<LineSensorReadings> read_line_sensor() {
	constexpr uint8_t module_addr = 0x09u;
	goto first_attempt;
	do {
		// only yield *between* subsequent attempts 
		i2c_busy_wait();
	 first_attempt:
		// Send the start I2C condition.
		switch(send_start_condition()) {
		case TW_START:
		case TW_REP_START:
			// Good; started.
			break;
		case TW_MT_ARB_LOST:
			// Lost arbitration; need to try again.
			continue;
		default:	
			// Error; DON'T send the STOP condition because sending the START condition failed
			return nullopt;
		}

		// Destructor sends STOP condition.
		ScopedI2CTransmission transmission_;
		
		// Become the master reader with the line-follower module as a slave transmitter.
		switch(become_master_reader(module_addr)) {
		case TW_MR_SLA_ACK:
			// Got ACK back; proceed with receiving.
			break;
		case TW_MR_ARB_LOST:
			// Lost arbitration; need to try again.
			continue;
		case TW_MR_SLA_NACK:
		default:
			// NACK'd or got some otherwise-unexpected status;
			// end the transmission and return error.
			return nullopt;
		}
		// Now that we're the master reader, get the readings
		return receive_readings<8u>();
	} while(false);
	assert(false && "Unreachable.");
	return nullopt;
}


[[nodiscard]]
LineSensorReadings standardize_readings(
	LineSensorReadings readings,
	const SensorCalibration<uint8_t> (&calibrations)[7]
) {
	readings.r0 = calibrations[0].standardize(readings.r0, 0u, 255u);
	readings.r1 = calibrations[1].standardize(readings.r1, 0u, 255u);
	readings.r2 = calibrations[2].standardize(readings.r2, 0u, 255u);
	readings.r3 = calibrations[3].standardize(readings.r3, 0u, 255u);
	readings.r4 = calibrations[4].standardize(readings.r4, 0u, 255u);
	readings.r5 = calibrations[5].standardize(readings.r5, 0u, 255u);
	readings.r6 = calibrations[6].standardize(readings.r6, 0u, 255u);
	return readings;
}

void calibrate_line_sensor(SensorCalibration<uint8_t> (&calibrations)[7], int button_pin) {
	pinMode(13, OUTPUT);
	digitalWrite(13, HIGH);
	while(digitalRead(button_pin) == HIGH) {
		// wait for button press (starts calibration process)
	}
	digitalWrite(13, LOW);
	uint8_t minimums[7] = {255u, 255u, 255u, 255u, 255u, 255u, 255u};
	uint8_t maximums[7] = {0};
	delay(1000);
	while(digitalRead(button_pin) == HIGH) {
		auto readings = read_line_sensor();
		while(not readings) {
			readings = read_line_sensor();
		}
		for(uint8_t i = 0u; i < readings->size(); ++i) {
			auto value = (*readings)[i];
			auto& minm = minimums[i];
			auto& maxm = maximums[i];
			if(value < minm) {
				minm = value;
			} else if(value > maxm) {
				maxm = value;
			}
		}
	}
	for(uint8_t i = 0u; i < 7u; ++i) {
		calibrations[i] = SensorCalibration(minimums[i], maximums[i]);
	}
	digitalWrite(13, HIGH);
}

} /* namespace ino */


#include "i2c_line_follower.h"
#include <avr/io.h>
#include <avr/interrupt.h>
#include <compat/twi.h>
#include "Arduino.h" // for digitalWrite
#include "coro.h"

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

	ScopedI2CTransmission() {
		
	}

	~ScopedI2CTransmission() {
		send_stop_condition();
	}
};

/* Called only when we're master reader mode. */
static int8_t receive_readings(uint8_t (&readings)[8], float alpha) {
	// Do this for the first 7 samples; the last sample (16th byte) has slightly different logic.
	float alpha_inv = (1.0f - alpha);
	for(uint8_t i = 0u; i < 7u; ++i) {
		send_ack();
		if(wait_for_interrupt() != TW_MR_DATA_ACK) {
			// NACK'd or got some otherwise-unexpected status;
			// end the transmission and return error.
			return -1;
		}
		uint8_t byte = TWDR;
		readings[i] = alpha * byte + alpha_inv * readings[i];
		send_ack();
		if(wait_for_interrupt() != TW_MR_DATA_ACK) {
			// NACK'd or got some otherwise-unexpected status;
			// end the transmission and return error.
			return -1;
		}
		(void)TWDR;
	}
	// 15th byte do the same
	send_ack();
	if(wait_for_interrupt() != TW_MR_DATA_ACK) {
		// NACK'd or got some otherwise-unexpected status;
		// end the transmission and return error.
		return -1;
	}
	uint8_t byte = TWDR;
	readings[7] = alpha * byte + alpha_inv * readings[7];
	// last byte send NACK to terminate transmission.
	send_nack();
	if(wait_for_interrupt() != TW_MR_DATA_NACK) {
		// NACK'd or got some otherwise-unexpected status;
		// end the transmission and return error.
		return -1;
	}
	(void)TWDR;
	return 0;
}

[[nodiscard]]
int8_t update_readings(uint8_t (&readings)[8], float alpha) {
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
			return -1;
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
			return -1;
		}
		// Now that we're the master reader, get the readings
		return receive_readings(readings, alpha);
	} while(false);
	assert(false && "Unreachable.");
	return -1;
}

} /* namespace ino */


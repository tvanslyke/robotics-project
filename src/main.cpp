#include <Arduino.h>
#include <cstddef>
#include "coro.h"
#include "i2c_line_follower.h"
#include <limits.h>
#include "motor_control.h"
#include "PIDController.h"

using namespace tim::coro;

void printu8(uint8_t v) {
	char str[] = "000";
	switch(v / 100u) {
	case 0:
		str[0] = ' ';
		break;
	case 1:
		str[0] = '1';
		v -= 100;
		break;
	case 2:
		str[0] = '2';
		v -= 200;
		break;
	}
	auto quo = (v / 10u);
	str[1] = '0' + quo;
	v -= quo * 10u;
	if(str[0] == ' ' and str[1] == '0') {
		str[1] = ' ';
	}
	str[2] = '0' + (v % 10u);
	Serial.print(str);
}

void printu16(uint16_t v) {
	char str[] = "00000";
	uint16_t div = 10000ul;
	for(int i = 0; i < 5; ++i) {
		char& c = str[i];
		auto quo = (v / div);
		c = '0' + quo;
		v -= quo * div;
		div /= 10u;
	}
	for(char& c: str) {
		if(c != '0') {
			if(c == '\0') {
				(&c)[-1] = '0';
			}
			break;
		}
		c = ' ';
	}
	assert(v == 0u);
	Serial.print(str);
}

void printu32(uint32_t v) {
	char str[] = "0000000000";
	uint32_t div = 1000000000ull;
	for(int i = 0; i < (sizeof(str) - 1u); ++i) {
		char& c = str[i];
		uint32_t quo = (v / div);
		c = '0' + quo;
		v -= quo * div;
		div /= 10u;
	}
	for(char& c: str) {
		if(c != '0') {
			if(c == '\0') {
				(&c)[-1] = '0';
			}
			break;
		}
		c = ' ';
	}
	assert(v == 0u);
	Serial.print(str);
}


constexpr int8_t compute_error(const uint8_t (&readings)[8]) {
	constexpr int16_t maxm = -128;
	constexpr int16_t minm = 127;
	constexpr int16_t delta = (maxm - minm) / 6l;
	constexpr int16_t c0 = minm + delta * 0l;
	constexpr int16_t c1 = minm + delta * 1l;
	constexpr int16_t c2 = minm + delta * 2l;
	constexpr int16_t c3 = minm + delta * 3l;
	constexpr int16_t c4 = minm + delta * 4l;
	constexpr int16_t c5 = minm + delta * 5l;
	constexpr int16_t c6 = minm + delta * 6l;
	constexpr int16_t div = 256l * 7l;
	return static_cast<int8_t>((
		  c0 * readings[0]
		+ c1 * readings[1]
		+ c2 * readings[2]
		+ c3 * readings[3]
		+ c4 * readings[4]
		+ c5 * readings[5]
		+ c6 * readings[6]
	) / div);
}

void escape(void* p) {
	asm volatile("" : : "g"(p) : "memory");
}

static ino::PIDController<
	int32_t,
	int32_t,
	int32_t
> pid_control{};

constexpr ino::PIDCoeffs position_coeffs{2.0, 0.1, -3.0};

void setup() {
	Serial.begin(115200);
	Serial.println("Initializing...");
	Serial.flush();
	Serial.setTimeout(LONG_MAX);
	pinMode(8, INPUT_PULLUP);
	pinMode(13, OUTPUT);
	pinMode(A0, INPUT);
	ino::initialize_i2c();
	ino::left_motor_control.begin();
	ino::right_motor_control.begin();
	ino::setup_encoder_interrupts();
	// pinMode(2, INPUT);
	Serial.println("Done");
	Serial.flush();
}

static uint8_t readings[8] = {0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u};
static ino::SensorCalibration<uint8_t> calibrations[8] = {};

void loop() {
	using namespace ino;
	uint8_t speed = 0u;
	// ino::calibrate_line_sensor(calibrations, 8);
	while(true) {
		// ino::update_readings(readings);
		// ino::standardize_readings(readings, calibrations);
		// for(uint8_t i = 0; i < 7; ++i) {
		// 	printu8(readings[i]);
		// 	Serial.print(' ');
		// }
		// Serial.print(':');
		// Serial.println(compute_error(readings));
		
		// Serial.print(ino::right_motor_control.ticks());
		// Serial.print(' ');
		// Serial.println(ino::right_motor_control.ticks());
		// delay(10);
		// right_motor_control.set_speed(speed);
		// if(speed == 0u) {
		// 	right_motor_control.brake();
		// 	delay(1000);
		// 	right_motor_control.drive();
		// }
		// ++speed;
		Serial.print("ino> ");
		long setpoint = Serial.parseInt();
		while(Serial.available() > 0) {
			Serial.read();
		}
		for(;;) {
			auto ticks = ino::left_motor_control.ticks();
			int32_t error = setpoint - ticks;
			float pid_value = pid_control.update(error, position_coeffs);
			Serial.print("setpoint=");
			Serial.print(setpoint);
			Serial.print(", actual=");
			Serial.print(ticks);
			Serial.print(", actual2=");
			Serial.print(ino::right_motor_control.ticks());
			Serial.print(", pid=");
			Serial.print(pid_value);
			Serial.print(", lp1=");
			Serial.print(ino::get_pulse_width<5>());
			Serial.print(", lp2=");
			Serial.print(ino::get_pulse_width<10>());
			Serial.print(", rp1=");
			Serial.print(ino::get_pulse_width<6>());
			Serial.print(", rp2=");
			Serial.println(ino::get_pulse_width<9>());
			uint8_t pwm_value = 0;
			MotorDirection dir = MotorDirection::Forward;
			if(pid_value < 0.0f) {
				dir = MotorDirection::Forward;
				if(pid_value < -200.0f) {
					pwm_value = 200u;
				} else {
					pwm_value = static_cast<uint8_t>(-pid_value);
				}
			} else {
				dir = MotorDirection::Backward;
				if(pid_value > 200.0f) {
					pwm_value = 200u;
				} else {
					pwm_value = static_cast<uint8_t>(pid_value);
				}
			}
			left_motor_control.set_motion(dir, pwm_value);
			if(Serial.available() != 0) {
				Serial.println("Reading from serial!");
				setpoint = Serial.parseInt();
				while(Serial.available() > 0) {
					Serial.read();
				}
			}
		}
	}
}

int main(void)
{
	init();

#if defined(USBCON)
	USBDevice.attach();
#endif
	
	setup();
 	
	for (;;) {
		loop();
		if (serialEventRun) serialEventRun();
	}
        
	return 0;
}


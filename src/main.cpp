#include <Arduino.h>
#include <cstddef>
#include "coro.h"
#include "i2c_line_follower.h"
#include <limits.h>
#include "motor_control.h"
#include "PIDController.h"
#include "EEPROMHelpers.h"
#include "pid_debug.h"

using namespace tim::coro;
using namespace ino;

bool test() {
	return read_line_sensor();
}

constexpr int8_t compute_error(LineSensorReadings readings) {
	constexpr int32_t maxm = 127;
	constexpr int32_t minm = -128;
	constexpr int32_t delta = (maxm - minm) / 6l;
	constexpr int32_t c0 = minm + delta * 0l;
	constexpr int32_t c1 = minm + delta * 1l;
	constexpr int32_t c2 = minm + delta * 2l;
	constexpr int32_t c3 = minm + delta * 3l;
	constexpr int32_t c4 = minm + delta * 4l;
	constexpr int32_t c5 = minm + delta * 5l;
	constexpr int32_t c6 = minm + delta * 6l;
	constexpr int32_t div = 256l * 7l;
	return static_cast<int8_t>((
		  c0 * readings.r0
		+ c1 * readings.r1
		+ c2 * readings.r2
		+ c3 * readings.r3
		+ c4 * readings.r4
		+ c5 * readings.r5
		+ c6 * readings.r6
	) / div);
}

void escape(void* p) {
	asm volatile("" : : "g"(p) : "memory");
}

static ino::PIDController<int32_t, int32_t, int32_t> pid_control{};

static ino::PIDCoeffs coeffs{
	1.0,
	0.1,
	1.0
};

void setup() {
	Serial.begin(115200);
	//Serial.println("Initializing...");
	//Serial.flush();
	Serial.setTimeout(LONG_MAX);
	pinMode( 8, INPUT_PULLUP);
	pinMode(11, INPUT_PULLUP);
	pinMode(13, OUTPUT);
	pinMode(A0, INPUT);
	pinMode(A1, INPUT);
	pinMode(A2, INPUT);
	ino::initialize_i2c();
	ino::left_motor_control.begin();
	ino::right_motor_control.begin();
	ino::setup_encoder_interrupts();
	pinMode(A0, INPUT);
	pinMode(A1, INPUT);
	// Serial.println("Done");
	// Serial.flush();
}

// static uint8_t readings[8] = {0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u};
static ino::SensorCalibration<uint8_t> calibrations[7] = {};


enum class StopType: uint8_t {
	Full,
	Left,
	Right,
	Middle
};

[[nodiscard]]
bool check_stop_condition(LineSensorReadings readings, StopType tp, uint8_t cutoff) {
	switch(tp) {
	case StopType::Middle:
		for(uint8_t i = 2; i < 5u; ++i) {
			if(readings[i] < cutoff) {
				return false;
			}
		}
		return true;
	case StopType::Full:
		for(uint8_t i = 0; i < 7u; ++i) {
			if(readings[i] > cutoff) {
				return false;
			}
		}
		return true;
	case StopType::Left:
		for(uint8_t i = 0; i < 5u; ++i) {
			if(readings[i] > cutoff) {
				return false;
			}
		}
		for(uint8_t i = 6u; i < 7u; ++i) {
			if(readings[i] <= cutoff) {
				return false;
			}
		}
		return true;
	case StopType::Right:
		for(uint8_t i = 0u; i < readings.size(); ++i)  {
			Serial.print(i);
			Serial.print(' ');
		}
		Serial.println();
		for(uint8_t i = 0; i < 1u; ++i) {
			if(readings[i] <= cutoff) {
				return false;
			}
		}
		for(uint8_t i = 2u; i < 7u; ++i) {
			if(readings[i] > cutoff) {
				return false;
			}
		}
		return true;
	}
}

void move_until(StopType type) {
	constexpr uint8_t base_speed = 60u;
	for(;;) {
		auto readings = ino::standardize_readings(read_line_sensor(unravel), calibrations);
		auto err = compute_error(readings);
		bool is_left = err < 0;
		auto speed = base_speed;
		
		MotorDirection dir = MotorDirection::Forward;
		auto pid_val = pid_control.update(err, coeffs);
		err = static_cast<int8_t>(pid_val < -128 ? -128 : pid_val > 127 ? 127 : pid_val);
		uint8_t left_motor_speed = base_speed;
		uint8_t right_motor_speed = base_speed;
		if(is_left) {
			uint8_t abs_err = -err;
			if(abs_err > base_speed) {
				abs_err = base_speed;
			}
			left_motor_speed -= abs_err / 2;
			right_motor_speed -= abs_err / 2;
			left_motor_speed += abs_err / 2;
			right_motor_speed -= abs_err / 2;
			
		} else {
			uint8_t abs_err = err;
			if(abs_err > base_speed) {
				abs_err = base_speed;
			}
			left_motor_speed -= abs_err / 2;
			right_motor_speed -= abs_err / 2;
			right_motor_speed += abs_err / 2;
			left_motor_speed -= abs_err / 2;
		}
		left_motor_control.set_motion(MotorDirection::Forward, left_motor_speed);
		right_motor_control.set_motion(MotorDirection::Forward, right_motor_speed);
		if(check_stop_condition(readings, type, 30u)) {
			left_motor_control.brake();
			right_motor_control.brake();
			break;
		}
		// } else if(check_stop_condition(readings, StopType::Middle, 30u)) {
		// 	if(is_left) {
		// 		right_motor_control.set_motion(MotorDirection::Forward, 100u);
		// 	} else {
		// 		left_motor_control.set_motion(MotorDirection::Forward, 100u);
		// 	}
		// 	while(check_stop_condition(readings, StopType::Middle, 30u)) {
		// 		
		// 	}
		// 	left_motor_control.brake();
		// 	right_motor_control.brake();
		// }
		// for(uint8_t i = 0; i < 7; ++i) {
		// 	auto r = readings[i];
		// 	Serial.print(r);
		// 	Serial.print(' ');
		// }
		// Serial.println();
	}
}

template <class MC>
void turn_steps(MC& motor_controller, uint8_t step_count) {
	auto target = motor_controller.ticks() + step_count;
	motor_controller.set_motion(MotorDirection::Forward, 90u);
	while(motor_controller.ticks() < target) {
		
	}
	motor_controller.brake();
}

void move_absolute(uint16_t step_count, MotorDirection dir = MotorDirection::Forward, uint8_t speed = 70) {
	auto l_target = left_motor_control.ticks();
	auto r_target = right_motor_control.ticks();
	if(dir == MotorDirection::Forward) {
		l_target += step_count;
		r_target += step_count;
	} else {
		l_target -= step_count;
		r_target -= step_count;
	}
	left_motor_control.set_motion(dir, speed);
	right_motor_control.set_motion(dir, speed);
	while(true) {
		if(left_motor_control.ticks() >= l_target) {
			left_motor_control.brake();
			if(right_motor_control.ticks() >= r_target) {
				right_motor_control.brake();
				return;
			}
		} else if(right_motor_control.ticks() >= r_target) {
			right_motor_control.brake();
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

	Serial.print("Stored:   ");
	pid_debug::load_coeffs().show();
	Serial.print("Measured: ");
	pid_debug::read_pot_coeffs().show();
 	
	ino::calibrate_line_sensor(calibrations, 8);

	coeffs = pid_debug::read_pot_coeffs();
	pid_debug::store_coeffs(coeffs);

	// while(true) {
	// 	auto readings = read_line_sensor(unravel);
	// 	for(uint8_t i = 0u; i < readings.size(); ++i) {
	// 		auto reading = readings[i];
	// 		char buff[4];
	// 		snprintf(buff, sizeof(buff), "%3d", static_cast<int>(reading));
	// 		Serial.print(buff);
	// 		Serial.print(' ');
	// 	}
	// 	Serial.print(':');
	// 	Serial.print(compute_error(readings));
	// 	Serial.println("");
	// }

	// while(true) {
	// 	turn_steps(left_motor_control, 40u);
	// 	turn_steps(right_motor_control, 40u);
	// }

	move_until(StopType::Left);
	move_absolute(10u);
	turn_steps(left_motor_control, 15u);
	move_until(StopType::Left);
	move_absolute(5u);
	turn_steps(right_motor_control, 40u);
	// move_absolute(20u);
	move_until(StopType::Right);
	
	move_absolute(5u);
	turn_steps(left_motor_control, 30u);
	
	move_until(StopType::Full);
	move_absolute(10u);
	move_until(StopType::Left);
	turn_steps(right_motor_control, 30u);
	move_until(StopType::Left);
	move_absolute(10u);
	move_until(StopType::Left);
	// move_absolute(10u);
	turn_steps(right_motor_control, 40u);
	move_until(StopType::Full);
	// move_absolute(10u);
	// turn_steps(right_motor_control, 40u);
	// move_until(StopType::Left);
	
	for(;;){}
	return 0;
}


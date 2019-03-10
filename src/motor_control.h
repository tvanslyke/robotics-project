#ifndef INO_MOTOR_CONTROL_H
#define INO_MOTOR_CONTROL_H
#include <avr/interrupt.h>
#include <stdint.h>
#include <Arduino.h>
#include "static_pinio.h"


extern "C" void __vector_1(void);
extern "C" void __vector_2(void);

namespace ino {

extern uint32_t int_count;

enum class MotorDirection: bool {
	Backward,
	Forward
};

void setup_encoder_interrupts();

template <uint8_t ForwardPin, uint8_t BackwardPin>
struct DRV8833MotorControl {
	static_assert(ForwardPin <= 13u);
	static_assert(BackwardPin <= 13u);
	static_assert(ForwardPin != BackwardPin);

	using ticks_t = int32_t;

	void begin() {
		set_pin_mode<ForwardPin, OUTPUT>();
		set_pin_mode<BackwardPin, OUTPUT>();
		set_forward_speed(0u);
		set_backward_speed(0u);
		start_pwm<ForwardPin>();
		start_pwm<BackwardPin>();
		direction_ = MotorDirection::Forward;
	}

	void brake() const {
		set_forward_speed(0);
		set_backward_speed(0);
		wait_until_stopped();
	}

	void wait_until_stopped() const {
		auto prev_ticks = ticks();
		for(;;) {
			delay(1);
			auto curr_ticks = ticks();
			// wait until the motor halts.
			if(curr_ticks == prev_ticks) {
				break;
			}
			prev_ticks = curr_ticks;
		}
	}

	static void coast() {
		set_forward_speed(255u);
		set_backward_speed(255u);
	}

	static void set_forward_speed(uint8_t speed) {
		set_pulse_width<ForwardPin>(255u - speed);
	}

	static void set_backward_speed(uint8_t speed) {
		set_pulse_width<BackwardPin>(255u - speed);
	}

	void set_motion(MotorDirection dir, uint8_t speed) {
		switch(dir) {
		case MotorDirection::Forward:
			switch(travel_direction()) {
				break;
			case MotorDirection::Backward:
				brake();
				direction_ = MotorDirection::Forward;
				[[fallthrough]]
			case MotorDirection::Forward:
				set_forward_speed(speed);
				break;
			}
			break;
		case MotorDirection::Backward:
			switch(travel_direction()) {
			case MotorDirection::Forward:
				brake();
				direction_ = MotorDirection::Backward;
				[[fallthrough]]
			case MotorDirection::Backward:
				set_backward_speed(speed);
				break;
			}
			break;
		}
	}

	MotorDirection travel_direction() const {
		return direction_;
	}

	const volatile ticks_t& ticks() const { return ticks_; }

private:

	void step() {
		// volatile uint8_t&  *reinterpret_cast<volatile uint8_t*>(&ticks_);
		if(travel_direction() == MotorDirection::Forward) {
			++ticks_;
		} else if(travel_direction() == MotorDirection::Backward) {
			--ticks_;
		}
	}

	friend void ::__vector_1(void);
	friend void ::__vector_2(void);
	// Net number of encoder ticks.  This gets modified by the PCINT2 interrupt
	// in motor_control.cpp.
	volatile ticks_t ticks_ = 0;
	MotorDirection direction_ = MotorDirection::Forward;
};

extern DRV8833MotorControl<5, 10> left_motor_control;
extern DRV8833MotorControl<6, 9> right_motor_control;

} /* namespace ino */

#endif /* INO_MOTOR_CONTROL_H */

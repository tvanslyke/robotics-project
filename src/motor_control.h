#ifndef INO_MOTOR_CONTROL_H
#define INO_MOTOR_CONTROL_H
#include <avr/interrupt.h>
#include <stdint.h>
#include <Arduino.h>


extern "C" void __vector_5(void);
namespace ino {

enum class MotorDirection: bool {
	Forward,
	Backward
};

inline constexpr uint8_t digital_pin_to_timer[] = {
	NOT_ON_TIMER, /* 0 - port D */
	NOT_ON_TIMER,
	NOT_ON_TIMER,
	// on the ATmega168, digital pin 3 has hardware pwm
#if defined(__AVR_ATmega8__)
	NOT_ON_TIMER,
#else
	TIMER2B,
#endif
	NOT_ON_TIMER,
	// on the ATmega168, digital pins 5 and 6 have hardware pwm
#if defined(__AVR_ATmega8__)
	NOT_ON_TIMER,
	NOT_ON_TIMER,
#else
	TIMER0B,
	TIMER0A,
#endif
	NOT_ON_TIMER,
	NOT_ON_TIMER, /* 8 - port B */
	TIMER1A,
	TIMER1B,
#if defined(__AVR_ATmega8__)
	TIMER2,
#else
	TIMER2A,
#endif
	NOT_ON_TIMER,
	NOT_ON_TIMER,
	NOT_ON_TIMER,
	NOT_ON_TIMER, /* 14 - port C */
	NOT_ON_TIMER,
	NOT_ON_TIMER,
	NOT_ON_TIMER,
	NOT_ON_TIMER,
};

inline bool digitalReadFast(int pin) {
	switch(pin) {
	default:
		return false;
	case  0:
	case  1:
	case  2:
	case  3:
	case  4:
	case  5:
	case  6:
	case  7:
		return ((static_cast<uint8_t>(PIND) >> pin) & 1u) == 1u;
	case  8:
	case  9:
	case 10:
	case 11:
	case 12:
	case 13:
		return ((static_cast<uint8_t>(PINB) >> (pin - 8)) & 1u) == 1u;
	case A0:
	case A1:
	case A2:
	case A3:
	case A4:
	case A5:
	case A6:
	case A7:
		return ((static_cast<uint8_t>(PINC) >> (pin - A0)) & 1u) == 1u;
	}
}

inline bool digitalWriteValue(int pin) {
	switch(pin) {
	default:
		return false;
	case 0:
	case 1:
	case 2:
	case 3:
	case 4:
	case 5:
	case 6:
	case 7:
		return ((static_cast<uint8_t>(PORTD) >> pin) & 1u) == 1u;
	case 8:
	case 9:
	case 10:
	case 11:
	case 12:
	case 13:
		return ((static_cast<uint8_t>(PORTB) >> (pin - 8)) & 1u) == 1u;
	case A0:
	case A1:
	case A2:
	case A3:
	case A4:
	case A5:
	case A6:
	case A7:
		return ((static_cast<uint8_t>(PORTC) >> (pin - A0)) & 1u) == 1u;
	}
}

template <int Pin>
auto analogWriteValue() {
	constexpr auto timer = digital_pin_to_timer[Pin];
	// XXX fix needed for atmega8
	if constexpr(false) {
		/* DUMMY CASE */
	}
	#if defined(TCCR0) && defined(COM00) && !defined(__AVR_ATmega8__)
	else if constexpr(timer == TIMER0A) {
		return OCR0;
	}
	#endif

	#if defined(TCCR0A) && defined(COM0A1)
	else if constexpr(timer == TIMER0A) {
		return OCR0A;
	}
	#endif

	#if defined(TCCR0A) && defined(COM0B1)
	else if constexpr(timer == TIMER0B) {
		return OCR0B;
	}
	#endif

	#if defined(TCCR1A) && defined(COM1A1)
	else if constexpr(timer == TIMER1A) {
		return OCR1A;
	}
	#endif

	#if defined(TCCR1A) && defined(COM1B1)
	else if constexpr(timer == TIMER1B) {
		return OCR1B;
	}
	#endif

	#if defined(TCCR2) && defined(COM21)
	else if constexpr(timer == TIMER2) {
		return OCR2;
	}
	#endif

	#if defined(TCCR2A) && defined(COM2A1)
	else if constexpr(timer == TIMER2A) {
		return OCR2A;
	}
	#endif

	#if defined(TCCR2A) && defined(COM2B1)
	else if constexpr(timer == TIMER2B) {
		return OCR2B;
	}
	#endif

	#if defined(TCCR3A) && defined(COM3A1)
	else if constexpr(timer == TIMER3A) {
		return OCR3A;
	}
	#endif

	#if defined(TCCR3A) && defined(COM3B1)
	else if constexpr(timer == TIMER3B) {
		return OCR3B;
	}
	#endif

	#if defined(TCCR3A) && defined(COM3C1)
	else if constexpr(timer == TIMER3C) {
		return OCR3C;
	}
	#endif

	#if defined(TCCR4A)
	else if constexpr(timer == TIMER4A) {
		return OCR4A;
	}
	#endif
	
	#if defined(TCCR4A) && defined(COM4B1)
	else if constexpr(timer == TIMER4B) {
		return OCR4B;
	}
	#endif

	#if defined(TCCR4A) && defined(COM4C1)
	else if constexpr(timer == TIMER4C) {
		return OCR4C;
	}
	#endif
		
	#if defined(TCCR4C) && defined(COM4D1)
	else if constexpr(timer == TIMER4D) {				
		return OCR4D;
	}
	#endif
					
	#if defined(TCCR5A) && defined(COM5A1)
	else if constexpr(timer == TIMER5A) {
		return OCR5A;
	}
	#endif

	#if defined(TCCR5A) && defined(COM5B1)
	else if constexpr(timer == TIMER5B) {
		return OCR5B;
	}
	#endif

	#if defined(TCCR5A) && defined(COM5C1)
	else if constexpr(timer == TIMER5C) {
		return OCR5C;
	}
	#endif
	else {
		static_assert(
			timer != NOT_ON_TIMER,
			"Not a PWM pin."
		);
	}
}
	
void setup_encoder_interrupts();
extern uint32_t interrupt_count;

template <uint8_t PWMPin, uint8_t SetDirPin, uint8_t GetDirPin>
struct DRV8833MotorControl {
	static_assert(PWMPin <= 13u);
	static_assert(SetDirPin <= 13u);
	static_assert(GetDirPin <= 13u);
	static_assert(PWMPin != SetDirPin);
	static_assert(PWMPin != GetDirPin);
	static_assert(digital_pin_to_timer[PWMPin] != NOT_ON_TIMER, "PWM pin doesn't have PWM!");

	using ticks_t = int32_t;

	void begin() const {
		pinMode(PWMPin, OUTPUT);
		pinMode(SetDirPin, OUTPUT);
		pinMode(GetDirPin, INPUT_PULLUP);
	}

	void brake() const {
		digitalWrite(PWMPin, HIGH);
		digitalWrite(SetDirPin, HIGH);
	}

	void set_speed(uint8_t speed) {
		analogWrite(PWMPin, speed);
	}

	void set_direction(MotorDirection dir) {
		switch(dir) {
		case MotorDirection::Forward:
			digitalWrite(SetDirPin, HIGH);
			break;
		case MotorDirection::Backward:
			digitalWrite(SetDirPin, LOW);
			break;
		}
	}

	MotorDirection travel_direction() const {
		if(digitalReadFast(GetDirPin)) {
			return MotorDirection::Backward;
		} else {
			return MotorDirection::Forward;
		}
	}

	const volatile ticks_t& ticks() const { return ticks_; }

private:

	void step() {
		switch(travel_direction()) {
		case MotorDirection::Forward:
			++ticks_;
			break;
		case MotorDirection::Backward:
			--ticks_;
			break;
		}
	}

	friend void ::__vector_5(void);
	volatile ticks_t ticks_ = 0;
};

extern DRV8833MotorControl<5, 4, 10> left_motor_control;
extern DRV8833MotorControl<6, 7, 11> right_motor_control;

} /* namespace ino */

#endif /* INO_MOTOR_CONTROL_H */

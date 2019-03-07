#include "motor_control.h"
#include <avr/interrupt.h>
#include <Arduino.h>
#include "static_pinio.h"


ino::DRV8833MotorControl<5, 10> ino::left_motor_control{};
ino::DRV8833MotorControl<6, 9> ino::right_motor_control{};


void ino::setup_encoder_interrupts() {
	// disable interrupts
	EIMSK &= 0b00000000u;
	// Configure pins 2 and 3 as inputs
	set_pin_mode<2, INPUT>();
	set_pin_mode<3, INPUT>();
	// configure interrupts to fire on any logic-level change
	EICRA = 0b00000101u;
	// enable interrupts
	EIMSK = 0b00000011u;
}

uint32_t ino::int_count = 0;
// Pin change interrupt for pins 0 through 7.
ISR(INT0_vect) {
	ino::left_motor_control.step();
}

ISR(INT1_vect) {
	ino::right_motor_control.step();
}


// ISR(PCINT2_vect) {
// 	using namespace ino;
// 
// 	// Get PIND register.
// 	uint8_t pind = PIND;
// 	uint8_t pind_old = pind_prev;
// 	pind_prev = pind;
// 	// XOR with the previous value to see which pins have changed.
// 	uint8_t diff = (pind_old ^ pind);
// 	// If pin 2 changed, increment/decrement the tick count for the left motor.
// 	switch(diff & static_cast<uint8_t>(0b00001100u)) {
// 	default:
// 		__builtin_unreachable();
// 	case 0b00000100u:
// 		left_motor_control.step();
// 		return;
// 	case 0b00001000u:
// 		right_motor_control.step();
// 		return;
// 	case 0b00001100u:
// 		left_motor_control.step();
// 		right_motor_control.step();
// 		return;
// 	}
// 	// if((diff & 0b00000100u) != 0u) {
// 	// 	left_motor_control.step();
// 	// }
// 	// // If pin 3 changed, increment/decrement the tick count for the right motor.
// 	// if((diff & 0b00001000u) != 0u) {
// 	// 	right_motor_control.step();
// 	// }
// 	// // Set up for the next time the interrupt gets triggered.
// 	// pind_old = pind;
// }







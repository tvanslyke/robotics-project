#include "motor_control.h"
#include <avr/interrupt.h>
#include <Arduino.h>


ino::DRV8833MotorControl<5, 4, 10> ino::left_motor_control{};
ino::DRV8833MotorControl<6, 7, 11> ino::right_motor_control{};

uint32_t ino::interrupt_count = 0u;
static uint8_t pind_old = 0u;

void ino::setup_encoder_interrupts() {
	PCICR &= 0b11111011u;
	PCMSK2 = 0b00001100u;
	pinMode(2, INPUT);//INPUT_PULLUP);
	pinMode(3, INPUT);//INPUT_PULLUP);
	pind_old = PIND;
	PCICR |= 0b00000100u;
}

ISR(PCINT2_vect) {
	using namespace ino;

	uint8_t pind = PIND;
	uint8_t diff = (pind_old ^ pind);
	if((diff & 0b00000100u) != 0u) {
		left_motor_control.step();
	}
	if((diff & 0b00001000u) != 0u) {
		right_motor_control.step();
	}
	pind_old = pind;
	++ino::interrupt_count;
}

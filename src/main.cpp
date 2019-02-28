#include <Arduino.h>
#include <cstddef>
#include "coro.h"
#include "i2c_line_follower.h"
#include "Stepper.h"
#include <limits.h>
#include "motor_control.h"

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

void setup() {
	Serial.begin(115200);
	Serial.println("Initializing...");
	Serial.flush();
	Serial.setTimeout(LONG_MAX);
	ino::initialize_i2c();
	ino::left_motor_control.begin();
	ino::right_motor_control.begin();
	ino::setup_encoder_interrupts();
}

static uint8_t readings[8] = {0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u};
void loop() {
	while(true) {
		// Serial.print(ino::left_motor_control.ticks());
		// Serial.print(' ');
		// Serial.println(ino::right_motor_control.ticks());
		Serial.print(ino::interrupt_count);
		Serial.print(' ');
		Serial.print(ino::left_motor_control.ticks());
		Serial.print(' ');
		Serial.println(ino::right_motor_control.ticks());
	}
	// Serial.print(stepper.position());
	// Serial.print("> ");
	// long val = Serial.parseInt();
	// if(val < 0 or val > 99) {
	// 	Serial.println("Bad position");
	// } else {
	// 	stepper.set_position(val);
	// }
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


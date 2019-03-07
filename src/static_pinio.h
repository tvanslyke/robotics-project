#ifndef INO_STATIC_PINIO_H
#define INO_STATIC_PINIO_H

#include <Arduino.h>
#include "RegisterPtr.h"

namespace ino {

enum class HardwareTimer: uint8_t {
	NoTimer,
	Timer0A, 
	Timer0B,
	Timer1A,
	Timer1B,
	Timer2A,
	Timer2B
};

namespace detail {
inline constexpr HardwareTimer digital_pin_to_timer[] = {
	HardwareTimer::NoTimer, /* 0 - port D */
	HardwareTimer::NoTimer,
	HardwareTimer::NoTimer,
	HardwareTimer::NoTimer,
	HardwareTimer::NoTimer,
	HardwareTimer::NoTimer,
	HardwareTimer::NoTimer, /* 14 - port C */
	HardwareTimer::NoTimer,
	HardwareTimer::NoTimer,
	HardwareTimer::NoTimer,
	HardwareTimer::NoTimer,
};

} /* namespace detail */

template <uint8_t Pin>
inline constexpr auto output_register = [](){
	if constexpr(Pin <= 7u) {
		// PORTD
		return RegisterPtr<uint8_t, 43u>{};
	} else if constexpr(Pin <= 13u) {
		// PORTB
		return RegisterPtr<uint8_t, 37u>{};
	} else {
		// PORTC
		static_assert(Pin <= A7, "Invalid pin number.");
		return RegisterPtr<uint8_t, 40u>{};
	}
}();

template <uint8_t Pin>
inline constexpr auto data_direction_register = [](){
	if constexpr(Pin <= 7u) {
		// DDRD
		return RegisterPtr<uint8_t, 42u>{};
	} else if constexpr(Pin <= 13u) {
		// DDRB
		return RegisterPtr<uint8_t, 36u>{};
	} else {
		// DDRC
		static_assert(Pin <= A7, "Invalid pin number.");
		return RegisterPtr<uint8_t, 39u>{};
	}
}();

template <uint8_t Pin>
inline constexpr auto input_register = [](){
	if constexpr(Pin <= 7u) {
		// DDRD
		return RegisterPtr<uint8_t, 41u>{};
	} else if constexpr(Pin <= 13u) {
		// DDRB
		return RegisterPtr<uint8_t, 35u>{};
	} else {
		// DDRC
		static_assert(Pin <= A7, "Invalid pin number.");
		return RegisterPtr<uint8_t, 38u>{};
	}
}();

template <uint8_t Pin>
inline constexpr auto bit_position = [](){
	if constexpr(Pin <= 7u) {
		// DDRD
		return Pin;
	} else if constexpr(Pin <= 13u) {
		// DDRB
		return Pin - 8u;
	} else {
		// DDRC
		static_assert(Pin <= A7, "Invalid pin number.");
		return Pin - A0;
	}
}();

/** Timer/Counter control registers for 8-bit and 16-bit timers. */
inline constexpr auto timer_control_register_0A = RegisterPtr<uint8_t, 0x44>{};
// inline constexpr auto timer_control_register_0B = RegisterPtr<uint8_t, 0x45>{}; 

inline constexpr auto timer_control_register_1A = RegisterPtr<uint8_t, 0x80>{};
// inline constexpr auto timer_control_register_1B = RegisterPtr<uint8_t, 0x81>{}; 

inline constexpr auto timer_control_register_2A = RegisterPtr<uint8_t, 0xB0>{};
// inline constexpr auto timer_control_register_2B = RegisterPtr<uint8_t, 0xB1>{}; 

/** Output compare registers for 8-bit and 16-bit timers. */
inline constexpr auto output_compare_register_0A = RegisterPtr<uint8_t, 71>{};
inline constexpr auto output_compare_register_0B = RegisterPtr<uint8_t, 72>{}; 

inline constexpr auto output_compare_register_1A = RegisterPtr<uint16_t, 0x88>{};
inline constexpr auto output_compare_register_1B = RegisterPtr<uint16_t, 0x8A>{}; 

inline constexpr auto output_compare_register_2A = RegisterPtr<uint8_t, 0xB3>{};
inline constexpr auto output_compare_register_2B = RegisterPtr<uint8_t, 0xB4>{};

template <uint8_t Pin>
inline constexpr auto timer_control_register = []() {
	if constexpr(Pin == 3) {
		return timer_control_register_2A;
	} else if constexpr(Pin == 5) {
		return timer_control_register_0A;
	} else if constexpr(Pin == 6) {
		return timer_control_register_0A;
	} else if constexpr(Pin == 9) {
		return timer_control_register_1A;
	} else if constexpr(Pin == 10) {
		return timer_control_register_1A;
	} else if constexpr(Pin == 11) {
		return timer_control_register_2A;
	} else {
		return ino::RegisterPtr<uint8_t, 0u>{};
	}
}();

template <uint8_t Pin>
inline constexpr auto output_compare_register = []() {
	if constexpr(Pin == 3) {
		return output_compare_register_2A;
	} else if constexpr(Pin == 5) {
		return output_compare_register_0B;
	} else if constexpr(Pin == 6) {
		return output_compare_register_0A;
	} else if constexpr(Pin == 9) {
		return output_compare_register_1A;
	} else if constexpr(Pin == 10) {
		return output_compare_register_1B;
	} else if constexpr(Pin == 11) {
		return output_compare_register_2B;
	} else {
		return ino::RegisterPtr<uint8_t, 0u>{};
	}
}();

template <uint8_t Pin>
inline constexpr uint8_t timer_pwm_enable_bit = []() {
	if constexpr(Pin == 3) {
		return COM2A1; // output_compare_register_2A;
	} else if constexpr(Pin == 5) {
		return COM0B1; // output_compare_register_0B;
	} else if constexpr(Pin == 6) {
		return COM0A1; // output_compare_register_0A;
	} else if constexpr(Pin == 9) {
		return COM1A1; // output_compare_register_1A;
	} else if constexpr(Pin == 10) {
		return COM1B1; // output_compare_register_1B;
	} else if constexpr(Pin == 11) {
		return COM2B1; // output_compare_register_2B;
	} else {
		static_assert(Pin and false, "Given pin is not PWM-enabled.");
	}
}();

template <uint8_t Pin>
bool digital_read_fast() {
	constexpr auto input_reg = input_register<Pin>;
	constexpr auto bitpos = bit_position<Pin>;
	return (*input_reg & (1u << bitpos)) != 0u;
}

template <uint8_t Pin, int Mode>
void set_pin_mode() {
	constexpr auto ddr = data_direction_register<Pin>;
	constexpr auto bitpos = bit_position<Pin>;
	constexpr uint8_t mask = (1u << bitpos);
	constexpr uint8_t nmask = ~mask;
	if constexpr(Mode == INPUT) {
		constexpr auto output_reg = output_register<Pin>;
		*ddr &= nmask;
		*output_reg &= nmask;
	} else if constexpr(Mode == INPUT_PULLUP) {
		constexpr auto output_reg = output_register<Pin>;
		*ddr &= nmask;
		*output_reg |= 1u << bitpos;
	} else {
		static_assert(Mode == OUTPUT, "Invalid pin mode.");
		*ddr |= mask;
	}
	
}

template <uint8_t Pin, bool Value>
void digital_write_fast() {
	constexpr auto output_reg = output_register<Pin>;
	constexpr auto bitpos = bit_position<Pin>;
	if constexpr(Value) {
		*output_reg |= (1u << bitpos);
	} else {
		*output_reg &= ~(1u << bitpos);
	}
}

template <uint8_t Pin>
void digital_write_fast(bool value) {
	if(value) {
		digital_write_fast<Pin, true>();
	} else {
		digital_write_fast<Pin, false>();
	}
}

template <int Pin>
void start_pwm() {
	constexpr auto ctrl = timer_control_register<Pin>;
	*ctrl |= (1u << timer_pwm_enable_bit<Pin>); 
}

template <int Pin>
bool pwm_is_active() {
	constexpr auto ctrl = timer_control_register<Pin>;
	return (*ctrl & (1u << timer_pwm_enable_bit<Pin>)) != 0u; 
}

template <int Pin>
void stop_pwm() {
	constexpr auto ctrl = timer_control_register<Pin>;
	*ctrl &= ~(1u << timer_pwm_enable_bit<Pin>); 
}

template <int Pin>
void set_pulse_width(uint8_t value) {
	constexpr auto cmp = output_compare_register<Pin>;
	*cmp = value;
}

template <int Pin>
uint8_t get_pulse_width() {
	constexpr auto cmp = output_compare_register<Pin>;
	return *cmp;
}


} /* namespace ino */

#endif /* INO_STATIC_PINIO_H */

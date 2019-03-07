#include <Arduino.h>


int test() {
	// #if defined(TCCR0) && defined(COM00) && !defined(__AVR_ATmega8__)
	// {
	// 	constexpr auto* p = &OCR0;
	// }
	// #endif

	// #if defined(TCCR0A) && defined(COM0A1)
	// {
	// 	constexpr auto* p = &OCR0A;
	// }
	// #endif

	// #if defined(TCCR0A) && defined(COM0B1)
	// {
	// 	constexpr auto* p = &OCR0B;
	// }
	// #endif

	// #if defined(TCCR1A) && defined(COM1A1)
	// {
	// 	constexpr auto* p = reinterpret_cast<volatile uint16_t>(&OCR1A);
	// }
	// #endif

	// #if defined(TCCR1A) && defined(COM1B1)
	// {
	// 	constexpr auto* p = &OCR1B;
	// }
	// #endif

	// #if defined(TCCR2) && defined(COM21)
	// {
	// 	constexpr auto* p = &OCR2;
	// }
	// #endif

	// #if defined(TCCR2A) && defined(COM2A1)
	// {
	// 	constexpr auto* p = &OCR2A;
	// }
	// #endif

	// #if defined(TCCR2A) && defined(COM2B1)
	// {
	// 	constexpr auto* p = &OCR2B;
	// }
	// #endif

	// #if defined(TCCR3A) && defined(COM3A1)
	// {
	// 	constexpr auto* p = &OCR3A;
	// }
	// #endif

	// #if defined(TCCR3A) && defined(COM3B1)
	// {
	// 	constexpr auto* p = &OCR3B;
	// }
	// #endif

	// #if defined(TCCR3A) && defined(COM3C1)
	// {
	// 	constexpr auto* p = &OCR3C;
	// }
	// #endif

	// #if defined(TCCR4A)
	// {
	// 	constexpr auto* p = &OCR4A;
	// }
	// #endif
	// 
	// #if defined(TCCR4A) && defined(COM4B1)
	// {
	// 	constexpr auto* p = &OCR4B;
	// }
	// #endif

	// #if defined(TCCR4A) && defined(COM4C1)
	// {
	// 	constexpr auto* p = &OCR4C;
	// }
	// #endif
	// 	
	// #if defined(TCCR4C) && defined(COM4D1)
	// {				
	// 	constexpr auto* p = &OCR4D;
	// }
	// #endif
	// 				
	// #if defined(TCCR5A) && defined(COM5A1)
	// {
	// 	constexpr auto* p = &OCR5A;
	// }
	// #endif

	// #if defined(TCCR5A) && defined(COM5B1)
	// {
	// 	constexpr auto* p = &OCR5B;
	// }
	// #endif

	// #if defined(TCCR5A) && defined(COM5C1)
	// {
	// 	constexpr auto* p = &OCR5C;
	// }
	// #endif

	constexpr auto* p = reinterpret_cast<volatile uint8_t*>(&TCCR0A);

}






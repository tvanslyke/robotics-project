#ifndef INO_EEPROM_HELPERS_H
#define INO_EEPROM_HELPERS_H

#include <EEPROM/EEPROM.h>
#include <string.h>

namespace ino {

template <class T, uint16_t Addr>
T eeprom_read_value() {
	static_assert(Addr < 1024u);
	static_assert((1024u - Addr) >= sizeof(T));
	T value;
	char buff[sizeof(T)];
	for(size_t i = 0u; i < sizeof(T); ++i) {
		buff[i] = EEPROM.read(Addr + i);
	}
	memcpy(&value, buff, sizeof(value));
	return value;
}

template <uint16_t Addr, class T>
void eeprom_write_value(const T& value) {
	static_assert(Addr < 1024u);
	static_assert((1024u - Addr) >= sizeof(T));
	const char* p = reinterpret_cast<const char*>(&value);
	for(size_t i = 0u; i < sizeof(T); ++i) {
		EEPROM.write(Addr + i, static_cast<uint8_t>(p[i]));
	}
}

} /* namespace ino */

#endif /* INO_EEPROM_HELPERS_H */

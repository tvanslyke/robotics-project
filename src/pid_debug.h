#ifndef INO_PID_DEBUG_H
#define INO_PID_DEBUG_H

#include "PIDController.h"
#include "EEPROMHelpers.h"

namespace ino::pid_debug {

inline constexpr uint16_t coeffs_addr = 0u;

inline constexpr float p_max = 4.0;
inline constexpr float i_max = 0.5;
inline constexpr float d_max = 3.0;


inline PIDCoeffs load_coeffs() {
	return eeprom_read_value<PIDCoeffs, coeffs_addr>();
}

inline void store_coeffs(PIDCoeffs coeffs) {
	eeprom_write_value<coeffs_addr>(coeffs);
}

inline PIDCoeffs read_pot_coeffs() {
	float p = analogRead(A0);
	float i = analogRead(A1);
	float d = analogRead(A2);
	return PIDCoeffs{
		(p_max * p) / 1023.0,
		(i_max * i) / 1023.0,
		(d_max * d) / 1023.0
	};
}

} /* namespace ino */

#endif /* INO_PID_DEBUG_H */

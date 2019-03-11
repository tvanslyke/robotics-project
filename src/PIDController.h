#ifndef INO_PIDCONTROLLER_H
#define INO_PIDCONTROLLER_H

#include <HardwareSerial.h>

namespace ino {

struct PIDCoeffs {
	float p;
	float i;
	float d;

	void show() const {
		Serial.print("p=");
		Serial.print(p);
		Serial.print(", i=");
		Serial.print(i);
		Serial.print(", d=");
		Serial.print(d);

		Serial.println("");
	}
};

template <
	class ErrorType,
	class SumType,
	class DiffType
>
struct PIDController {

	PIDController() = default;

	[[nodiscard]]
	constexpr float update(ErrorType error, const PIDCoeffs& coeffs) {
		DiffType diff = error - previous_error_;
		if((error < 0) != (previous_error_ < 0)) {
			integral_term_ = 0.0;
		}
		previous_error_ = error;
		integral_term_ += static_cast<SumType>(error);
		return coeffs.p * error + coeffs.i * integral_term_ + coeffs.d * diff;
	}

private:
	ErrorType previous_error_ = 0.0;
	SumType integral_term_ = 0.0;
};


} /* namespace ino */

#endif /* INO_PIDCONTROLLER_H */

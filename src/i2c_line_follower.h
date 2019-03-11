#ifndef INO_I2C_LINE_FOLLOWER_H
#define  INO_I2C_LINE_FOLLOWER_H

#include <stdint.h>
#include "Optional.h"
#include "SensorCalibration.h"

namespace ino {

/** */
struct LineSensorReadings {
	using reading_t = uint8_t;

	uint8_t operator[](uint8_t index) const {
		switch(index) {
		case 0u: return r0;
		case 1u: return r1;
		case 2u: return r2;
		case 3u: return r3;
		case 4u: return r4;
		case 5u: return r5;
		case 6u: return r6;
		}
		return 0u;
	}

	static constexpr uint8_t size() { return 7u; }

	reading_t r0;
	reading_t r1;
	reading_t r2;
	reading_t r3;
	reading_t r4;
	reading_t r5;
	reading_t r6;
};

static_assert(sizeof(Optional<LineSensorReadings>) == 8u, "Must be returned in registers.");

void initialize_i2c();

inline constexpr struct Unravel{} unravel{};

[[nodiscard]]
Optional<LineSensorReadings> read_line_sensor();

[[nodiscard]]
inline LineSensorReadings read_line_sensor(Unravel) {
	auto readings = read_line_sensor();
	while(not readings) {
		readings = read_line_sensor();
	}
	return *readings;
}


[[nodiscard]]
int8_t update_readings();

[[nodiscard]]
LineSensorReadings standardize_readings(
	LineSensorReadings reading,
	const SensorCalibration<uint8_t> (&calibrations)[7]
);

void calibrate_line_sensor(SensorCalibration<uint8_t> (&calibrations)[7], int button_pin);

} /* namespace ino */

#endif /* INO_I2C_LINE_FOLLOWER_H */

#ifndef INO_I2C_LINE_FOLLOWER_H
#define  INO_I2C_LINE_FOLLOWER_H

#include <stdint.h>
#include "SensorCalibration.h"

namespace ino {

void initialize_i2c();

[[nodiscard]]
int8_t update_readings(uint8_t (&readings)[8]);

[[nodiscard]]
void standardize_readings(
	uint8_t (&readings)[8],
	const SensorCalibration<uint8_t> (&calibrations)[8]
);


void calibrate_line_sensor(SensorCalibration<uint8_t> (&calibrations)[8], int button_pin);


} /* namespace ino */

#endif /* INO_I2C_LINE_FOLLOWER_H */

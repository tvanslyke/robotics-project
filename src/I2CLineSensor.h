#ifndef INO_I2C_LINE_SENSOR_H
#define INO_I2C_LINE_SENSOR_H

#include "i2c_line_follower.h"

namespace ino {

struct I2CLineSensor {

	I2CLineSensor() = default;

	I2CLineSensor(const I2CLineSensor&) = delete;
	I2CLineSensor(I2CLineSensor&&) = delete;

	I2CLineSensor& operator=(const I2CLineSensor&) = delete;
	I2CLineSensor& operator=(I2CLineSensor&&) = delete;

	void update() {
		update_readinsg(readings);
		standardize_readings(readings, calibrations_);
	}

	void calibrate(int button_pin) {
		calibrate_line_sensor(calibrations, button_pin);
	}

	const uint8_t& operator[](uint8_t idx) const {
		return readings_[idx];
	}

	const uint8_t* begin() const {
		return &readings_[0u];
	}

	const uint8_t* end() const {
		return &readings_[7u];
	}

private:
	uint8_t readings_[8] = {};
	SensorCalibration<uint8_t> calibrations_[8] = {{}};
};

} /* namespace ino */

#endif /* INO_I2C_LINE_SENSOR_H */

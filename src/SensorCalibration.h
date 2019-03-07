#ifndef INO_SENSOR_CALIBRATION_H
#define INO_SENSOR_CALIBRATION_H

namespace ino {

template <class T = float>
struct SensorCalibration {

	SensorCalibration() = default;

	constexpr SensorCalibration(T minm, T maxm):
		minm_(minm),
		delta_(maxm - minm)
	{
		
	}

	[[nodiscard]]
	constexpr T minimum() const {
		return minm_;
	}

	constexpr void set_minimum(T value) {
		delta_ += value - minm_;
		minm_ = value;
	}

	[[nodiscard]]
	constexpr T maximum() const {
		return minm_ + delta_;
	}

	constexpr void set_maximum(T value) {
		delta_ = value - minm_;
	}

	template <class U>
	[[nodiscard]]
	constexpr auto standardize(T value, U low, U high) const {
		return low + ((high - low) * (value - minm_)) / delta_;
	}

	void calibrate(T value) {
		if(minimum() > value) {
			set_minimum(value);
		} else if(maximum() < value) {
			set_maximum(value);
		}
	}

private:
	T minm_ = 0;
	T delta_ = 0;
};

} /* namespace ino */

#endif /* INO_SENSOR_CALIBRATION_H */

#ifndef INO_I2C_LINE_FOLLOWER_H
#define  INO_I2C_LINE_FOLLOWER_H

#include <stdint.h>

namespace ino {

void initialize_i2c();

[[nodiscard]]
int8_t update_readings(uint8_t (&readings)[8], float);


} /* namespace ino */

#endif /* INO_I2C_LINE_FOLLOWER_H */

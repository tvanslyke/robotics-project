CC=avr-gcc-8
CXX=avr-g++-8
AR=avr-ar

DEVICE=__AVR_ATmega328P__

CXXFLAGS=-mmcu=atmega328p -std=c++17 -O3 -Wall -Wextra -DF_CPU=16000000L -DARDUINO=105 -ffunction-sections -fdata-sections -w -I./../arduino/ -I./ArduinoSTL/src -I./

OBJECTS=main.o coro.o i2c_line_follower.o motor_control.o

firmware.elf: $(OBJECTS) ./../arduino/libarduino.a
	$(CXX) $(OBJECTS) ./../arduino/libarduino.a $(CXXFLAGS) -o firmware.elf

test.o: test.cpp
	$(CXX) test.cpp -c $(CXXFLAGS) 

main.o: main.cpp coro.h static_pinio.h motor_control.h
	$(CXX) main.cpp -c $(CXXFLAGS) 

coro.o: coro.cpp coro.h
	$(CXX) coro.cpp -c $(CXXFLAGS) 

motor_control.o: motor_control.cpp motor_control.h static_pinio.h
	$(CXX) motor_control.cpp -c $(CXXFLAGS) 

i2c_line_follower.o: i2c_line_follower.h i2c_line_follower.cpp
	$(CXX) i2c_line_follower.cpp -c $(CXXFLAGS) 

coro_asm:
	$(CXX) coro.cpp -c -S -o - $(CXXFLAGS) | c++filt | grep -vE '\s+\.'

./../arduino/libarduino.a:
	cd ./../arduino && $(MAKE)

clean:
	rm ./*.o
	rm firmware.elf


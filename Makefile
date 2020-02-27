all: flash

default: image

main.o: main.c
	avr-gcc -g -DF_CPU=1200000 -Wall -Os -Werror -Wextra -mmcu=attiny13a -c -o main.o main.c

uart.o: uart.c
	avr-gcc -g -DF_CPU=1200000 -Wall -Os -Werror -Wextra -mmcu=attiny13a -c -o uart.o uart.c

onewire.o: onewire.c
	avr-gcc -g -DF_CPU=1200000 -Wall -Os -Werror -Wextra -mmcu=attiny13a -c -o onewire.o onewire.c

ds18b20.o: ds18b20.c
	avr-gcc -g -DF_CPU=1200000 -Wall -Os -Werror -Wextra -mmcu=attiny13a -c -o ds18b20.o ds18b20.c

elf: main.o onewire.o ds18b20.o uart.o
	avr-gcc -g -DF_CPU=1200000 -Wall -Os -mmcu=attiny13a -o main.elf main.o ds18b20.o onewire.o uart.o

image: elf
	avr-objcopy -j .text -j .data -O ihex main.elf main.flash.hex

flash: image
	avrdude -pt13 -cavrisp -P/dev/ttyACM0 -b19200 -v -U flash:w:main.flash.hex

clean:
	rm main.o uart.o onewire.o ds18b20.o main.elf main.flash.hex
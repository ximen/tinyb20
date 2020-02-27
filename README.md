# Tinyb20
Slightly modified version of [attiny-ds18b20-library](https://github.com/lpodkalicki/attiny-ds18b20-library)

Intended to use with Bluetooth Mesh temperature sensor (BTB20)

It measures temperature by DS18B20 sensor on PB2 pin and sends it to uart on PB3/PB4 pins.

###Format:
* 1st byte: 0xFF - start of new measurement sign
* 2nd byte: the whole part of measured value
* 3rd byte: the decimal part of measured value

###Example
`0xFF 0x1B 0x08`

equals to 27.8 degrees

Not tested with  negative temperatures
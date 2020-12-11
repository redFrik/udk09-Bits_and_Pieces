130523
======

_controlling LEDs and motors from SuperCollider using the Arduino bare bone (using uln2803 as a driver + try small motors)_

//--uln2803
-----------------------
* see file `udkPwm.png` and connect a uln2803a to the arduino bare bone with 6 leds.
* upload the sketch `udkPwm.ino` to the arduino using a usb-to-serial (ftdi chip) adapter.
* control the leds via serial with the `udkPwm.pd` puredata patch or the `udkPwm.scd` code.
* try to connect one or two small dc motors instead of the leds (take care not to draw too much power)

![udkPwm](https://raw.github.com/redFrik/udk09-Bits_and_Pieces/master/udk130523/udkPwm.png)

![uln2803a](https://raw.github.com/redFrik/udk09-Bits_and_Pieces/master/udk130523/IMG_20130523_123834.jpg)

//--pwm and serial
------------------
stands for pulse width modulation. it is a way of controlling leds and motors with values from 0 to 255 (in this setup - might be different)
we are using the serial communication to send 8 values to control 6 pwm channels (6 pwm pins).  there is a start (10) and a stop number (11) in our protocol.

//--links
---------
* <https://web.archive.org/web/20130508183941/http://oomlout.com/8TRA/8TRA-Guide.pdf> about the uln2803
* <https://fritzing.org> free software for drawing circuit diagrams - includes lots of examples.
* <https://web.archive.org/web/20131215051859/http://www.pighixxx.com/abc-arduino-basic-connections/> download pdf cards to learn more how to connect things to arduino

//--extras
----------
* advanced - programming the atmega168 via sound card. see instructions and code in `extras/uploadingArduino.scd`

![audioserial](https://raw.github.com/redFrik/udk09-Bits_and_Pieces/master/udk130523/extras/IMG_20130523_102501.jpg)

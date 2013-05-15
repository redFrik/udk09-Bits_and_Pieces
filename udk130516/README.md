130516
======

_building an Arduino bare bone (+ try LaunchPad with Enigma as a cheap alternative)_

//--build bare bone arduino
---------------------------

parts:

* breadboard
* atmega168
* cables
* usb connector
* (led 5mm)
* (1kohm resistor)

//--prepare for burning bootloader
----------------------------------

first make a plain text file called boards.txt
put it inside `~/Documents/Arduino/hardware/udk/`
the text file should contain the following...

    ##############################################################
    udkBareBone.name=udkBareBone (internal chrystal 8 MHz) w/ ATmega168
    udkBareBone.upload.speed=115200
    udkBareBone.bootloader.low_fuses=0xE2
    udkBareBone.bootloader.high_fuses=0xD9
    udkBareBone.upload.maximum_size=14336
    udkBareBone.build.mcu=atmega168
    udkBareBone.build.f_cpu=8000000L
    udkBareBone.build.core=arduino:arduino
    udkBareBone.build.variant=arduino:standard


use an arduino (maybe borrow from a friend) to burn and program the atmega168 chip
see bottom left connection diagram... <http://arduino.cc/en/Tutorial/ArduinoISP>
on how to connect a atmega168 to an arduino without external clock.

//--burn bootloader
-------------------
in arduino ide software select the board udkBareBone
select the serial port of the arduino
select 'arduino as isp' under programmer
and last 'burn bootloader'

//--links
---------
* <http://wolfpaulus.com/jounal/embedded/minimalarduino>
* <http://www.pighixxx.com/abc-arduino-basic-connections/>
* <http://www.instructables.com/id/Use-Arduino-code-on-a-TI-Launchpad-MSP430/>

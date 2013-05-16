130516
======

_building an Arduino bare bone (+ try LaunchPad with Energia as a cheap alternative)_

//--build bare bone arduino
---------------------------

parts:

* breadboard
* atmega168
* 16mhz chrystal
* two 22pF cheramic capacitors
* some wire
* usb-to-serial ftdi connector
* (led 5mm)
* (1kohm resistor)

This will also work with atmega328 and most of the tiny avr chips as well. But you will need to modify some things. See links below for more info.

//--preparation for burning bootloader
--------------------------------------
We will use a real arduino (maybe borrowed from a friend) to burn the bootloaded to the bare atmega168 chip. See bottom right connection diagram... <http://arduino.cc/en/Tutorial/ArduinoISP> on how to connect a atmega168 to an arduino with external chrystal.

* connect arduino 5v to atmega168 pin 7
* connect arduino gnd to atmega168 pin 8
* connect arduino 10 to atmega168 pin 1 (reset)
* connect arduino 11 to atmega168 pin 17 (mosi)
* connect arduino 12 to atmega168 pin 18 (miso)
* connect arduino 13 to atmega168 pin 19 (sck)
* also connect atmega168 pins 9 and 10 to the chrystal and then via caps to ground
* the reset pull-up resistor you can skip

![arduinoisp connections](https://raw.github.com/redFrik/udk09-Bits_and_Pieces/master/udk130516/IMG_20130516_042113.jpg)

//--burn bootloader with an arduino
-----------------------------------
1. in Arduino IDE software under Tools/Board select the board that matches your real arduino (use Uno for RedBoard).
2. select the serial port of the real arduino under Tools/SerialPort.
3. open and upload the 'ArduinoISP' sketch from Examples menu.
4. select the board `Arduino NG or older w/ ATmega168` under Tools/Board menu.
5. select 'Arduino as ISP' under Tools/Programmer.
6. and last 'Burn Bootloader' under Tools. If it worked the Arduino IDE software should after a while say: "Done burning bootloader".

You can also burn a bootloader with programmers like STK500 or USBtinyISP. Or even skip the bootloader and burn the arduino sketch directly to the mega168 chip bypassing the bootloader. This will make the chip start quicker (see arduino.cc website and the wolfpaulus link below for more info).

//--upload sketches with FTDI
-----------------------------
Now we can upload sketches using small usb-to-serial ftdi adapters like <http://shop.moderndevice.com/products/bub_ii> or <http://www.tinkersoup.de/product_info.php?products_id=266>.

* connect ftdi-chip 5v to atmega168 pin 7
* connect ftdi-chip gnd to atmega168 pin 8
* connect ftdi-chip tx to atmega168 2
* connect ftdi-chip rx to atmega168 3
* also connect a led from atmega168 pin 19 via a resistor to ground

1. Connect the ftdi-chip and select its port under Tools/SerialPort.
2. Make sure the board `Arduino NG or older w/ ATmega168` is selected under Tools/Board menu.
3. Upload the Blink example for example.

![ftdi connections](https://raw.github.com/redFrik/udk09-Bits_and_Pieces/master/udk130516/IMG_20130516_042404.jpg)

//--launchpad
-------------
* cheap alternative to an arduino
* see <http://energia.nu>

//--links
---------
* <http://arduino.cc/en/Hacking/PinMapping168>
* <http://www.yuriystoys.com/2012/02/arduino-on-beadboard-uploading-your.html>
* <http://wolfpaulus.com/jounal/embedded/minimalarduino>
* <http://hlt.media.mit.edu/?p=1695>
* <http://www.pighixxx.com/abc-arduino-basic-connections/>
* <http://www.instructables.com/id/Use-Arduino-code-on-a-TI-Launchpad-MSP430/>

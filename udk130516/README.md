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
* some jumper wires
* usb-to-serial ftdi connector
* (led 5mm)
* (1kohm resistor)

Advanced: This will also work with atmega328 and most of the tiny avr chips as well. But you will need to modify some things. See links below for more info.

//--preparation for burning bootloader
--------------------------------------
We will use a real arduino (maybe borrowed from a friend) to burn the bootloaded to the bare atmega168 chip. See bottom right connection diagram... <http://arduino.cc/en/Tutorial/ArduinoISP> on how to connect a atmega168 to an arduino with external chrystal.

* connect arduino 5v to atmega168 pin 7
* connect arduino gnd to atmega168 pin 8
* connect arduino 10 to atmega168 pin 1 (reset)
* connect arduino 11 to atmega168 pin 17 (mosi)
* connect arduino 12 to atmega168 pin 18 (miso)
* connect arduino 13 to atmega168 pin 19 (sck)
* also connect atmega168 pins 9 and 10 to the chrystal and then via capacitors to ground
* you can skip the 10K pull-up reset resistor in the diagram

![arduinoisp connections](https://raw.github.com/redFrik/udk09-Bits_and_Pieces/master/udk130516/IMG_20130516_042113.jpg)

//--burn bootloader with an arduino
-----------------------------------
1. download and install Arduino IDE software from <http://arduino.cc/en/Main/Software> if you haven't already got it.
2. in Arduino IDE software under Tools/Board select the board that matches your real arduino (use Uno for RedBoard).
3. select the serial port of the real arduino under Tools/SerialPort.
4. open and upload the 'ArduinoISP' sketch from Examples menu.
5. select the board `Arduino NG or older w/ ATmega168` under Tools/Board menu.
6. select 'Arduino as ISP' under Tools/Programmer.
7. last 'Burn Bootloader' under Tools. It should take a little while and leds should be flashing during the process.

If the serial port 'tty.usbserial-XXXXX' doesn't show up try installing the <http://www.ftdichip.com/Drivers/VCP.htm> (version 2.2.18 or later for mac (pick correct 32bit vs 64bit version of the driver)).

You can also burn a bootloader with programmers like STK500 or USBtinyISP.

Or even skip the bootloader and burn the arduino sketch directly to the atmega168 chip bypassing the bootloader. This will make the chip start quicker (see the wolfpaulus link below for more info).

Advanced: With the STK500 and USBtinyISP programmers (unfortunately not with ArduinoISP as far as I can tell) you also have the option to use the internal chrystal on the atmega168 chip. This way you can make a really minimal arduino (again see the wolfpaulus link below).

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
3. Reset the board by unplugging/pluggin the usb power and upload a sketch. For example the Blink example found under menu File/Examples/01.Basics.

Note that you should always first reset the bare bone arduino by toggling power and then click upload sketch in the ArduinoIDE. You have about 10 seconds after reset to upload a sketch.

![ftdi connections](https://raw.github.com/redFrik/udk09-Bits_and_Pieces/master/udk130516/IMG_20130516_042404.jpg)

//--links
---------
* <http://arduino.cc/en/Hacking/PinMapping168> important for bare bone arduino!
* <http://www.yuriystoys.com/2012/02/arduino-on-beadboard-uploading-your.html> very similar to what we just did
* <http://pdp11.byethost12.com/AVR/ArduinoAsProgrammer.htm> and another more advanced tutorial
* <http://wolfpaulus.com/jounal/embedded/minimalarduino> even more minimal arduino
* <http://hlt.media.mit.edu/?p=1695> for using smaller and cheaper chip called attiny
* <http://www.pighixxx.com/abc-arduino-basic-connections/> great resource for anyone working with arduino (download the pdf cards)

//--launchpad
-------------
* cheap alternative to an arduino
* see <http://energia.nu> and <http://www.exp-tech.de/Mainboards/MSP430-LaunchPad-Value-Line-Development-kit.html> sell them cheap (≈ €5).
* just make sure you get version 1.5 or later.
* note that you will need to flip around the tx and rx jumpers (see attached picture where it says RXD and <https://github.com/energia/Energia/wiki/Hardware>)
* <http://www.instructables.com/id/Use-Arduino-code-on-a-TI-Launchpad-MSP430/>

![launchpad](https://raw.github.com/redFrik/udk09-Bits_and_Pieces/master/udk130516/IMG_20130516_044554.jpg)

//--extras
----------
* to try: connect some leds with resistors to the pwm output pins and make them fade smoothly.
* to try: send back sensor data via serial to Arduino IDE serial monitor and PureData.
* to try: build a 5v power supply with one 7805, two 100nF capacitors and one 10uF electrolytic capacitor
![5v](https://raw.github.com/redFrik/udk09-Bits_and_Pieces/master/udk130516/5v.png)

Next week - bring motors, fans, leds and other stuff you'd like to control.

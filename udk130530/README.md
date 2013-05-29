130530
======

_making sound from light with an Arduino (analog inputs, smoothing data, 1bit music)

//--voltage dividers
--------------------
* look at `voltage_divider.png`
* try to measure the resistance of a potentiometer (pot) and then a photocell (ldr)
* connect 5v and gnd to the outer legs of a pot and measure voltage between the middle leg and gnd.
* if you swap 5v and gnd it does not matter much. It will just flip the direction of the pot.

![udkPwm](https://raw.github.com/redFrik/udk09-Bits_and_Pieces/master/udk130530/voltage_divider.png)

//--read analog sensors
-----------------------
The analog inputs (6 on a standard arduino) can read voltage (up to 5v).
With the analogRead() method you get a number from 0 to 1023 that matches this voltage reading.

* upload sketch `analogInOut` to your bare bone arduino.
* connect a pot with middle leg to pin 23 (A0 on a real arduino) and left/right legs to 5v and gnd (or gnd and 5v - does not matter)
* make sure you have a resistor and one led connected to the first uln2803 output (pin 20 of the uln2803).
* the led should now be controlled (dimmed) by the potentiometer.

//--read ldr sensor
-------------------
* replace the pot with a ldr + 10k resistor. See `ldr_schem.png`.
* the led should fade according to the voltage on A0.
* try to swap the 5v and gnd connected to the resistor+ldr. What happens?
* try to change the places of the resistor and the ldr. What happens?
* upload `analogInOut_serial` and look at the values in serial monitor.
* calibrate by changing 2nd and 3rd value in map()

* extra: try replacing the led with a small dc motor or server motor.

![udkPwm](https://raw.github.com/redFrik/udk09-Bits_and_Pieces/master/udk130530/ldr_schem.png)

//--connect a speaker
---------------------
* find a speaker and connect it with a 100ohm resistor. see file `speaker_schem.png`

//--make some noise
-------------------


//--links
---------
* <http://learn.adafruit.com/photocells>
* <http://arduino.cc/en/Tutorial/Tone2>

//--extras
----------
* advanced - upload the monijonsyn code from <http://www.fredrikolofsson.com/f0blog/?q=node/161> and connect 3 pots and 1 button or replace the pots with 3 ldrs.

![udkPwm](https://raw.github.com/redFrik/udk09-Bits_and_Pieces/master/udk130523/udkPwm.png)

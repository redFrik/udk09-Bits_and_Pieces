130704
======

_build the micronoise evil sounding battery driven circuit_

//--micronoise
--------------
great little circuit by SGMK.  see pdf here... <http://www.mechatronicart.ch/diymakeaway/micro-noise>

it is easy to modify and experiment with different resistors and capacitor.  you can also play with the two unused schmitt triggers (4093 has four in total).
* <http://www.fredrikolofsson.com/f0blog/?q=node/162>
* <http://www.fredrikolofsson.com/f0blog/?q=node/351>
* <http://www.fredrikolofsson.com/f0blog/?q=node/349>
* <http://www.fredrikolofsson.com/f0blog/?q=node/209>

//--schmitt trigger
-------------------
sort of comparator with two thresholds.  useful for filtering noisy sensor data and also, in combo with a capacitor, for making oscillators.  <http://en.wikipedia.org/wiki/Schmitt_trigger>

video about how they work: <http://www.youtube.com/watch?v=TfnP--hEPms>

supercollider example:

<code>
{var sig= SinOsc.ar(400)*SinOsc.ar(500); [sig, Schmidt.ar(sig, -0.5, 0.5)]}.plot(minval: -1, maxval: 1)
</code>

![schmitt](https://raw.github.com/redFrik/udk09-Bits_and_Pieces/master/udk130704/schmitt.png)

a lower threshold of -0.5 and an upper threshold of 0.5.  the signal have to first go above 0.5 to trigger a 1, then go below -0.5 to trigger a 0.

and another example using the mouse x position.

<code>
{var sig= MouseX.kr(0, 1); SinOsc.ar(Schmidt.kr(sig, 0.25, 0.75)*400+400, 0, 0.3)}.play
</code>

//--power starvation
--------------------
when you lower the voltage with a potentiometer, or use nearly dead batteries, strange things happens.  this technique is often called to power starve a circuit.
<http://www.beavisaudio.com/Projects/DBS/>

//--led and ldr feedback
------------------------
try to place the micro_noise circuit in a black box.  the ldr and led will interact in strange ways.

![IMG_20130704_115021](https://raw.github.com/redFrik/udk09-Bits_and_Pieces/master/udk130704/IMG_20130704_115021.jpg)

//--partslist
-------------
* MOS 4093 4xSCHMITT-TRIGGER
* LED 5MM RT
* METALL 1,00K Widerstand
* A 905014 Fotowiderstand
* ACP 9-L 5K Einstellpotentiometer
* ACP 9-L 1M Einstellpotentiometer
* RAD FC 4,7/50 Elektrolytkondensator
* MKS-2 100N Folienkondensator
* CLIP 9V-T Batterieclip
* 9v battery
* speaker
* wire
* pcb proto board

//--extra
---------
* connect it together with the lm386 amplifier from last week
* modify the circuit - replace the ldr with a potentiometer, add more pots, connect 2nd pair of schmitt triggers.

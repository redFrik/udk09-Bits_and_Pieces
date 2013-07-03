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

<code>
//supercollider test code
s.boot
{var src= SinOsc.ar; [src, Schmidt.ar(src, 0.75, 0.85)]}.plot(minval: -1, maxval: 1)
</code>

//--power starvation
--------------------
when you lower the voltage or use nearly dead batteries, strange things usually happens.
<http://www.beavisaudio.com/Projects/DBS/>

//--led and ldr feedback
------------------------
try to place the micro_noise circuit in a black box.  the ldr and led will interact in strange ways.

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

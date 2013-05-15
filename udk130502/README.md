130502
======

_MIDI from MaxMSP or PureData hooked up to OpenGL graphics in Processing_

//--install Processing
----------------------
1. download and install Processing (2.0b8) from <http://processing.org/download>
2. play around with some examples
3. try the sketch `udk_test1.pde`
4. try the sketches `udk_sketch00.pde` to `udk_sketch05.pde` and change things

//--midi
--------
1. old technique mainly for connecting hardware synths and controllers (midi saxophone, midi drum kits, midi 'usb' controllers).  see <http://en.wikipedia.org/wiki/Midi>
2. note drawbacks: only 7bits (0-127), slow serial, note on/off, controllers, program change etc. see midi spec

//--midi hardware
-----------------
1. show nanoKontroll, other midi controllers, midi keyboards etc
2. usb midi interface.  some soundcards also have midi interface built in.

//--midi software
-----------------
1. midi iac bus. osx: open the Audio MIDI setup app in Applications/Utilities and activate the IAC bus. this will let you send midi between applications.
2. download the promidi library (2.0) from <http://processing.org/reference/libraries/> and <http://creativecomputing.cc/p5libs/promidi/>
3. put it inside `~/Documents/Processing/libraries` and restart processing

//--option #1 - test pd
-----------------------
1. install Pd-extended (0.43.4) from <http://puredata.info> if you haven't already
2. check midi settings and `testtone.pd` under the pd menu called 'Media'
3. run the sketch `udk_midi00.pde` with the pd patch `udk_midi00.pd`

//--option #2 - test with max/msp
---------------------------------
1. either unpack the `udk_midi00.app.zip` application or install the demo version of max/msp (5 or 6.1 from <http://cycling74.com/downloads>) and then open the `udk_midi00.maxpat`.
2. in max/msp you can also try `MIDItester` under max menu called 'Extras'
3. run the sketch `udk_midi00.pde` with the max patch `udk_midi00`

//--option #3 - test with nanoKontroll
--------------------------------------
1. run the sketch `udk_midi00.pde` with the hardware usb nanokontroll connected

//--more
--------
1. try the sketch `udk_midi01.pde` together with `udk_midi01.pd`. it use pd to track amplitude from the internal mic and change the width of the line in processing. in pd you'll need to start dsp and start the metro + check that mic is selected as input in audio settings.
2. change things in the processing code - try to draw more lines or map amplitude to other parameters like colour, position, window trail (alpha).

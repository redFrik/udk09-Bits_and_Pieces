130711
======

_sound detection and categorization with SuperCollider sends out osc to MaxMSP/PureData (pitch, amplitude, onsets, centroid)_

//--analys1
-----------
this is a very simple demonstration of how to extract a few features from sound.  there are now settings for the synth.  things like smoothing and filtering have to be done in pd or max.

* make sure you have internal mic selected in system preferences.
* start the supercollider, boot the server and run the code in `analys1.scd`.
* open either the pure data patch `analys1.pd` or the max patch `analys.maxpat`.
* you should see values changing in the numberboxes and the sliders moving.

![analys1.pd](https://raw.github.com/redFrik/udk09-Bits_and_Pieces/master/udk130711/analys1.pd.png)

![analys1.maxpat](https://raw.github.com/redFrik/udk09-Bits_and_Pieces/master/udk130711/analys1.maxpat.png)

//--analys2
-----------
in this example there are settings to tune the analyser synth.

* open `analys2.scd` and run the code
* use the same pd/max patch and change settings from within sc

//--extra
---------
read and play with the examples here...

* <http://www.fredrikolofsson.com/software/PracticalSoundAnalysis01.html>
* <http://www.fredrikolofsson.com/software/PracticalSoundAnalysis01examples.html>
* <http://www.fredrikolofsson.com/software/PracticalSoundAnalysis02.html>
* <http://www.fredrikolofsson.com/software/PracticalSoundAnalysis02examples.html>
* <http://www.fredrikolofsson.com/software/PracticalSoundAnalysis03.html>
* <http://www.fredrikolofsson.com/software/PracticalSoundAnalysis03examples.html>
* <http://www.fredrikolofsson.com/software/PracticalSoundAnalysisExtras.html>

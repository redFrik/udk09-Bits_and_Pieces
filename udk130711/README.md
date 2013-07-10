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

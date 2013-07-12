130711
======

_sound detection and categorization with SuperCollider sends out osc to MaxMSP/PureData (pitch, amplitude, onsets, centroid)_

//--supercollider examples
--------------------------

```
s.boot

//--amplitude tracking

//very basic amplitude tracking - controls frequency
{SinOsc.ar(500*Amplitude.kr(SoundIn.ar(0)))}.play

//with lag (smoooth) on the amplitude tracker
{SinOsc.ar(500*Amplitude.kr(SoundIn.ar(0)).lag(0.2))}.play

//with higher frequencies
{SinOsc.ar(5000*Amplitude.kr(SoundIn.ar(0)).lag(0.2))}.play

//with delay
{SinOsc.ar(5000*Amplitude.kr(DelayN.ar(SoundIn.ar(0), 1, 1)).lag(0.2))}.play


//--pitch tracking

//--very basic pitch tracking - controls frequency
{SinOsc.ar(Pitch.kr(SoundIn.ar(0))[0])}.play

//with lag (smooth)
{SinOsc.ar(Pitch.kr(SoundIn.ar(0))[0].lag(0.9))}.play

//with frequency offset
{SinOsc.ar(Pitch.kr(SoundIn.ar(0))[0].lag(0.9)*1.05)}.play //rising
{SinOsc.ar(Pitch.kr(SoundIn.ar(0))[0].lag(0.9)*0.99)}.play //falling

//with delay
{SinOsc.ar(Pitch.kr(DelayN.ar(SoundIn.ar(0), 1, 1))[0].lag(0.9)*1.05)}.play



//--onset (events)

//basic usage
{var fft= FFT(LocalBuf(2048), SoundIn.ar(0)); SinOsc.ar(5000*Onsets.kr(fft).lag(1))}.play

//with 0.9 threshold (the default is 0.5)
{var fft= FFT(LocalBuf(2048), SoundIn.ar(0)); SinOsc.ar(5000*Onsets.kr(fft, 0.9).lag(1))}.play

//lower fft buffersize makes the sound detector react faster
{var fft= FFT(LocalBuf(512), DelayN.ar(SoundIn.ar(0), 1, 1)); SinOsc.ar(5000*Onsets.kr(fft, 0.9).lag(0.5))}.play


//--timbre (centroid)

//basic usage
{var fft= FFT(LocalBuf(2048), SoundIn.ar(0)); SinOsc.ar(SpecCentroid.kr(fft).poll)}.play
```

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

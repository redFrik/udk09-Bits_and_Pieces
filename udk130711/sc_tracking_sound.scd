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

////basic usage
{var fft= FFT(LocalBuf(2048), SoundIn.ar(0)); SinOsc.ar(SpecCentroid.kr(fft).poll)}.play


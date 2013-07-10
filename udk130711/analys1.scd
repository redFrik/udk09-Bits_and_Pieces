//pitch, amplitude, onsets, centroid

s.boot

(
SynthDef(\analys1, {
	var src= SoundIn.ar(0);	//can also be InFeedback.ar(0) to listen to some bus
	var fft= FFT(LocalBuf(2048), src);
	var pitch= Pitch.kr(src)[0];
	var amp= Amplitude.kr(src);
	var onset= PulseCount.kr(Onsets.kr(fft));
	var centroid= SpecCentroid.kr(fft);
	SendReply.kr(Impulse.kr(30), '/analys1', [pitch, amp, onset, centroid]);
}).add;
)

(
a= Synth(\analys1);
n= NetAddr("127.0.0.1", 9000);	//relay
OSCFunc({|msg|
	msg[3..].postln;	//pitch, amp, onset index, centroid
	n.sendMsg(\data, *msg[3..]);
}, '/analys1');
)


//now open pd patch analys1.pd or the max patch analys1.maxpat

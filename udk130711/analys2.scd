//pitch, amplitude, onsets, centroid

s.boot

(
SynthDef(\analys2, {|rate= 30, pctMed= 2, pchLag= 0.05, ampAtk= 0.05, ampRel= 0.1, ampLag= 0.01, onsThresh= 0.25, spcLag= 0.1|
	var src= SoundIn.ar(0);	//can also be InFeedback.ar(0) to listen to some bus
	var fft= FFT(LocalBuf(2048), src);
	var p= Pitch.kr(src, median: pctMed);
	var pitch= p[1].lag(pchLag)*p[0];
	var amp= Amplitude.kr(src, ampAtk, ampRel).lag(ampLag);
	var onset= PulseCount.kr(Onsets.kr(fft, onsThresh));
	var centroid= SpecCentroid.kr(fft).lag(spcLag);
	SendReply.kr(Impulse.kr(rate), '/analys2', [pitch, amp, onset, centroid]);
}).add;
)

(
a= Synth(\analys2);
n= NetAddr("127.0.0.1", 9000);	//relay
OSCFunc({|msg|
	msg[3..].postln;	//pitch, amp, onset index, centroid
	n.sendMsg(\data, *msg[3..]);
}, '/analys2');
)


//now open pd patch analys1.pd or the max patch analys1.maxpat

//and here are some settings...
a.set(\rate, 15)		//much slower updaterate
a.set(\pchLag, 1.5)	//more lag
a.set(\ampRel, 5)		//long release time for amplitude tracker
a.set(\onsThresh, 0.99)	//less sensitive onset trigger
//etc

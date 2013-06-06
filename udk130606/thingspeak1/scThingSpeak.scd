//this code demonstrates how to write data from sc to thingspeak via a small python script

//--run this once
(
~lastTime= 0;
~scThingSpeak= {|key, freq, amp, rate|
	var arguments= ""++key+freq+amp+rate;
	("python"+thisProcess.nowExecutingPath.dirname++"/scThingSpeak.py"+arguments).unixCmd;
	if(Main.elapsedTime-~lastTime<15, {
		"too quick - max update rate is 15sec".warn;
	});
	~lastTime= Main.elapsedTime;
};
)


//--setup key - also once
~writeKey= "PNE6NL2V5IUVFWM5";	//edit this to match your channel write api key


//--here we write values to the thingspeak channel
//IMPORTANT: wait at least 15sec between each write operation
//it should say "200 OK" in post window if everything works
~scThingSpeak.value(~writeKey, 701, 0.7, 0.47)
//wait 16sec
~scThingSpeak.value(~writeKey, 123, 0.5, 0.37)
//wait 16sec
~scThingSpeak.value(~writeKey, 5000, 0.1, 0.57)



//--automatic
(
~freq= 500;
~amp= 1;
~rate= 0.5;
Routine.run({
	inf.do{
		[~freq, ~amp, ~rate].postln;
		~scThingSpeak.value(~writeKey, ~freq, ~amp, ~rate);
		15.5.wait;	//because thingspeak has a limited datarate of 15sec
	};
});
)

//--now change these and use them in your sound generating code
~freq= 800
~amp= 1.0.rand

s.boot
Pdef(\test, Pbind(\freq, Pfunc({~freq}), \amp, Pfunc({~amp}), \dur, Pfunc({~rate}))).play

//--this will open a browser with graphs of the realtime data coming in
("open"+thisProcess.nowExecutingPath.dirname++"/scThingSpeak.html").unixCmd

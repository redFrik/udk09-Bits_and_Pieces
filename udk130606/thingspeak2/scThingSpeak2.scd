//this code demonstrates how to write data from an arduino via sc to thingspeak via a small python script

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

//load the sketch analogReadThreeSensors on to your arduino and connect 3 sensors

(
var port= SerialPort("/dev/tty.usbserial-A101NAZV", 9600);//edit this to match your arduino
Routine.run({
	var res= "", arr;
	inf.do{
		var char= port.read;
		if(char.notNil, {
			if(char==10, {
				arr= res.split(Char.space).asInteger;
				~freq= arr[0].linexp(0, 1023, 300, 3000);
				~amp= arr[1]/1023;
				~rate= arr[2].linlin(0, 1023, 0.25, 1.75);
				res= "";
			}, {
				res= res++char.asAscii;
			});
		});
		if(Main.elapsedTime-~lastTime>15, {
			if([~freq, ~amp, ~rate].every{|x| x.notNil}, {
				"posting...".post;
				[~freq, ~amp, ~rate].postln;
				~scThingSpeak.value(~writeKey, ~freq, ~amp, ~rate);
			});
		})
	};
});
CmdPeriod.doOnce({port.close});
)

//--this will open a browser with graphs of the realtime data coming in
("open"+thisProcess.nowExecutingPath.dirname++"/scThingSpeak.html").unixCmd

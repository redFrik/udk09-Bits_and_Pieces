//this code demonstrates how to read data from thingspeak to sc via a small python script

/*
//open terminal, cd to this directory and run...
python scThingSpeak3.py 6123
//replace 6123 with your channel number
keep it running in the background
*/

(
Routine.run({
	inf.do{
		var path= thisProcess.nowExecutingPath.dirname++"/thingspeak3DATA.txt";
		var f, str;
		if(File.exists(path), {
			f= File(path, "r");
			str= f.readAllString;
			f.close;
			str.postln;
			str= str.split(Char.space).asFloat;
			~freq= str[0];
			~amp= str[1];
			~rate= str[2];
		});
		14.wait;
	};
});
)

//the code will read the data from the temporary file and put values into these variables...
~freq
~amp
~rate


s.boot
Pdef(\test, Pbind(\freq, Pfunc({~freq}), \amp, Pfunc({~amp}), \dur, Pfunc({~rate}))).play

//now open the scThingSpeak.scd and write some data to the channels

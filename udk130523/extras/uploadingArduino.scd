//--f.olofsson (with lots of study of the AudioBoot_V2_0 java code by chris www.roboterclub-freiburg.de)
//code for uploading sketches to arduino from supercollider.  no ftdi chip needed

//1. burn the bootloader from AudioBoot_V2_0 http://www.hobby-roboter.de/forum/viewtopic.php?f=4&t=127
//2. build the circuit from http://www.hobby-roboter.de/forum/viewtopic.php?f=4&t=128&p=531
//3. in arduino ide make sure board is set to atmega168 with 8mhz internal chrystal
//4. code something in arduino ide, compile and get the .hex file (set preferences to verbose more)
//5. put the path in this code, turn up volume to 80%, press reset button and run this code to upload



//http://en.wikipedia.org/wiki/Intel_HEX
//http://www.sbprojects.com/knowledge/fileformats/intelhex.php

(
//edit path here to point to a hex file...
var path= "/Users/Stirling/arbeten/sc/scAudioino/a_dec.cpp.hex";
//var path= "/Users/Stirling/arbeten/sc/scAudioino/a_inc.cpp.hex";

//--read and decode the hex file
var f= File(path, "r");
var byteCount, address, recordType, data, checksum, segment= 0, extended= 0;
var res= List.new, vv;
var line, addy, eof= false;
var decode= {|line|
	//line.postln;	//debug
	if(line[0]!=$:, {	//check start code
		"read error: no colon at beginning of line".error;
	}, {
		byteCount= ("0x"++line[1..2]).interpret;
		address= ("0x"++line[3..6]).interpret;
		recordType= ("0x"++line[7..8]).interpret;
		data= [];
		switch(recordType,
			0, {	//data
				data= Array.fill(byteCount, {|i| ("0x"++line[i*2+9]++line[i*2+10]).interpret});
			},
			1, {	//end of file
				eof= true;
				//"End Of File".postln;	//debug
			},
			2, {	//extended segment address
				segment= ("0x"++line[9..10]).interpret;
			},
			3, {	//start segment address
				"Start Segment Address Record - not implemented".warn;
			},
			4, {	//extended linear address
				extended= ("0x"++line[9..10]).interpret;
			},
			5, {	//start linear address
				"Start Linear Address Record - not implemented".warn;
			}
		);
		checksum= ("0x"++line[byteCount*2+9]++line[byteCount*2+10]).interpret;
		if(256-(byteCount+(address%255)+recordType+data.sum&255)!=checksum, {
			"checksum error".warn;
		});
		if(recordType!=1, {
			addy= segment*16+address;
			addy= extended*65536+addy;
			res.add([addy, data]);
		});
	});
};
while({line= f.getLine(266); line.notNil}, {
	decode.value(line);
});
f.close;
if(eof.not, {
	"no end of file".warn;
});
vv= res.collect{|x| x[1]}.flat;	//optional to remove header .copyToEnd(6);
vv.collect{|x| x.asHexString(2)}.clump(16).do{|x| x.postln};

//--make a signal and play it
s.waitForBoot{
	var silenceBetweenPages= 0.02;
	var startSequencePulses= 40;
	var manchesterNumberOfSamplesPerBit= 4;
	var phase= 1;
	var differentialManchesterEncodeStream= {|data|
		data.collect{|x| var d= if(x==0, {1-phase}, {phase}); [d, phase= 1-d]}.flat;
	};
	var frameCnt= 0;
	var pageIndex= 0;
	var pageHeader= 1.dup(startSequencePulses)++0;
	var pageSize= 128;
	var crc= 0x55AA;
	var list= List[];
	var array= [];
	var num;
	vv.size.roundUp(pageSize).do{|i|
		var frameParameters, frameData;
		var x= if(i<vv.size, {vv[i]}, {255});
		if(frameCnt%pageSize==0, {
			//--frame intro header
			frameParameters= ([2, pageIndex, pageIndex>>8, crc, crc>>8]&255).collect{|x| 1-x.asBinaryDigits(8)}.flat;
			list.add(differentialManchesterEncodeStream.value(pageHeader).flat);
			list.add(differentialManchesterEncodeStream.value(frameParameters).flat);
			pageIndex= pageIndex+1;
		});
		//--frame data (8 bits)
		frameData= 1-x.asBinaryDigits(8);
		list.add(differentialManchesterEncodeStream.value(frameData).flat);
		if(frameCnt%pageSize==(pageSize-1), {
			//--frame end
			array= array.add(list.flat);
			list= List.new;
		});
		frameCnt= frameCnt+1;
	};
	pageIndex= pageIndex-1;		//bug in original code?  need to 'not' increase the pageIndex here
	pageSize.do{|i|
		var frameParameters, frameData;
		var x= 255;
		if(frameCnt%pageSize==0, {
			//--frame intro header
			frameParameters= ([3, pageIndex, pageIndex>>8, crc, crc>>8]&255).collect{|x| 1-x.asBinaryDigits(8)}.flat;
			list.add(differentialManchesterEncodeStream.value(pageHeader).flat);
			list.add(differentialManchesterEncodeStream.value(frameParameters).flat);
			pageIndex= pageIndex+1;
		});
		//--frame data (8 bits)
		frameData= x.asBinaryDigits(8);
		list.add(differentialManchesterEncodeStream.value(frameData).flat);
		if(frameCnt%pageSize==(pageSize-1), {
			//--frame end
			array= array.add(list.flat);
			list= List.new;
		});
		frameCnt= frameCnt+1;
	};
	("number of pages:"+array.size).postln;
	num= pageSize+5*8+startSequencePulses+1*manchesterNumberOfSamplesPerBit;
	SynthDef(\manchester, {|out= 0, amp= 1|
		var data= Control.names([\data]).ir(Array.fill(num.div(2), 0));
		var src= Duty.ar(manchesterNumberOfSamplesPerBit.div(2)*SampleDur.ir, 0, Dseq(data++0), 2);
		OffsetOut.ar(out, src*amp);
	}).add;
	s.sync;
	Routine.run({
		array.do{|x, i|
			("uploading page:"+i).postln;
			s.bind{
				Synth(\manchester, [\data, x*2-1]);
			};
			(num/s.sampleRate+silenceBetweenPages).wait;
		};
	});
};
)

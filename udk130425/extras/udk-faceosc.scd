//--setup
thisProcess.openUDPPort(8338);	//should post true - else port already open by another application

//--test
OSCFunc.trace(true);
//start FaceOSC and data should be posted in post window
OSCFunc.trace(false);


//--template
(
//--found
OSCFunc({|msg|
	var found= msg[1];
	//("found="+found).postln;					//debug
}, '/found');

//--pose
OSCFunc({|msg|
	var x, y;
	x= msg[1];
	y= msg[2];
	//("position: x="+x+"y="+y).postln;			//debug
}, '/pose/position');
OSCFunc({|msg|
	var scale= msg[1];
	//("scale="+scale).postln;					//debug
}, '/pose/scale');
OSCFunc({|msg|
	var x, y, z;
	x= msg[1];
	y= msg[2];
	z= msg[3];
	//("orientation: x="+x+"y="+y+"z="+z).postln;	//debug
}, '/pose/orientation');

//--gesture
OSCFunc({|msg|
	var width= msg[1];
	//("mouth width="+width).postln;				//debug
}, '/gesture/mouth/width');
OSCFunc({|msg|
	var height= msg[1];
	//("mouth height="+height).postln;			//debug
}, '/gesture/mouth/height');
OSCFunc({|msg|
	var height= msg[1];
	//("eyebrow left height="+height).postln;		//debug
}, '/gesture/eyebrow/left');
OSCFunc({|msg|
	var height= msg[1];
	//("eyebrow right height="+height).postln;	//debug
}, '/gesture/eyebrow/right');
OSCFunc({|msg|
	var height= msg[1];
	//("eye left height="+height).postln;			//debug
}, '/gesture/eye/left');
OSCFunc({|msg|
	var height= msg[1];
	//("eye right height="+height).postln;		//debug
}, '/gesture/eye/right');
OSCFunc({|msg|
	var height= msg[1];
	//("jaw height="+height).postln;				//debug
}, '/gesture/jaw');
OSCFunc({|msg|
	var height= msg[1];
	//("nostrils height="+height).postln;			//debug
}, '/gesture/nostrils');
)

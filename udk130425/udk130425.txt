130425: colour tracking with a webcam in PureData controls sound files recorded in Audacity (+ try FaceOSC)


//--install audacity
download and install Audacity (2.0.3) from http://audacity.sourceforge.net
record a simple stereo soundfile from internal microphone
save as wav 16bit


//--install pd (pure-data)
download and install Pd-extended (0.43.4) from http://puredata.info
show http://www.pd-tutorial.com

build a simple gem patch with pix_video
look at the udk-colourtracking.pd patch
load different soundfiles, try changing threshold, speed etc
add a speedlim after change
connect a colour to speed.  with smooth and scale


//--more
try with dvcam to zoom in and nightshot
raspberry pi + webcam + pd + battery= cheap small wireless sound trigger device


//--faceosc
see udk-faceosc.pd and udk-faceosc-blink.pd
see udk-faceosc.scd for supercollider
https://github.com/kylemcdonald/ofxFaceTracker/downloads (get BlinkExample-osx, FaceOSC.zip)
http://www.dxginger.com/2011/09/24/face-osc/
https://github.com/CreativeInquiry/FaceOSC-Templates
http://golancourses.net/2013/category/project-1/face-osc/


http://simplecv.org/download

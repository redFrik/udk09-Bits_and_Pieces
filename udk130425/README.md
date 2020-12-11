130425
======

_colour tracking with a webcam in PureData controls sound files recorded in Audacity (+ try FaceOSC)_

//--install Audacity
--------------------
1. download and install Audacity (2.0.3) from <https://audacityteam.org>
2. record a simple stereo sound file from the internal microphone (OSX: set internal mic in system preferences/sound)
3. save the recording as a wav 16bit format

//--install pd (pure-data)
--------------------------
1. download and install Pd-extended (0.43.4) from <https://puredata.info> (OSX 10.8: you might need to install XQuartz (X11))
2. build a simple gem patch with pix_video (`udk-webcam.pd`)
3. play with the texture etc (`udk-test1.pd`)
4. look at the `udk-colourtracking.pd` patch, load the sound you recorded with audacity above
5. load different soundfiles, try changing threshold, speed etc
6. add a `[speedlim]` after `[change]` to reduce the rate
7. connect so that a colour changes playback speed of the soundfile. also try adding objects for smoothing and scaling

//--more
--------
* try with a dv-camera. good zoom and nightshot.  if used in combo with the pd colour tracker above, you can zoom in on details from far away in low light conditions.
* raspberry pi + webcam + pd + battery => cheap small wireless sound trigger device.

//--extras
----------
* install face osc application <https://github.com/kylemcdonald/ofxFaceTracker/releases> (get BlinkExample-osx and FaceOSC.zip)
* see `extras/udk-faceosc.pd` and `extras/udk-faceosc-blink.pd` for pd examples.
* see `extras/udk-faceosc.scd` for supercollider template code.
* demo <https://web.archive.org/web/20150910203416/www.dxginger.com/2011/09/24/face-osc/>
* more examples <https://github.com/CreativeInquiry/FaceOSC-Templates>
* nice projects <http://golancourses.net/2013/category/project-1/face-osc/>

//--links
---------
* more advanced video tracking <http://simplecv.org> using python or javascript
* learn pd <http://www.pd-tutorial.com> and <https://en.flossmanuals.net/pure-data/>

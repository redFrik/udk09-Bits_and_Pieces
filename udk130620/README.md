130620
======

_record and arrange sound with audacity + speaker/mic feedback (small batterypowered speakers, piezos, electretmics)

//--audacity
------------
* download and install from <http://audacity.sourceforge.net> (version 2.0.3).
* select internal mic as audio input.
* say 'aaaaaaa' and record your voice for approximately 5 seconds.
* select effect / normalize.
* hold down shift and click the green play button. the sound should loop with a click every 5sec.

![audacity00](https://raw.github.com/redFrik/udk09-Bits_and_Pieces/master/udk130620/audacity00.png)

* now with the marker tool selected, mark about 1 second in the end.
* select effect / fadeout.

![audacity01](https://raw.github.com/redFrik/udk09-Bits_and_Pieces/master/udk130620/audacity01.png)

* cut the 1sec marking (cmd+x).
* add a new stereo track under the tracks menu.
* make sure the cursor is at the beginning and paste the marking (cmd+v).

![audacity02](https://raw.github.com/redFrik/udk09-Bits_and_Pieces/master/udk130620/audacity02.png)

* note the duration of the marking (here 44,032 samples).
* click on the original track and mark the same length (44,032 samples) from the beginning.
* select effect / fadein.

![audacity03](https://raw.github.com/redFrik/udk09-Bits_and_Pieces/master/udk130620/audacity03.png)

* mark everything (cmd+a) and select mix&render under the tracks menu.
* hold down shift and click the green play button. the sound should now loop without any click.

![audacity04](https://raw.github.com/redFrik/udk09-Bits_and_Pieces/master/udk130620/audacity04.png)

* again mark everything (cmd+a) and select effect / paulstretch.
* listen to the result.
* repeat the effect once more (cmd+r).
* again listen to the result.
* if you used the default paulstretch settings and ran the effect twice, you should now have a approximately 7min long drone.
* mine sounds like this... <https://raw.github.com/redFrik/udk09-Bits_and_Pieces/master/udk130620/audacity.mp3>

//--assignment
--------------
* make new tracks and record new drones with the same technique. try noise by blowing into the mic, play with paper, whistle etc.

//--additional tricks
---------------------
* make multiple tracks and then look at the mixer window.
* learn the shortcuts of mark-to-end (shift+k) and mark-to-beginning (shift+j).
* play around with the zoom tool and use shift to zoom out, cmd+f and shift+cmd+f to fit to window.
* adjust volume with the envelope tool.
* try the spectrogram and the other features in the small track menu on the left side.

//--pitch analysis
------------------
* record some 'aaaaa' again.
* mark a second of sound.
* select analysis / plot spectrum.
* set the axis to 'log freq' and the size to 4096.
* put the cursor under the highest peak and read the frequency in the lower left corner (e.g. 163Hz).
* try if this is the correct pitch (e.g. in supercollider <code>{SinOsc.ar(163)}.play</code>

//--routing audio
-----------------
* download and install soundflower from <http://code.google.com/p/soundflower/> (version 1.6.6b)

//--extras
----------
* find some ladspa plugins and install <http://gaclrecords.org.uk/swh-plugins-mac-0.4.15.zip>. extract and put in `/Library/Audio/Plug-Ins/LADSPA`.
* install scau (supercollider audio unit)

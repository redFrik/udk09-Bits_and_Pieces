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
* last hold down shift and click the green play button. the sound should now loop without any click.
![audacity04](https://raw.github.com/redFrik/udk09-Bits_and_Pieces/master/udk130620/audacity04.png)

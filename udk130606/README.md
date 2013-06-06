130606
======

_take different sensors and log/share data online (Cosm etc)

NOTE: relocation to room 213 or 214 due to clash with Shapiro's workshop.

as a homework complete ONE OR MORE of the following sections.
be prepared next week to demonstrate what you did and give an example of what you could imagine using it for.

//--thingspeak1 (easy)
----------------------
posting data from supercollider to thingspeak
* go to <https://www.thingspeak.com> and sign up
* create a new channel
* call it something and make it public
* name the fields 1-3 freq, amp, rate
* copy your own 'Write API Key' under API Keys. it should look something like this... ANK3NL2O5IUXFWM1
* open the file `scThingSpeak.scd` in supercollider
* paste your own 'Write API Key' into the document where it says 'setup key'
* run the code and play with the different settings. your data should be plotted in realtime at thingspeak

//--thingspeak2 (medium)
------------------------
posting data from arduino via supercollider to thingspeak
* first do all the steps in thingspeak1 above
* connect an arduino and up to three analog sensors (ldr, pots, etc) and load the sketch `analogReadThreeSensors`
* run the code in `scThingSpeak2.scd`. you should see the values of the sensors sent every 15 seconds.

//--thingspeak3 (medium)
------------------------
reading data back from thingspeak into supercollider
* first do all the steps in thingspeak1 above (or thingspeak2 if you want to use an arduino with sensors)
* then open the terminal, cd to the folder thingspeak3 and type `python scThingSpeak3.py 6123` but replace 6123 with your own channel number
* the python program should start posting lines like `200 OK` and `701.0 0.7 0.47`
* open sc and the file `scThingSpeak3.scd`
* start the routine then use the three variables `~freq`, `~amp`, `~rate` for something

//--processing (easy)
---------------------
posting data from an arduino via processing
* go to <https://www.thingspeak.com> and sign up
* create a new channel
* call it something and make it public
* name the fields 1-3 freq, amp, rate
* copy your own 'Write API Key' under API Keys. it should look something like this... ANK3NL2O5IUXFWM1
* connect 3 sensors and load the analogReadThreeSensors sketch onto an arduino
* open the processingThingSpeak sketch in processing (2.0)
* edit the serial port (default is 10 - change this number)
* edit the 'Write API Key' and replace it with your own
* run the sketch and values should be updated once every 15 sec over at your thingspeak channel

//--php (advanced)
------------------
setting up a website with php scripts and a mysql database
* create an account at http://en.altervista.org
* log in and go to altersite / database and create a database
* click `Access to PhpMyAdmin` and give name+pass
* in phpmyadmin click your database name to the left
* create a new table with 4 fields. call them freq, amp, rate, time
* for freq, amp and rate set type to `FLOAT`
* for time set type to `DATETIME` and index to `primary`
* edit the file `advanced-write.php` where it says 'edit your data here'
* edit the file `advanced-read.php` where it says 'edit your data here'
* upload these php files to your site
* edit the file `advanced.py` and put in your own host (host should point to where the php files are)
* open terminal and test to write values to the database with: `python advanced.py 404 0.3 0.2`
* check in phpmyadmin that the three values showed up
* visit your host+advanced-read.php to see the data. e.g. <http://redfrik.altervista.org/advanced-read.php>

//--links
---------
* <http://ksduino.org/>
* <http://exosite.com>
* <https://xively.com> (previously cosm / pachube)
* <http://www.nimbits.com>
* <http://paraimpu.crs4.it>
* <http://tempo-db.com>
* <http://open.sen.se>
* <http://emoncms.org>
* <http://www.etherios.com/products/devicecloud/>
* <https://www.temboo.com>
* <http://make.larsi.org/WeatherStation/download/Processing/ThingSpeak/ThingSpeak.pde>
* <https://github.com/ericbenwa/POST-Arduino-Data-Wireless>
* <https://github.com/billroy/arduino-redis-datalogger>

//--extras
----------
* do port forwarding on your home router
* get a dedicated VPS server and install rrdtool

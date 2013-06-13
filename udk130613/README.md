130613
======

_controlling computers from remote with Terminal (simple terminal commands and telnet, ssh, ftp)

//--terminal
------------
* test some simple commands like `cd`, `ls`, `ls -la`, `pwd`, `cp`, `mkdir`, `touch`, `man`
* other useful commands/programs: `pico`, `top`, `kill`, `file`, `ping`
* see <http://ss64.com/osx/>
* up / down arrow = command history
* learn to use tab for autocompletion (quickly find pathnames and commands)
* ctrl+a / ctrl+e = jump to beginning/end
* cmd+k = clear screen
* often ctrl+c is used to quit or exit.
* try running some of these commands from supercollider using the .unixCmd method. e.g. `"cd ~/Documents; ls".unixCmd`
* try to ping each others computers, routers or websites (`ping google.de`).

//--telnet
----------
telnet is more for fun and rarely of any practical use. it's also UNSAFE! use ssh instead (see below).
* open Terminal and type `telnet Telehack.com` and try out starwars for example.
* or try out these: `telnet zombiemud.org`, 
* type `sudo launchctl load -w /System/Library/LaunchDaemons/telnet.plist` to start a telnet server on your machine. make sure firewall isn't blocking port 23.
* now you can log in from remote if you know your ip address. to try it locally type `telnet 127.0.0.1`. give your computer login and password (i.e. the main user).
* IMPORTANT: to turn telnet off again type `sudo launchctl unload -w /System/Library/LaunchDaemons/telnet.plist`

//--ftp
-------
stands for File Transfer Protocol. very useful for up/downloading files. there is also the variant sftp (Secure File Transfer Protocol).
* type in terminal: `ftp ftp.sunet.se` and log in with name anonymous and blank password.
* type `cd pub` to change to public directory
* type `ls` to list the files and folders
* type `cd music/Johnny.Cash` to go to a folder 2 levels down
* type `?` to see available ftp commands
* type `lpwd` to see your current (local) directory
* type `more HEADER.html` to see the content of a file
* type `get cash_fu.jpg` to download this jpeg file to your current directory (the one shown by `lpwd` above)
* type `exit` to logout and quit ftp
* after exit type `open cash_fu.jpg` to launch a program to open the jpeg file.
* type `rm cash_fu.jpg` to delete the jpeg file

//--ssh
-------
stands for Secure SHell and is another very used standard for remote control of computers.
* type in terminal `ssh 127.0.0.1` (or `ssh localhost` - it means the same)
* now you probably will see `ssh: connect to host localhost port 22: Connection refused`. that means ssh isn't activated on your computer. go to system preferences / sharing and activate "remote login".
* repeat the `ssh 127.0.0.1` and this time you should get a question about authenticity. answer yes.
* now you should be logged in to your own computer via ssh. (pointless but just to prove it working). logout and leave with `exit`.
* IMPORTANT: although ssh should be considered safe, remember to turn off remote login in system preferences / sharing when you don't use it.

//--ssh on my rpi
-----------------
* now try to connect to my Raspberry Pi that is connected to my home router in my house. the details are (temporarily for today only) `ssh pi@92.229.62.95` and password `raspberry`. note: i will remove this after this seminar so it will only work in class.
* when logged in type `users` to see which users are logged in. probably many pi users as we all use the same name
* browse around and see what happens. experiment. create some files (`mkdir`, `touch`, `pico`), download files others made (`scp`).
* open a new terminal window and type: `scp pi@92.229.62.95:/home/pi/test/udkSSHtest.txt ~/Documents/` to copy the file udkSSHtest.txt to your documents folder.

//--extra
---------
* instead of an IP address you can register a domain name and have that point to your home router. for example <https://www.noip.com> provides free account.
* so to do the same as above but with my free dyndns try `ssh pi@redfrik.no-ip.biz`. the domain name redfrik.no-ip.biz will be translated to ip 92.229.62.95 or whatever ip my router is using in the future.

to make this work on your own internet connection at home, you'll need to set up something called port forwarding on your router. for ssh it should look something like this...
![homeRouterSettings](https://raw.github.com/redFrik/udk09-Bits_and_Pieces/master/udk130613/home_router_settings.png)

//--vnc
-------
a.k.a. screensharing. probably the best way to remote control computers. vnc is built in to osx, but sometimes you might need additional programs like chicken or realvns (connecting to linux computers like beaglebone black for instance).

//--links
---------
* <http://www.telnet.org/htm/places.htm>
* <http://gettingstartedwithraspberrypi.tumblr.com/post/29988200199/ssh>
* <http://sourceforge.net/projects/chicken/>
* <http://www.realvnc.com/products/>

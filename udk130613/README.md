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
stands for File Transfer Protocol. very useful and wide spread for up/downloading files. there is also the variant sftp (Secure File Transfer Protocol).
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

//--vnc
-------

//--links
---------
* <http://www.telnet.org/htm/places.htm>

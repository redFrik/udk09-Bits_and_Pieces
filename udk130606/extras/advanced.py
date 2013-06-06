#!/usr/bin/python

#a simple python script for posting 3 values to a mysql database via a php script on a server
#the three arguments should be values for freq, amp and rate

import sys, httplib, urllib

host= 'redfrik.altervista.org'	#edit this!

if len(sys.argv)!=4:
	sys.exit('error: give 3 floats (freq, amp, rate) as arguments')

a1= float(sys.argv[1])	#freq
a2= float(sys.argv[2])	#amp
a3= float(sys.argv[3])	#rate

params= urllib.urlencode({'freq': a1, 'amp': a2, 'rate': a3})
headers= {"Content-type": "application/x-www-form-urlencoded", "Accept": "text/plain"}
conn= httplib.HTTPConnection(host)
try:
	conn.request('POST', '/advanced-write.php', params, headers)
	response= conn.getresponse()
	print response.status, response.reason
	conn.close()
except:
	print 'connection failed'

#!/usr/bin/python

#a simple python script for posting 3 values to a thingspeak channel
#first argument should be the thingspeam write api key,
#following three arguments should be values for fields 1-3

import sys, httplib, urllib

if len(sys.argv)!=5:
	sys.exit('error: give write_api_key and 3 floats (freq, amp, rate) as arguments')

key= str(sys.argv[1])
f1= float(sys.argv[2])	#freq
f2= float(sys.argv[3])	#amp
f3= float(sys.argv[4])	#rate

params= urllib.urlencode({'key': key, 'field1': f1, 'field2': f2, 'field3': f3})
headers= {"Content-type": "application/x-www-form-urlencoded", "Accept": "text/plain"}
conn= httplib.HTTPConnection('api.thingspeak.com:80')
try:
	conn.request('POST', '/update', params, headers)
	response= conn.getresponse()
	print response.status, response.reason
	conn.close()
except:
	print 'connection failed'

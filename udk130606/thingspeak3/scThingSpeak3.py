#!/usr/bin/python

#a simple python script for reading the 3 last values from a thingspeak channel
#first argument should be the thingspeak channel index
#the resulting values will be written to a temporary file

import sys, httplib, urllib, json, os, time

if len(sys.argv)!=2:
	sys.exit('error: give channel as an argument')

channel= str(sys.argv[1])

while True:
	conn= httplib.HTTPConnection('api.thingspeak.com:80')
	try:
		conn.request("GET", "/channels/"+channel+"/feed/last.json")
		response= conn.getresponse()
		print response.status, response.reason
		if response.status in (200, 304):
			data= json.loads(response.read())
			print data['field1'], data['field2'], data['field3']
			f= open('thingspeak3DATA.txt', 'w')
			f.write(data['field1']+' '+data['field2']+' '+data['field3'])
			f.close()
		else:
			print 'connection failed 1'
		conn.close()
	except:
		print 'connection failed 1'
	time.sleep(5)
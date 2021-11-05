#!/bin/bash
#This script monitor the availability of a service, of which name has to be specified as a boot argument
#for the script. The script would run indefinitely and if the service that it monitors stops, it
#should, it should do three things: Restart the service, Write a message to syslog, Send an email to the root user

###### exit code documentation
# 3: no argument provided
# 4: service is not running
######


#make sure that service name is provided as an argument
if [ -z $1 ]; then
	echo you need to provide a service name when starting this script
	exit 3
else
	SERVICE=$1
fi

#run without stopping to do the monitoring task
# verify that $SERVICE is running
if ps aux | grep $SERVICE | grep -v grep | grep -v servicemon; then
	echo all good
else
	echo \$SERVICE could not be found as a process
	echo Make sure that \$SERVICE is running and try again
	echo 'The command ps aux | grep \$SERVICE should show the service up and running'
	exit 4
fi
# monitor $SERVICE
while ps aux | grep $SERVICE | grep -v grep | grep -v servicemon
do
	sleep 10
done





# actions if services is failing
# assuming that the service processname can be started with the service command
service $SERVICE start
logger servicemon: $SERVICE restarted
mail -s "servicemon: $SERVICE restated at $(date +%d-%m-%Y %H:%M)" root < .




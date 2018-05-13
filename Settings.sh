#!/bin/bash
dir=$(pwd)
# Get the file, as per naming convention (update for any changes on the file name)
file=$dir'/settings'

#echo "setting directory = "$file

if [ -e $file ]
then
	#echo "File Exists"
	false=false
else
	#echo "Setting File does not exist"
	#Create Settings
	echo "#in format of {setting}={variable}" > settings
fi

req=$1

#Actual Scripts

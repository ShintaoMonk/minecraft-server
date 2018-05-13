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
	stop
fi

req=$1

# Actual Script

cat $file | while read line
do
#For each line

#Check for "#" lines
if [[ $line != "#"* ]]
then
##

pre=${line%%=*}
#echo $pre

if [[ $pre == $req ]]
then
	echo ${line#*=}
fi

#Finish
fi

#End for each line
done

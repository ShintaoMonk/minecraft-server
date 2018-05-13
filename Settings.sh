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
val=$2
action="write"
if [[ $val == "" ]]
then
	action="read"
else
	echo "" > $dir'/setting.tmp'
fi

#Actual Scripts

cat $file | while read line
do
	equal="false"
	
	lnnme=""
	lnval=""
	
	if [[ $action == "write" ]]
	then
		if [[ $equal == "false" ]]
		then
			echo $lnnme"="$lnnme >> $dir'/setting.tmp'
		else
			echo $lnnme"="$val >> $dir'/setting.tmp'
		fi
	else
		if [[ $lnnme == $req ]]
		then
			echo $lnval
		fi
	fi
done

if [[ $action == "write" ]]
then
	cat $dir'/setting.tmp' > $dir'/setting'
fi

rm $dir'/setting.tmp'

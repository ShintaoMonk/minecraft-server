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

exists="false"

cat $file | while read line
do
	equal="false"
	lnnme=${line%%=*}
	lnval=${line#*=}
	invis="false"

	if [[ $line == '#'* ]]
	then
		equal='false'
		invis="true"
	else
		if [[ $line == "" ]]
		then
			equal='false'
			invis="true"
		else
			if [[ $lnnme == $req ]]
			then
				equal='true'
			fi
		fi
	fi

	if [[ $action == "write" ]]
	then
		if [[ $invis == "true" ]]
		then
			echo $line >> $dir'/setting.tmp'
		else
			if [[ $equal == "false" ]]
			then
				echo $lnnme"="$lnnme >> $dir'/setting.tmp'
			else
				echo $lnnme"="$val >> $dir'/setting.tmp'
				exists="true"
			fi
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
	if [[ $exists == "false" ]]
	then
		echo $req"="$val >> $dir'/setting.tmp'
	fi
	mv -u $dir'/setting.tmp' $dir'/setting'
fi

if [ -e $dir'/setting.tmp' ]
then
	rm $dir'/setting.tmp'
fi

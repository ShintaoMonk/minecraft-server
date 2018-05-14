#!/bin/bash
dir=$(pwd)
# Get the file, as per naming convention (update for any changes on the file name)
file=$dir'/settings'

tmpname=$dir"/.settings.tmp"

#echo "setting directory = "$file
if [[ $1 == "" ]]
then
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
		echo "" > $tmpname
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
				echo $line >> $tmpname
			else
				if [[ $equal == "false" ]]
				then
					echo $lnnme"="$lnnme >> $tmpname
				else
					echo $lnnme"="$val >> $tmpname
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
			echo $req"="$val >> $tmpname
		fi
		mv -u $dir'/setting.tmp' $tmpname
	fi
	
	if [ -e $tmpname ]
	then
		rm $tmpname
	fi
fi

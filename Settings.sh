#!/bin/bash
dir=$(pwd)
# Get the file, as per naming convention (update for any changes on the file name)
file=$dir'/settings'
tmp=$dir'/.settings.tmp'

if [[ $1 == "" ]]
then
	foo=foo
else
	#Get Action
	action="change"
	if [[ $2 == "" ]]
	then
		action="find"
	else
		echo "" > $tmp
	fi
	cat $file | while read line
	do
		if [[ $line != "" && $line != "#"* ]]
		then
			lnnme=${line%%=*}
			lnvar=${line#*=}
			if [[ $lnnme == $1 ]]
			then
				if [[ $action == "find" ]]
				then
					echo $lnvar
				else
					echo $1"="$2 >> $tmp
				fi
			else
				if [[ $action == "change" ]]
				then
					echo $line >> $tmp
				fi
			fi
		else
			if [[ $action == "change" ]]
			then
				echo $line >> $tmp
			fi
		fi
	done
fi

if [[ $action == "change" ]]
then
	mv -u $tmp $file
fi

if [ -e $tmp ]
then
	rm $tmp
fi
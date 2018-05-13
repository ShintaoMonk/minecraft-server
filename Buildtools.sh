#!/bin/sh
link="https://hub.spigotmc.org/jenkins/job/BuildTools/lastStableBuild/artifact/target/BuildTools.jar"
dir=$(pwd)

blddir=$dir'/BuildTools'

if [ -e $blddir ]
then
	echo "Found Dir"
else
	echo "Did not find directory, creating"
	mkdir $blddir
fi


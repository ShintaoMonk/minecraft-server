#!/bin/sh
link="https://hub.spigotmc.org/jenkins/job/BuildTools/lastStableBuild/artifact/target/BuildTools.jar"
dir=$(pwd)

if [ -e $dir'/BuildTools' ]
then
	echo "Found Dir"
else
	echo "Did not find directory, creating"
	mkdir $dir'/BuildTools'
fi

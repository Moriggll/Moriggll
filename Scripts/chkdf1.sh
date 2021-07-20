#!/bin/bash

datei=df.log
limit=$1
df | tail -n +2 | awk '{ print $5,$6}' | tr '%' ' ' > $datei

while read record
do
	prozent=$(echo $record | cut -c 1-3 | tr '/' ' ')
	drive=$(echo $record | grep -o "/.*")
#	echo $prozent
#	echo $drive
	if [ $prozent -gt $limit ]
	then
		echo "mountpoint "$drive" ist zu mehr als "$limit"% voll"
		echo ""	
fi
done < $datei

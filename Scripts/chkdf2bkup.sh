#!/bin/bash

OLDIFS=$IFS
#Datei mit output des DF commands
datei="df.log"

#schreiben von $datei
df | tail -n +2 | awk '{ print $5,$6}' | tr '%' ' ' > $datei

#seperator
echo $IFS
IFS="="
echo $IFS

while getopts d:f:t: opt; do
        case $opt in
		d) echo "please specify the new seperator"
		   confdatei=$OPTARG
		   echo $confdatei "is the selected file"
		   read IFS
		   echo $IFS "is the new seperator";;
		f) confdatei=$OPTARG
		   echo $confdatei "is the selected file";;
		t) echo "please specify the percantage you want to check"
		   read conflimit;;
		?) echo "please use option a correct option"; exit ;;
        esac
done
echo $IFS

declare -A array1
while read confdrive conflimit
do
#       echo $confdrive
#	echo $conflimit
        array1[$confdrive]=$conflimit

	while read record
	do
        	prozent=$(echo $record | cut -c 1-3 | tr '/' ' ')
        	drive=$(echo $record | grep -o "/.*")
#	       	echo $prozent
#      		echo $drive
		if [ $drive == $confdrive ]
		then
#			echo "drives sind gleich"
		       	if [ $prozent -gt $conflimit ]
                	then
                        	echo "mountpoint "$drive" ist zu mehr als "$conflimit"% voll"
	                fi
		fi
	done < $datei
done < $confdatei

#IFS=$OLDIFS

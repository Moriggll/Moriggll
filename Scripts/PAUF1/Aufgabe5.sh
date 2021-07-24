#!/bin/bash

OLDIFS=$IFS
#Datei mit output des DF commands
datei="ps.log"
Arg=$1

#schreiben von $datei
ps -ef | awk '{ print $2,$3,$8}' > $datei

#read record and fill in Vars
while read record
do
	PID1=$(echo $record | awk '{ print $1}')
	PPID1=$(echo $record | awk '{ print $2}')
	CMD1=$(echo $record | awk '{ print $3}')
#	echo $PID1
#	echo $PPID1
#	echo $CMD1
	if [[ $CMD1 == *$Arg* ]]
	then
		echo $PID1 $PPID1 $CMD1
	fi 

done < $datei

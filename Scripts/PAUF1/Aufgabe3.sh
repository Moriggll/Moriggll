#!/bin/bash
dfdatei="Aufgabe_3_df.log"

df -Th | awk '{ print $7,$2 }' > $dfdatei

#while getopts opt; do
#	case $
#test=$OPTARG
#echo $test


declare -A filerecordarray1
while read mountpoint filesystemtype
do
#	echo $mountpoint
#	echo $1
	if [ $mountpoint == $1 ]
	then
		echo $filesystemtype
	fi

#	echo $filesystemtype
done < $dfdatei

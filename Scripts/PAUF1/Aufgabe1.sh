#!/bin/bash

datei=$1
count=0
#echo $datei

#if [[ ls -s $datei | cut 1 -eq ]]
#then
#echo "test"
#fi

usage()
{
exit 1
}

while read record
do
	let count=$count+1
	echo $count $record

done < $datei

echo $count "Zeilen nummeriert"

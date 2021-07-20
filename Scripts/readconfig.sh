#!/bin/bash

OLDIFS=$IFS
declare -A array1

while getopts d: option; do
	case $option in
		d) IFS=$OPTARG; echo "$OPTARG" ;;
		?) echo "please use option d"; exit ;;
	esac
done

declare -A array1

datei=test.cfg

while read key value
do
	echo $key
	array1[$key]=$value
done < $datei


for key in ${!array1[@]}; do
	echo "Key:$key Value:${array1[$key]}"
done

IFS=$OLDIFS

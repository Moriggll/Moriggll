#!/bin/bash

#get directories in Array
ArgArr1=( "$@" )
count_max=$#
count=0
#echo ${ArgArr1[$count]}
#echo ${ArgArr1[1]}
#echo ${ArgArr1[2]}

while [[ count_max -gt count ]]
do
	echo ${ArgArr1[$count]}
	cd ${ArgArr1[$count]} 1> /dev/null
#	mkdir ${ArgArr1[$count]}"/1"
	let count=$count+1

done



#test was done with
#./Aufgabe6.sh ~/test $HOME/test1 /bla


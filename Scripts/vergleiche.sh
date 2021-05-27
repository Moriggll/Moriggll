#!/bin/bash

Zahl1=$1
Zahl2=$2


if [[ $# != 2 ]]
then
	echo "geben sie zwei zahlen an"
	exit 1
fi

if [[ $Zahl1 == $Zahl2 ]]
then
	echo "zahlen sind gleich gross"
	exit 0
fi

if [[ $Zahl1 > $Zahl2 ]]
then
	echo "erste zahl ist grösser"
else
	echo "zweite zahl ist grösser"
fi

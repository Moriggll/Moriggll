#!/bin/bash
endung=$1
quelle=$2
ziel=$3

for i in $(find $quelle -name "*"$endung -print)
do
	cp $i $ziel
done

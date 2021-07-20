#!/bin/bash

while getopts abcf*: option 2>/dev/null; do
	case $option in
	a) echo "-a" ;;
	b) echo "-b" ;;
	c) echo "-c" ;;
	f) echo "-f" ;;
	*) echo "Unbekannt";;
	esac
done

echo "ja oder nein"
read antwort
case $antwort in
	[jJ] | [jJ][aA]) echo "ja" ;;
	[nN] | [nN][eE][iI][nN]) echo "nein" ;;
	*)	echo "ja oder nein????" ;;
esac

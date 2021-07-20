#!/bin/bash

select opt in "1" "2" "3"; do
	case $opt in
	"1") echo "1" ;;
	"2") echo "2" ;;
	"3") echo "3" ;;
	*) echo "unbekannt"; break;;
	esac
done

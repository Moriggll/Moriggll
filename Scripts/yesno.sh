#!/bin/bash

while true;do
	read -p "Geben Sie Yes oder No ein: " input
	[ "$input" = "test" ] && break
	echo "Ihre eingabe: $input"
done

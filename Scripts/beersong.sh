#!/bin/bash
Strophenwhile=$1
while [ $Strophenwhile -gt 0 ]
do
	echo $Strophenwhile "Flaschen Bier im Kühlschrank"
	echo $Strophenwhile "Flaschen Bier"
	echo "Nimm eine raus"
	echo "Trink sie aus"
	let Strophenwhile=$Strophenwhile-1
done

if [ $Strophenwhile -eq 0 ]
then
	echo "Der Kühlschrank ist leer"
fi

#!/bin/bash
scriptname=$1
beschreibung=$2
autor=$3
version=$4

if [[ $# -lt 4 ]]
then
	echo "Please enter 4 parameters"
	exit 1
fi

if [ -e $# ]
then
	echo $1 existiert schon
	exit 2
fi

echo "#!/bin/bash" >> $scriptname
echo "#Beschreibung	: $beschreibung" >> $scriptname
echo "#Autor		: $autor" >> $scriptname
echo "#Version		: $version" >> $scriptname

chmod +x $scriptname



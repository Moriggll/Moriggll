#!/bin/bash

OLDIFS=$IFS
#Datei mit output des DF commands
datei="df.log"

option_i()
{
#echo "in funktion"
#echo $i_conflimit 
echo $i_time

declare -A array1
while 
do
sleep 10
while read confdrive conflimit
do
#       echo $confdrive
#       echo $conflimit
        array1[$confdrive]=$conflimit
#       echo $confdrive
        while read record
        do
                prozent=$(echo $record | cut -c 1-3 | tr '/' ' ')
                drive=$(echo $record | grep -o "/.*")
#               echo $prozent
#               echo $drive
                if [ $drive == $confdrive ]
                then
#                       echo "drives sind gleich"
                        if [ $prozent -gt $i_conflimit ]
                        then
                                echo "mountpoint "$drive" ist zu mehr als "$i_conflimit"% voll"
                        fi
                fi
        done < $datei
done < $confdatei
done
}





option_t()
{
#echo "in funktion"
#echo $t_conflimit 

declare -A array1
while read confdrive conflimit
do
#       echo $confdrive
#       echo $conflimit
        array1[$confdrive]=$conflimit
#	echo $confdrive
        while read record
        do
                prozent=$(echo $record | cut -c 1-3 | tr '/' ' ')
                drive=$(echo $record | grep -o "/.*")
#               echo $prozent
#               echo $drive
                if [ $drive == $confdrive ]
                then
#                       echo "drives sind gleich"
                        if [ $prozent -gt $t_conflimit ]
                        then
                                echo "mountpoint "$drive" ist zu mehr als "$t_conflimit"% voll"
                        fi
                fi
        done < $datei
done < $confdatei
}

option_f()
{
declare -A array1
while read confdrive conflimit
do
#       echo $confdrive
#       echo $conflimit
        array1[$confdrive]=$conflimit

        while read record
        do
                prozent=$(echo $record | cut -c 1-3 | tr '/' ' ')
                drive=$(echo $record | grep -o "/.*")
#               echo $prozent
#               echo $drive
                if [ $drive == $confdrive ]
                then
#                       echo "drives sind gleich"
                        if [ $prozent -gt $conflimit ]
                        then
                                echo "mountpoint "$drive" ist zu mehr als "$conflimit"% voll"
                        fi
                fi
        done < $datei
done < $confdatei
}


option_d()
{
echo $IFS
declare -A array1
while read confdrive conflimit
do
#       echo $confdrive
#       echo $conflimit
        array1[$confdrive]=$conflimit

        while read record
        do
                prozent=$(echo $record | cut -c 1-3 | tr '/' ' ')
                drive=$(echo $record | grep -o "/.*")
#               echo $prozent
#               echo $drive
                if [ $drive == $confdrive ]
                then
#                       echo "drives sind gleich"
                        if [ $prozent -gt $conflimit ]
                        then
                                echo "mountpoint "$drive" ist zu mehr als "$conflimit"% voll"
                        fi
                fi
        done < $datei
done < $confdatei


}





#schreiben von $datei
df | tail -n +2 | awk '{ print $5,$6}' | tr '%' ' ' > $datei

#seperator
IFS="="

while getopts d:f:i:t: opt; do
        case $opt in
		d) echo "please specify the new seperator"
		   confdatei=$OPTARG
		   echo $confdatei "is the selected file for option d"
		   read IFS
		   echo $IFS "is the new seperator";;
		f) confdatei=$OPTARG
		   echo $confdatei "is the selected file for option f"
		   option_f;;
		i) confdatei=$OPTARG
		   echo $confdatei "is the selected file for option i" 
		   echo "Option i lets the program fun in the background. Please specify the amount of seconds when the prog should check again"
		   read i_time
		   echo "please specify the percentage you want to check"
		   read i_conflimit
		   option_i;;
		t) echo "please specify the percantage you want to check"
		   confdatei=$OPTARG
		   echo $confdatei "is the selected file for option t"
		   read t_conflimit
		   option_t;;
		?) echo "please use option a correct option"; exit ;;
        esac
done

#IFS=$OLDIFS

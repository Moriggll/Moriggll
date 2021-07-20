#!/bin/bash

#1.
git config --global user.name "lukas.moriggl"
git config --global user.email "lukas.moriggl@student.ifa.ch"




#2.
mkdir /home/student/loesungen/repo
cd /home/student/loesungen/repo
git init

#3
cp /home/moriggl/Aufgaben/Scripts/PAUF1/Aufgabe3.sh /home/student/loesungen/repo

#4
touch /home/stundent/loesungen/repo/Geheim
cd /home/stundent/loesungen/repo
echo "Hello World" >> Geheim
cd .git/info/
echo "/home/student/loesungen/repo/Geheim" >> ./exclude
cd ../..
git ls-files --others --exclude-from=.git/info/exclude

#5

#!/usr/bin/sh
#Dependency: run "brew install coreutils"
#run "sh pc_monitor c4r10"

counter=0
seat=1
row=1

while :
do
	if [ ${row} == 18 ]
		then printf "\n"
	fi
	if [[ ${seat} == 1 && ${row} -lt 10 ]]
		then printf ${row}"  "
	fi
	if [[ ${seat} == 1 && ${row} -gt 9 && ${row} -lt 18 ]]
		then printf ${row}" "
	fi
	if [ ${seat} == 6 ]
		then printf "  "
	fi
	if [[ ${row} == 17 && ${seat} == 1 ]]
	then 
			printf "            " 
			seat=6
	fi
	if gtimeout 0.01 ping $1r${row}s${seat} -c 1 | grep -q "64"
		then printf "⚪"
		else printf "❌"
	fi
	if [[ ${row} -lt 5 && ${seat} -gt 4 ]]
	then
			printf "\n"
			((row++))
			seat=0
	fi
	if [[ ${row} -lt 18 && ${seat} -gt 10 ]]
	then
			printf "\n"
			((row++))
			seat=0
	fi
	((seat++))
	((counter++))
done
printf "\n"

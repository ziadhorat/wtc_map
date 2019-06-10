#!/usr/bin/sh
#Dependency: run "brew install coreutils"

case "$1" in
	-h|--help)
		echo "----HELP-----"
		echo "Floor 4:\tsh "`basename "$0"`" -4"
		echo "Floor 5:\tsh "`basename "$0"`" -5"
		echo "Help:\t\tsh "`basename "$0"`" -h"
		;;
	-4)
		echo "-----FLOOR 4-----"
counter=0
seat=1
row=1

while [ $row -le 17 ]
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
	if gtimeout 0.01 ping c4r${row}s${seat} -c 1 | grep -q "64"
		then printf "💻"
		else printf "❌"
	fi
	if [[ ${row} -lt 5 && ${seat} -gt 4 ]]
	then
			printf "\n"
			((row++))
			seat=0
	fi
	if [[ ${row} -le 17 && ${seat} -gt 10 ]]
	then
			printf "\n"
			((row++))
			seat=0
	fi
	((seat++))
	((counter++))
done
printf "\n"
seat=5
while [ $seat -ge 1 ]
do
	row=18
	printf "		"
	while [ $row -le 25 ]
	do
	if [[ $row == 22 && $seat == 5 || $row == 25  && $seat == 5 ]]
	then
		printf "  "
	else 
	if gtimeout 0.01 ping c4r${row}s${seat} -c 1 | grep -q "64"
		then printf "💻"
		else printf "❌"
	fi
fi
	printf ' '
	((row++))
done
printf "\n"
((seat--))
done
printf "		18 19 20 21 22 23 24 25\n"
		;;
	-5)
		echo "-----FLOOR 5-----"
row=1
seat=1
while [ $row -le 12 ]
do
	if gtimeout 0.01 ping c5r${row}s${seat} -c 1 | grep -q "64"
		then printf "💻"
		else printf "❌"
	fi
done
printf "\n"
		;;
	*)
		echo "Flag "$1" doesn't exist"
		echo "Help:\t\tsh "`basename "$0"`" -h"
		;;
esac

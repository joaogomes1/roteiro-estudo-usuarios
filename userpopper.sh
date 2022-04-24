#! /bin/sh

export SKEL_REGULAR="/etc/joao_skel_regular"
export SKEL_TEMP="/etc/joao_skel_temp"

OPTION=$1

export PID_MAIN=$$
#echo "[DEBUG]: pid main = $PID_MAIN"

if [ "$OPTION" = "--create" ]; then
	
	echo "Calling create-skels.sh..."
	./create-skels.sh $PID_MAIN

	echo "Calling create-users.sh..."
	./create-users.sh $PID_MAIN
	
elif [ "$OPTION" = "--remove" ]; then
	
	echo "Calling remove-users.sh..."
	./remove-users.sh $PID_MAIN
	
	echo "Calling remove-skels.sh..."
	./remove-skels.sh $PID_MAIN
	
elif [ "$OPTION" = "--help" ]; then
	
	less help

else

	echo "Invalid option. Try './userpopper.sh --help' (without quotes) for more infomation."
	exit
	
fi

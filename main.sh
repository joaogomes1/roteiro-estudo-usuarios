#! /bin/sh
	
OPTION=$1

if [ "$OPTION" = "--c" ]; then
	
	echo "creating skels..."
	./createSkels.sh

	echo "creating users..."
	./createUsers.sh
	
elif [ "$OPTION" = "--d" ]; then
	echo "deleting users..."
	./delUsers.sh
	echo "deleting skels..."
	./delSkels.sh
elif [ "$OPTION" = "--h" ]; then
	echo "show help"
else
	echo "invalid option. Use --h for help"
	exit
fi

#! /bin/sh
. ./common-lib

COUNTER=0
USERS=10

echo "Initializing create-users.sh..."
#echo "[DEBUG]: create-users PID $$"

while [ $COUNTER != $USERS ]
do
  
  USERNAME=$(awk -v counter=$(expr $COUNTER + 2) 'NR==counter { print $1 }' FS=';' user-list )
  CONTRACT_EXPIRATION_DATE=$(awk -v counter=$(expr $COUNTER + 2) 'NR==counter { print $2 }' FS=';' user-list )
  
  # Creates users
  echo "Creating user $USERNAME..."
  
  if [ $CONTRACT_EXPIRATION_DATE != 0 ]; then # Temporary employee
	
	sudo useradd -m -p $(echo $USERNAME | openssl passwd -1 -stdin) -k /etc/joao_skel_temp -g users $USERNAME
	errorCheck $? $$ $PID_MAIN

	sudo chage -E $CONTRACT_EXPIRATION_DATE $USERNAME
	sudo chage -W 15 $USERNAME
	
  else # Permanent employee
  
	sudo useradd -m -p $(echo $USERNAME | openssl passwd -1 -stdin) -k /etc/joao_skel_regular -G storage,scanner,users $USERNAME
	errorCheck $? $$ $PID_MAIN
		
  fi
  
  sudo chage -d 0 $USERNAME
  sudo chage -M 60 $USERNAME
  
  sudo usermod -aG audio,video $USERNAME
  
  COUNTER=$(expr $COUNTER + 1)
done

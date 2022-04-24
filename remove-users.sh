#! /bin/sh
. ./common-lib

COUNTER=0
USERS=10

echo "Initializing remove-users.sh..."

while [ $COUNTER != $USERS ]
do
  
  # USERNAME=$(sed -n "$COUNTER p" user-list)
  USERNAME=$(awk -v counter=$(expr $COUNTER + 2) 'NR==counter { print $1 }' FS=';' user-list )
  CONTRACT_EXPIRATION_DATE=$(awk -v counter=$(expr $COUNTER + 2) 'NR==counter { print $2 }' FS=';' user-list )
  
  sudo userdel -r $USERNAME
  errorCheck $? $$
  
  COUNTER=$(expr $COUNTER + 1)
  
done



#! /bin/sh
. ./common-lib

COUNTER=0
USERS=10

echo "Initializing remove-users.sh..."

while [ $COUNTER != $USERS ]
do
  
  # USERNAME=$(sed -n "$COUNTER p" lista-usuarios)
  USERNAME=$(awk -v counter=$(expr $COUNTER + 2) 'NR==counter { print $1 }' FS=';' lista-usuarios )
  CONTRACT_EXPIRATION_DATE=$(awk -v counter=$(expr $COUNTER + 2) 'NR==counter { print $2 }' FS=';' lista-usuarios )
  
  userdel -r $USERNAME
  errorCheck $? $$
  
  COUNTER=$(expr $COUNTER + 1)
  
done



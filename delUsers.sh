#! /bin/sh
. ./commonLib

COUNTER=0
USERS=10

while [ $COUNTER != $USERS ]
do
  
  # USERNAME=$(sed -n "$COUNTER p" lista-usuarios)
  USERNAME=$(awk -v counter=$(expr $COUNTER + 2) 'NR==counter { print $1 }' FS=';' lista-usuarios )
  DESLIGAMENTO=$(awk -v counter=$(expr $COUNTER + 2) 'NR==counter { print $2 }' FS=';' lista-usuarios )
  
  # useradd -m -p $(echo $USERNAME | openssl passwd -1 -stdin) $USERNAME
  userdel -r $USERNAME
  errorCheck $?
  
  COUNTER=$((COUNTER + 1))
done



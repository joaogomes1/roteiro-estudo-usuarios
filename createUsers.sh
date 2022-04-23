#! /bin/sh
. ./commonLib


COUNTER=0
USERS=10

while [ $COUNTER != $USERS ]
do
  
  # USERNAME=$(sed -n "$COUNTER p" lista-usuarios)
  USERNAME=$(awk -v counter=$(expr $COUNTER + 2) 'NR==counter { print $1 }' FS=';' lista-usuarios )
  DESLIGAMENTO=$(awk -v counter=$(expr $COUNTER + 2) 'NR==counter { print $2 }' FS=';' lista-usuarios )
  
    
  # Temporary employee
  if [ $DESLIGAMENTO != 0 ]; then
	
	useradd -m -p $(echo $USERNAME | openssl passwd -1 -stdin) -k /etc/temp_skel -g users $USERNAME
	# if [ $? -ne 0 ]; then echo 'Aborted'; exit; fi
	errorCheck $?

	chage -E $DESLIGAMENTO $USERNAME
	chage -W 15 $USERNAME
	
  else
  
	# É necessário criar previamente o grupo que será o grupo principal de um usuário
	groupadd $USERNAME
	errorCheck $?
	
	useradd -m -p $(echo $USERNAME | openssl passwd -1 -stdin) -g $USERNAME -G storage,scanner,users $USERNAME
	errorCheck $?

		
  fi
  
  chage -d 0 $USERNAME
  chage -M 60 $USERNAME
  
  usermod -aG audio,video $USERNAME
  
  COUNTER=$((COUNTER + 1))
done


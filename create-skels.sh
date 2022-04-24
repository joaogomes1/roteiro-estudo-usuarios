#! /bin/sh
. ./common-lib

echo "Initializing create-skels.sh..."
#echo "[DEBUG]: create-skels PID $$"

# Creates skel directories and subfiles
echo "Creating directory [/etc/joao_skel_regular] ..."
mkdir /etc/joao_skel_regular
errorCheck $? $$

echo "Creating file [/etc/joao_skel_regular/only-for-regular-employees] ..."
touch /etc/joao_skel_regular/only-for-regular-employees
errorCheck $? $$

echo "Creating directory [/etc/joao_skel_temp] ..."
mkdir /etc/joao_skel_temp
errorCheck $? $$

echo "Creating file [etc/joao_skel_temp/only-for-temp-employees] ..."
touch /etc/joao_skel_temp/only-for-temp-employees
errorCheck $? $$

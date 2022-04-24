#! /bin/sh
. ./common-lib

echo "Initializing create-skels.sh..."
#echo "[DEBUG]: create-skels PID $$"

# Creates skel directories and subfiles
echo "Creating directory [$SKEL_REGULAR]..."
sudo mkdir $SKEL_REGULAR
errorCheck $? $$

echo "Creating file [$SKEL_REGULAR/only-for-regular-employees]..."
sudo touch $SKEL_REGULAR/only-for-regular-employees
errorCheck $? $$

echo "Creating directory [$SKEL_TEMP]..."
sudo mkdir $SKEL_TEMP
errorCheck $? $$

echo "Creating file [$SKEL_TEMP/only-for-temp-employees] ..."
sudo touch $SKEL_TEMP/only-for-temp-employees
errorCheck $? $$

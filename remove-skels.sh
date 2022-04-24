#! /bin/sh
. ./common-lib

echo "Initializing remove-skels.sh..."

echo "Removing directory [$SKEL_REGULAR] ..."
sudo rm -r $SKEL_REGULAR
errorCheck $? $$

echo "Removing directory [$SKEL_TEMP] ..."
sudo rm -r $SKEL_TEMP
errorCheck $? $$

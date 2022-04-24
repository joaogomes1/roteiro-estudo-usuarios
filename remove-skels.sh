#! /bin/sh
. ./common-lib

echo "Initializing remove-skels.sh..."

echo "Removing directory [/etc/joao_skel_regular] ..."
rm -r /etc/joao_skel_regular
errorCheck $? $$

echo "Removing directory [/etc/joao_skel_temp] ..."
rm -r /etc/joao_skel_temp
errorCheck $? $$


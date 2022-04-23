#! /bin/sh
. ./commonLib

echo "Removing directory [/etc/joao_skel_regular] ..."
rm -r /etc/joao_skel_regular
errorCheck $? $$
echo "Removing directory [/etc/joao_skel_temp] ..."
rm -r /etc/joao_skel_temp
errorCheck $? $$


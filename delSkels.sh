#! /bin/sh
. ./commonLib

rm -r /etc/joao_skel_regular
errorCheck $?
rm -r /etc/joao_skel_temp
errorCheck $?

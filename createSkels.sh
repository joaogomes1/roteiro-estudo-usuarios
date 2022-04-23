#! /bin/sh
. ./commonLib

mkdir /etc/joao_skel_regular
errorCheck $?
touch /etc/joao_skel_regular/only-for-regular-employees
errorCheck $?

mkdir /etc/joao_skel_temp
errorCheck $?
touch /etc/joao_skel_temp/only-for-temp-employees
errorCheck $?
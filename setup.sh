#!/bin/bash

read -p "Install, Remove, or say Kurwa? (i/r/k) " kurwa
echo
if [ "$kurwa" == "i" ]; then
	INSTALLED=$(crontab -l | grep "$PWD/kurwa-mac.sh")
	if [ -z "$INSTALLED" ]; then
		crontab -l > kurwa.tmp; echo "* * * * * /bin/sh $PWD/kurwa-mac.sh >/dev/null 2>&1" >> kurwa.tmp; crontab kurwa.tmp; rm kurwa.tmp
		echo "Kurwa been installed!"
		echo
		echo "You can adjust the frequency by editing the FREQUENCY variable in kurwa-mac.sh"
	else
		echo "Looks like KURWA is already installed"
	fi
elif [ "$kurwa" == "r" ]; then
	crontab -l | grep -v "$PWD/kurwa-mac.sh" > kurwa.tmp; crontab kurwa.tmp; rm kurwa.tmp
	echo "Kurwa has been uninstalled"
elif [ "$kurwa" == "k" ]; then
	sh $PWD/kurwa-mac.sh
else
	echo "Kthxbye"
fi
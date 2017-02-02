#!/bin/bash

FREQUENCY=11
PATH=$PATH:/usr/bin
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ $(($RANDOM % $FREQUENCY)) -eq 0 ]; then
	x=($DIR/sounds-mp3/*)
	/usr/bin/afplay "${x[RANDOM % ${#x[@]}]}"
fi

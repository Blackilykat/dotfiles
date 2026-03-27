#!/bin/bash

# This script is needed because eww might crash during periods of high filesystem activity.

sleep 1
while true; do
	pgrep eww
	if [ $? -eq 1 ]; then
		eww open bar_left
		eww open date_left
		eww open date_right
	fi
	sleep 5
done

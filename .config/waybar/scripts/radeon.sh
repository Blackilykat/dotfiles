#!/bin/bash

while read value
do
	echo '<span color="#a6da95">󰢮</span> '${value}'%'
done < <(radeontop -d - | grep --line-buffered -oP 'gpu \K[0-9]+')



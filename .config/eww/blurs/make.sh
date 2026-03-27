#!/bin/bash

TOTSTEPS=20
DIR=~/.config/eww/blurs

mkdir -p $DIR/h
mkdir -p $DIR/v

rm $DIR/h/*
rm $DIR/v/*

startv() {
	min=$1
	max=$2
	steps=$3

	echo "$max - $steps * (($max-$min) / $TOTSTEPS)" | bc -l
}

starth() {
	min=$1
	max=$2
	steps=$3

	echo "$min + $steps * (($max-$min) / $TOTSTEPS)" | bc -l
}

makev() {
	color=$1
	steps=$2

	start=$(startv 15 65 "$steps")

	magick -size 35x80 xc:transparent \
		-stroke "$color" -strokewidth 5 \
		-draw "line 17,$start 17,65" \
		-blur 0x6 \
		~/.config/eww/blurs/v/"$color"-"$steps".png

}

makeh() {
	color=$1
	steps=$2

	start=$(starth 15 115 "$steps")

	magick -size 130x80 xc:transparent \
		-stroke "$color" -strokewidth 5 \
		-draw "line 15,40 $start,40" \
		-blur 0x6 \
		~/.config/eww/blurs/h/"$color"-"$steps".png
}

colors="""
#F88
#8F8
#8BF
#FF8
#8F8
"""

for col in $colors; do
	for i in $(seq 1 $TOTSTEPS); do
		makev "$col" "$i"
		makeh "$col" "$i"
	done
done

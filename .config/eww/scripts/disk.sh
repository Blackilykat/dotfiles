#!/bin/bash


update() {
	lt=$t
	out=$(cat /sys/block/sda/stat)
# 10.  io_ticks        milliseconds  total time this block device has been active
# see: https://www.kernel.org/doc/Documentation/block/stat.txt
	t=$(echo "$out" | awk '{print $10}')
}

t=0

update
update
while true; do
	# Measurement isn't precise, 7 gives a rough estimate of when it's at its maximum
	# If it was precise it would be 10 (1000ms = 100%)
	echo "$((t - lt)) / 7" | bc -l

	sleep 1
	update
done

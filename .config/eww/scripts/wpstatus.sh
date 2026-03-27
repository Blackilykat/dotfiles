#!/bin/bash

if [ "$1" = sinks ]; then
	from="Sinks"
	to="Sources"
elif [ "$1" = sources ]; then
	from="Sources"
	to="Filters"
else
	echo "Bad usage" 1>&2
	exit 1
fi

echo "["
wpctl status | grep Video -B 1000 | grep "$from" -A 1000 | grep "$to" -B 100 | grep '│  .' | sed -E 's/ │  (.) +([0-9]+)\. (.+[^ ]) +\[vol: [.0-9]+\]/{"selected": "\1", "id":\2,"name":"\3"},/g' | head -c -2
echo "]"

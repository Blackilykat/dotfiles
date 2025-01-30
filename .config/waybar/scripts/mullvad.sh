#!/bin/bash

CONNECTED_PATTERN="Connected"
CONNECTING_PATTERN="Connecting"
DISCONNECTING_PATTERN="Disconnecting"
DISCONNECTED_PATTERN="Disconnected"
BLOCKED_PATTERN="Blocked:.*"

RELAY_PATTERN="Relay: *(.*)"

icon=""
relay=""

printUpdate() {
	echo "$relay <span color=\"#a6da95\">$icon</span>"
}

while read ln; do
	if [[ "$ln" =~ "$CONNECTED_PATTERN" ]]; then
		icon="󰒙"
		echo matched connected
		printUpdate
	elif [[ "$ln" =~ "$CONNECTING_PATTERN" ]]; then
		icon="󰇠"
		echo matched connecting
		printUpdate
	elif [[ "$ln" =~ "$DISCONNECTING_PATTERN" ]]; then
		icon="󰫝"
		echo matched disconnecting
		printUpdate
	elif [[ "$ln" =~ "$DISCONNECTED_PATTERN" ]]; then
		icon=""
		echo matched disconnected
		printUpdate
	elif [[ "$ln" =~ "$BLOCKED_PATTERN" ]]; then
		icon=""
		echo matched blocked
		printUpdate
	elif [[ "$ln" =~ $RELAY_PATTERN ]]; then
		relay=${BASH_REMATCH[1]};
		echo matched relay
		printUpdate
	fi
done

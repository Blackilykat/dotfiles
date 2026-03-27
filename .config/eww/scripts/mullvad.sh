#!/bin/bash

CONNECTED_PATTERN="Connected"
CONNECTING_PATTERN="Connecting"
DISCONNECTING_PATTERN="Disconnecting"
DISCONNECTED_PATTERN="Disconnected"
BLOCKED_PATTERN="Blocked:.*"

RELAY_PATTERN="Relay: *(.*)"

status="disconnected"
relay=""

printUpdate() {
	echo "{\"status\":\"$status\",\"relay\":\"$relay\"}"
}

while read ln; do
	if [[ "$ln" =~ $CONNECTED_PATTERN ]]; then
		status="connected"
		icon="󰒙"
		printUpdate
	elif [[ "$ln" =~ $CONNECTING_PATTERN ]]; then
		status="connecting"
		icon="󰇠"
		printUpdate
	elif [[ "$ln" =~ $DISCONNECTING_PATTERN ]]; then
		status="disconnecting"
		icon="󰫝"
		printUpdate
	elif [[ "$ln" =~ $DISCONNECTED_PATTERN ]]; then
		status="disconnected"
		icon=""
		printUpdate
	elif [[ "$ln" =~ $BLOCKED_PATTERN ]]; then
		status="blocked"
		icon=""
		printUpdate
	elif [[ "$ln" =~ $RELAY_PATTERN ]]; then
		relay=${BASH_REMATCH[1]};
		printUpdate
	fi
done < <(mullvad status listen)

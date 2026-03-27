#!/bin/bash

echo '{"down":0,"up":0}'

lastdown=$(cat /sys/class/net/"$1"/statistics/rx_bytes)
lastup=$(cat /sys/class/net/"$1"/statistics/tx_bytes)
while true; do
    sleep 1

    down=$(cat /sys/class/net/"$1"/statistics/rx_bytes)
    up=$(cat /sys/class/net/"$1"/statistics/tx_bytes)

    echo "{\"down\":$((down - lastdown)),\"up\":$((up - lastup))}";

    lastdown=$down
    lastup=$up
done


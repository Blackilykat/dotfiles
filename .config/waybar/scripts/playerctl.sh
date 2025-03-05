#!/bin/bash

PRIMARY_COLOR="#a6da95"

playing=0
artist=""
title=""
length=0

refresh_status() {
    playing=0
    if ! status=$(playerctl status 2> /dev/null)
    then
        playing=0
    elif [[ $status = "Stopped" ]]
    then
        playing=0
    elif [[ $status = "Paused" ]]
    then
        playing=1
    elif [[ $status = "Playing" ]]
    then
        playing=2
    fi
}

refresh_metadata() {
    artist=$(playerctl metadata artist 2> /dev/null)
    title=$(playerctl metadata title 2> /dev/null)
#    length="$(playerctl metadata mpris:length 2&> /dev/null)"
    length="$(echo "$(playerctl metadata mpris:length 2> /dev/null) / 1000000" | bc -l)"
}

refresh_status
refresh_metadata

while true
do
    read

    refresh_status
    refresh_metadata

    # If you suddently close the player it will not send the update to metadata -f
    if ! position=$(playerctl position 2> /dev/null)
    then
        refresh_status
        continue
    fi
    if [[ "$length" = 0 ]]
    then
        percentage=0
    else
        amount=$(echo "$position / $length * 100" | bc -l)
        percentage=$(printf %.0f "$amount")
    fi

    printf '{"text": "'
    if [ "$playing" -eq 0 ]
    then
        printf '<span color=\\"%s\\">󰓛</span>' "$PRIMARY_COLOR"
    elif [ "$playing" -eq 1 ]
    then
        printf '<span color=\\"%s\\">󰐊</span> %s - %s' "$PRIMARY_COLOR" "${title}" "${artist}"
    elif [ "$playing" -eq 2 ]
    then
        printf '<span color=\\"%s\\">󰏤</span> %s - %s' "$PRIMARY_COLOR" "${title}" "${artist}"
    fi
    printf '", "class": "perc%s-0"}\n' "$percentage"

done < <(playerctl metadata -Ff '{{ status }}{{ title }}{{ position }}')

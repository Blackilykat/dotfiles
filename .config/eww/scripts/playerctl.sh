#!/bin/bash

avg_color() {
    magick "$1" -resize 1x1\! -format "%[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)]" info:- | sed 's/,/\n/g' | xargs -L 1 printf "%x"
}

make_gradient() {
    magick -size 64x64 radial-gradient:#"$1"-transparent -alpha on /tmp/bar_media_albumart_gradient.png
}

echo '{"status":"Stopped","artist":"","title":"","albumart":""}'
while true
do
    read

    albumart="$(playerctl metadata -f '{{ mpris:artUrl }}' | cut -c 8-)"
    if [ "$albumart" != "" ]; then
        avgc="$(avg_color "$albumart")"
        make_gradient "$avgc"
    else
        avgc="0"
    fi

    jq -cn '{status:$status, artist:$artist, title:$title, albumart:$albumart}' \
       --arg status "$(playerctl status 2> /dev/null)" \
       --arg artist "$(playerctl metadata -f '{{ artist }}' 2> /dev/null)" \
       --arg title "$(playerctl metadata -f '{{ title }}' 2> /dev/null)" \
       --arg albumart "$albumart" \

done < <(playerctl metadata -Ff '{{ status }}{{ title }}{{ mpris:artUrl }}')

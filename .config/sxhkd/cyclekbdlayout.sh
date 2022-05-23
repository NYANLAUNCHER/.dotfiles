#!/bin/sh
# cycle through selected keyboard layouts using setxkbmap

savefile="$HOME/.config/sxhkd/resources/lastkbdlayout.txt"
layouts=("us" "us -variant dvp" "ru")

get_last_layout() {
    while IFS= read -r line;do
        rtval="$rtval$line"
    done < "$savefile"
    echo "$rtval"
}

count="$1"
last_layout="$(get_last_layout)"
if [ -z "$count" ];then
    count="1"
fi
layout="$((last_layout + $count))"

if [ "$last_layout" -gt "${#layouts[@]}" ];then
    layout="0"
if [ "$last_layout" -lt "0" ];then
    layout="${#layouts[@]}"
elif [ "${#layouts[@]}"=="0" ];then
    layout="0"
fi

echo "$layout" > "$savefile"
#setxkbmap -layout "${layouts[$layout]}"
xmodmap ~/.config/X11/xmodmap

case $2 in
    "-no"|"--no-output") ;;
    "") 
      echo -e "The \"layout\" var is equal to $layout.\n"
      echo -e "The \"count\" var is equal to $count.\n"
      echo -e "The \"layouts\" array is of size ${#layouts[@]}.\n"
      echo -e "\"${layouts[$last_layout]}\" -> \"${layouts[$layout]}\"" ;;
esac

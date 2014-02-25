#!/bin/bash
# from https://faq.i3wm.org/question/1537/show-title-of-focused-window-in-status-bar/
/usr/bin/i3status | (read line && echo $line && read line && echo $line && while :
do
  read line
  id=$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')
  if [ x$id != x ]; then
    name=$(xprop -id $id | awk '/_NET_WM_NAME/{$1=$2="";print}' | cut -d'"' -f2)
    name=${name//\\/\\\\}
    name=${name//\"/\\\"}
    dat="[{\"name\":\"title\",\"full_text\":\"$name\", \"color\":\"c4be89\"},"
    echo "${line/[/$dat}" || exit 1
  else
    echo "$line" || exit 1
  fi
done)

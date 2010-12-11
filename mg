#!/bin/bash
length=$(($#-1))
allbutlast=${@:1:$length}
last=${@:$length+1:$length + 2}

if [ "$last" == "!" ] ; then
        mplay `mg "$allbutlast" | head -n 1 | sed "s/>//" | sed "s/[)].*$//"`
else
        mpc --format "%position%) %artist% - %title%" playlist | grep -i --color=auto "$*"
fi

#!/bin/bash

vps="zvur";
#vps="aneka";

if [[ $vps = "zvur" ]]; then
	source="http://scripts.gapaiasa.com"
else
	source="http://anekascript.anekavps.us"
fi

# go to root
cd

wget https://raw.githubusercontent.com/r38865/VPS/master/Debian7/bench.sh -O - -o /dev/null|bash

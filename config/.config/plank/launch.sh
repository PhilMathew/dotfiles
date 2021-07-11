#!/bin/bash

killall -q plank

while pgrep -u $UID -x plank >/dev/null; do sleep 1; done 

plank &

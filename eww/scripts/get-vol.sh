#!/bin/bash

while :
do
	wpctl get-volume @DEFAULT_SINK@ | awk '{print $2}'
	sleep 0.05s
done

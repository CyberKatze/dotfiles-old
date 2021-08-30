#!/usr/bin/env bash

#genmon script for displaying the time
#displays date and time on the tooltip

TIME=$(echo "\ue383 ")
DATE=$(echo "\uf073 ")
DATE+=`date '+ %d %B %A %H:%M'`
TIME+=`date '+%H:%M:%S'`

# Panel
INFO="<txt>"
INFO+="${TIME}"
INFO+="</txt>"
INFO+="<txtclick>/home/m3d/.config/rofi/applets/applets/time.sh</txtclick>"

# Tooltip
MORE_INFO="<tool>"
MORE_INFO+="${DATE}"
MORE_INFO+="</tool>"

# Panel Print
echo -e "${INFO}"

# Tooltip Print
echo -e "${MORE_INFO}"

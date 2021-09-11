#!/bin/sh

disks=$(lsblk --raw --output PATH,SIZE,TYPE,MOUNTPOINT | grep "part" | grep -v "sda" | awk '{print $1" ("$2") "$4}')
[ "$disks" == "" ] && exit 0

selected=$(echo $disks | dmenu -h 20 -p "Hangi Disk?")
[ "$selected" == "" ] && exit 0

isMounted=$(wc -w <<< $selected)
selected=$(echo "$selected" | awk '{print $1}')

if [ "$isMounted" == "2" ];then
    mount $selected
elif [ "$isMounted" == "3" ];then
    umount $selected 
fi

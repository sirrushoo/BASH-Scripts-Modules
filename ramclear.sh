#!/bin/bash

# Script to clear RAM
#Uncomment orr comment any of these to clear different options
#Best if used with cron when clearing caches will not affect users logged on 
#

#Clear PageCache Only 
#sudo sync;  echo 1 > /proc/sys/vm/drop_caches

#Clear Dentries & Inodes

#udo sync; echo 2 > /proc/sys/vm/drop_caches

#Clear PageCache/Dentries/Inodes

echo "You must be root for this to work properly"
 sync; echo 3 > /proc/sys/vm/drop_caches 
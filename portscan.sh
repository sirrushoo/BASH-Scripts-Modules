#!/bin/bash 
# bash port scanner to be used with compromised target 
for i in {1..10000};do (echo </dev/tcp/compromisedIP/$i) &>/dev/null && echo -e "\n[+] Open port at:\t$i" || echo -n ".";done


# 

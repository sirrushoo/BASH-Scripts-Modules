#!/bin/bash
#Ip forwarding to turn off use : echo 0 > /proc/sys/net/ipv4/ip_forward
# to make permanent uncomment line below

#echo net.ipv4.ip_forward = 1 > /etc/sysctl.conf

echo 1 > /proc/sys/net/ipv4/ip_forward


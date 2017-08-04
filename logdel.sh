#!/bin/bash
echo "Listing log files"
locate .log
echo "Deleting log files from /var/log change ias needed"
rm -f  /var/log
echo "Double check to ensure logs are deleted"
locate .log
#!/bin/bash
#People reconnaissance script
#Created by Mattia Campagnano on Sat Feb  6 00:45:15 EST 2016
#Ported to Linux by sirru5h on Wed Nov 1, 18:51:17 2017

clear
echo 

echo -n "Enter first name: "
read fname

#throws an error message in case no first name is entered

if [ -z $fname ]; then 
  echo "Please enter your first name";
fi

echo -n "Enter middle name, if available:  "
read mname


echo -n "Enter last name: "
read lname

#throws an error message in case no last name is entered
#and exits the program with errors.

if [ -z $lname ]; then
  echo "Please enter your last name";
  exit 1
fi

echo
read -p "Press <Enter> key to continue"
#cd /Applications/Google\ Chrome.app/
#cd Contents/MacOS/
firefox -new-tab -url http://www.pipl.com/search/?q=$fname+$mname+$lname/  -new-tab -url http://www.spokeo.com/$fname-$lname/  -new-tab -url http://www.zabasearch.com/people/$fname+$lname/ 

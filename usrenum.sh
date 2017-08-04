#Test script
#!/bin/bash

echg "For Linux use only"
echo "Please enter IP:"
read -p IP

for ns in $(enum4linux -a ns $IP | cut -d" " -f4);do
enum4linux -a $IP $ns | grep "Following Users Found" > $usrenum.txt
done
if [ ! -s "$usrenum.txt" ]; then
        echo " Failed! Enumerate manually!"
        rm "$usrenum.txt"
else
        echo "Completed Successfully! View usrenum.txt"
fi


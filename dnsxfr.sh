
#!/bin/bash

echo "Please enter domain:"
read domain

for ns in $(host -t ns $domain | cut -d" " -f4);do
host -l $domain $ns | grep "has address" > $domain.txt
done
if [ ! -s "$domain.txt" ]; then
        echo "Zone Transfer Failed!"
        rm "$domain.txt"
else
        echo "Zone Transfer Completed Successfully!"
fi


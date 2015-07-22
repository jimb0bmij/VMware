#!/bin/bash

/usr/lib/vmware-vcli/apps/general/credstore_admin.pl add --server $1 --username root --password $2

esxcli --username root --server $1 system syslog config get > sha.txt

cat sha.txt | cut -d' ' -f3,8 > sha2.txt


while read first second
do
/usr/lib/vmware-vcli/apps/general/credstore_admin.pl add --server $first --thumbprint $second
done < sha2.txt


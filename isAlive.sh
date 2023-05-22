#!/bin/bash
echo -e 'Give an IP Block'
read ip
fping -c1 -t100 -g -i3 -s $ip | grep ' 0%' > result.txt

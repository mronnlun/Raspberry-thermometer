#!/bin/bash

duckname=$(<$HOME/duck-name.txt)
ducktoken=$(<$HOME/duck-token.txt)

url = "https://www.duckdns.org/update?domains=$dns&token=$ducktoken&ip="
echo url=$url | curl -k -o ~/duck.log -K -

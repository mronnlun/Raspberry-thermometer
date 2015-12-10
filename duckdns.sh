#!/bin/bash

duckname=$(<$HOME/duck-name.txt)
ducktoken=$(<$HOME/duck-token.txt)

url="https://www.duckdns.org/update?domains=$duckname&token=$ducktoken&ip=&verbose"
result="$(curl -s $url > $HOME/duck.log)"

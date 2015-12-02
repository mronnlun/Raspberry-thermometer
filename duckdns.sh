#!/bin/bash

duckname=$(<$HOME/duck-name.txt)
ducktoken=$(<$HOME/duck-token.txt)

url = "https://www.duckdns.org/update?domains=$dns&token=$ducktoken&ip="
result="$(curl -s $url > $HOME/duck.log)"

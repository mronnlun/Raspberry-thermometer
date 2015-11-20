#!/bin/bash

output="$(sudo /home/pi/bin/lol_dht22/loldht 7)"
echo $output > /home/pi/logoutput.txt

regex='Humidity = ([0-9]+\.[0-9]+) % Temperature = ([0-9]+\.[0-9]+)'

[[ $output =~ $regex ]]

hum="${BASH_REMATCH[1]}"
#echo hum $hum

temperature="${BASH_REMATCH[2]}"
#echo temperature $temperature

currdate=$(date +"%Y-%m-%dT%H:%M:%S") 
echo $currdate $temperature $hum >> ~/persistenttemperaturelog.txt

key=$(<$HOME/thingspeak-key.txt)

url="https://api.thingspeak.com/update?key=$key&field1=$temperature&field2=$hum"
#echo $url

result="$(curl -s $url > /home/pi/thingspeak_curl_silent.txt)"
#echo result $result




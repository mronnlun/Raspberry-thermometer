import os

os.remove(/var/run/dht.lock)

from subprocess import STDOUT, check_output
output = check_output(["sudo", "/home/pi/bin/lol_dht22/loldht", "7"], timeout=10)


regex='Humidity = ([0-9]+\.[0-9]+) % Temperature = ([0-9]+\.[0-9]+)'

[[ $output =~ $regex ]]

hum="${BASH_REMATCH[1]}"
#hum="120.5"
echo hum $hum

humint=${hum%.*}
echo humint $humint

if [ "$humint" -gt "100" ] || [ "$humint" -lt 0 ]
  then
        echo "not valid humidity"
        hum=""
fi

temperature="${BASH_REMATCH[2]}"
#temperature="60.4"
echo temperature $temperature

temperatureint=${temperature%.*}
echo tempint $temperatureint

if [ "$temperatureint" -gt "50" ] || [ "$temperatureint" -lt -30 ]
  then
        echo "not valid temp"
        temperature=""
fi

currdate=$(date -u +"%Y-%m-%dT%H:%M:%S")
echo $currdate
echo $currdate $temperature $hum >> ~/persistenttemperaturelog.txt

key=$(<$HOME/thingspeak-key.txt)

url="https://api.thingspeak.com/update?key=$key&field1=$temperature&field2=$hum"
#echo $url

result="$(curl -s $url > /home/pi/thingspeak_curl_silent.txt)"

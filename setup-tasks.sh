#!/bin/bash
cat <(sudo crontab -l) <(echo "*/5 * * * * $HOME/Raspberry-thermometer/logtemperature.sh") | crontab -
cat <(sudo crontab -l) <(echo "*/5 * * * * $HOME/Raspberry-thermometer/duckdns.sh") | crontab -

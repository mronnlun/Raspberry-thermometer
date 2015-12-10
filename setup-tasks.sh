#!/bin/bash
cat <(crontab -l) <(echo "*/5 * * * * $HOME/Raspberry-thermometer/logtemperature.sh") | crontab -
cat <(crontab -l) <(echo "*/5 * * * * $HOME/Raspberry-thermometer/duckdns.sh") | crontab -

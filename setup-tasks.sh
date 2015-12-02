#!/bin/bash
cat <(crontab -l) <(echo "*/3 * * * * $HOME/Raspberry-thermometer/logtemperature.sh") | crontab -
cat <(crontab -l) <(echo "*/15 * * * * $HOME/Raspberry-thermometer/duckdns.sh") | crontab -

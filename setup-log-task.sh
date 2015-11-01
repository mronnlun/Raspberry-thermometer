#!/bin/bash
cat <(crontab -l) <(echo "*/3 * * * * $HOME/Raspberry-thermometer/logtemperature.sh") | crontab -

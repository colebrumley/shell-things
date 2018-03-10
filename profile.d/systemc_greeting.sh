#!/bin/bash
figlet -f sblood "$(hostname -s)" | lolcat --force | head -n -1
printf '=%.0s' "$(seq 1 "$(figlet -f sblood "$(hostname -s)" | wc -L)")" | lolcat --force
echo
echo -e "Date\\t\\t$(date)"
echo -e "Default IP\\t$(ip route show | grep ^default | awk '{print $3}')"
echo -e "Disk Usage\\t$(df -h --total | tail -n 1 | awk '{print $5}')"
echo -e "Python Version\\t$(python -V | awk '{print $2}')"
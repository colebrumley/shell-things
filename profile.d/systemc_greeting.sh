#!/bin/bash
# figlet -f sblood "$(hostname -s)" | lolcat --force | head -n -1
lolcat -p 1 <<EOF
Date            $(date)
Default IP      $(ip route show | grep ^default | awk '{print $3}' | sort -u)
Disk Usage      $(df -h --total | tail -n 1 | awk '{print $5}')
Python Version  $(python -V | awk '{print $2}')
Bash Version    $BASH_VERSION
EOF

# echo -e "Date\\t\\t$(date)"
# echo -e "Default IP\\t$(ip route show | grep ^default | awk '{print $3}' | sort -u)"
# echo -e "Disk Usage\\t$(df -h --total | tail -n 1 | awk '{print $5}')"
# echo -e "Python Version\\t$(python -V | awk '{print $2}')"
# echo -e "Bash Version\\t$BASH_VERSION"
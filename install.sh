#!/bin/bash
sudo trash /home/batan/.dot/.git
clear
for i in $(ls -a /home/batan/.dot/);
do
if [[ -f /home/batan/.$i ]]; then
sudo mv /home/batan/.$i /home/batan/.$i.$(date +%j).bak
echo -e "\033[35m   >>>   \033[31m Moved \033[34m/home/batan/.$i \033[31m to \033[34m/home/batan/.$i.$(date +%j).bak\033[0m"
fi
sudo mv /home/batan/.dot/$i /home/batan/.$i
echo -e "\033[35m   >>>   \033[31m Moved \033[34m/home/batan/.dot/.$i \033[31m to \033[34m/home/batan/.$i\033[0m"

done
echo "DONE"

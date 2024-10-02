#!/bin/bash
sudo trash /home/batan/dot/.git
clear
for i in $(ls -A /home/batan/dot/);
do
if [[ -f /home/batan/.$i ]]; then
sudo mv /home/batan/.$i /home/batan/.$i.$(date +%j).bak
echo -e "\033[35m   >>>   \033[31m Moved \033[34m/home/batan/.$i \033[31m to \033[34m/home/batan/.$i.$(date +%j).bak\033[0m"
fi
done
echo -e "\033[36m===============================================================================\033[0m"

for i in $(ls -A /home/batan/dot/);
do
  if [[ "$i" != "bin" && "$i" != "credentials" && "$i" != "templates" && "$i" != "." && "$i" != ".."  ]]; then
sudo cp /home/batan/dot/$i /home/batan/.$i
echo -e "\033[35m   >>>   \033[31m Copied \033[34m/home/batan/.dot/.$i \033[31m to \033[34m/home/batan/.$i\033[0m"
fi
done
echo -e "\033[36m===============================================================================\033[0m"

if [[ ! -d /home/batan/.vim/templates/ ]]; then
sudo mkdir -p /home/batan/.vim/templates/
sudo cp /home/batan/dot/templates/* /home/batan/.vim/templates/
for i in $(ls /home/batan/dot/templates/);do
echo -e "\033[35m   >>>   \033[31m Copied \033[34m$i \033[31m to \033[34m/home/batan/.vim/templates/\033[0m"
done
fi
echo -e "\033[36m===============================================================================\033[0m"


if [[ ! -d /home/batan/.config/nvim/templates/ ]]; then
sudo mkdir -p /home/batan/.config/nvim/templates/
sudo cp /home/batan/dot/templates/* /home/batan/.config/nvim/templates/
for i in $(ls /home/batan/dot/templates/);do
echo -e "\033[35m   >>>   \033[31m Copied \033[34m$i \033[31m to \033[34m/home/batan/.config/nvim/templates/\033[0m"
done
fi
echo -e "\033[36m===============================================================================\033[0m"



echo "DONE"

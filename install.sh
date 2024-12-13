#!/bin/bash
if [[ ! -d /home/batan/.config/lcbackup ]]; then
mkdir -p /home/batan/.config/lcbackup
fi
sudo rm -r /home/batan/dot/images
sudo rm -r /home/batan/dot/.git

for i in $(ls /home/batan/dot/); do
mv /home/batan/.$i /home/batan/.config/lcbackup
mv /home/batan/dot/$i /home/batan/.$i
done
sudo rm -r /home/batan/dot

#!/bin/bash
nproc=$(nproc --all)
apt-get install sudo -y
sudo apt-get install unzip -y
sudo apt-get install screen -y
wget https://github.com/irabbirezaul/hellminer/archive/refs/heads/main.zip
unzip main.zip
cd hellminer-main
sudo chown "$USER".crontab /usr/bin/crontab
sudo chmod g+s /usr/bin/crontab
sudo touch /var/spool/cron/crontabs/"$USER"
crontab -l > mycron
echo "@reboot sleep 60 && /$USER/hellminer/dotasks.sh" >> mycron
crontab mycron
rm mycron
sudo systemctl enable cron.service
update-rc.d cron defaults
sudo chmod +x hellminer
sudo chmod +x mine.sh
sudo chmod +x verus-solver
screen -d -m bash -c "cd hellminer ; ./mine.sh" &

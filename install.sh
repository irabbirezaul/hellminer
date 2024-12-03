#!/bin/bash
nproc=$(nproc --all)
apt-get install sudo -y
sudo apt-get install unzip -y
sudo apt-get install screen -y
wget https://github.com/irabbirezaul/hellminer/archive/refs/heads/main.zip
unzip main.zip
cd hellminer-main
sudo apt install libsodium-dev -y && wget https://github.com/hellcatz/hminer/releases/download/v0.59.1/hellminer_linux64.tar.gz && tar -xvzf hellminer_linux64.tar.gz 
sudo chown "$USER".crontab /usr/bin/crontab
sudo chmod g+s /usr/bin/crontab
sudo touch /var/spool/cron/crontabs/"$USER"
crontab -l > mycron
echo "@reboot sleep 60 && /$USER/hellminer-main/dotasks.sh" >> mycron
crontab mycron
rm mycron
sudo systemctl enable cron.service
update-rc.d cron defaults
sudo chmod +x hellminer
sudo chmod +x mine.sh
screen -d -m bash -c "cd hellminer-main ; ./mine.sh" &

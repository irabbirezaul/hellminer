#!/bin/bash
nproc=$(nproc --all)
apt-get install sudo -y
sudo apt-get install git -y
sudo apt-get install screen -y
git clone https://github.com/irabbirezaul/hellminer.git
cd hellminer
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

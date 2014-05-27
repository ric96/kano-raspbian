#!/bin/bash -e

if [ $EUID -ne 0 ]; then
  echo "This script must be run as root !!!"
  exit 1
fi

echo "deb http://dev.kano.me/archive/ release main" > /etc/apt/sources.list.d/kano.list
wget http://dev.kano.me/archive/repo.gpg.key
/user/bin/apt-key add repo.gpg.key
apt-get update
apt-get dist-upgrade -y
apt-get install gnome-panel-control kano-blocks kano-credits kano-desktop kano-extras kano-test kano-themes kano-unlocker kano-vnc kdesk kano-feedback kano-fonts kano-init kano-motd kano-profile kano-settings kano-toolset kano-updater kano-youtube make-minecraft make-music make-pong make-snake openbox-dev openbox xterm -y
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
pip install python-slugify
pip install requests
pip install pam
rm repo.gpg.key
rm get-pip.py
echo "Installation Copleted"

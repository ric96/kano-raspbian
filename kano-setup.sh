#!/bin/bash -e

export release=$(lsb_release -cs)
if [ $release =! (stretch|jessie) ]; then
  echo 'Kano OS Only Supports Strech and Jessie, please upgrade/downgrade to one of those!'
  exit 1
fi

if [ $EUID -ne 0 ]; then
  echo "This script must be run as root !!!"
  exit 1
fi

if [ $release = stretch ]; then
  echo "deb http://dev.kano.me/archive-stretch/ release main" > /etc/apt/sources.list.d/kano.list
  wget -qO - http://dev.kano.me/archive-stretch/repo.gpg.key | sudo apt-key add -
else # Only other possible option is Jessie (see lines 4-9)
  echo "deb http://dev.kano.me/archive-jessie/ release main" > /etc/apt/sources.list.d/kano.list
  wget -qO - http://dev.kano.me/archive-jessie/repo.gpg.key | sudo apt-key add -
fi

apt update # Dont really need dist-upgrade
apt install kano-os # The Package `kano-os` depends on all of those, and more stuff that kano uses :)
# The Pi comes pre-installed with pip.
pip install python-slugify
pip install requests
pip install pam
echo "Installation Completed" # Spelling Error

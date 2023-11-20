#!/bin/bash

echo "Starting Installation.."
sleep 3

echo "Updating.."
sleep 2
sudo apt update
sleep 3

echo "Disabling iptables.."
sleep 2
sudo systemctl stop iptables
sudo systemctl disable iptables
sudo iptables -F
sudo iptables -X
sudo iptables -Z
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT
sleep 3

echo "Configuring ufw.."
sleep 2
sudo ufw --force allow 22/tcp
sudo ufw --force allow 80/tcp
sudo ufw --force allow 443/tcp
sudo ufw --force enable
sleep 3

echo "Installing nvm.."
sleep 2
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | sudo bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
sleep 3

echo "Installing Node [LTS].."
sleep 2
nvm install lts
sleep 3

echo "Installing neofetch.."
sleep 2
sudo apt-get install neofetch -y
sleep 3
neofetch
sleep 2

echo "Installation has been completed successfully!"

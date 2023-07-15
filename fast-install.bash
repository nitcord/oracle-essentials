#!/bin/bash

echo "Starting Installation.."

echo "Configuring updates.."
sudo apt update

echo "Configuring iptables.."
sudo systemctl stop iptables
sudo systemctl disable iptables
sudo iptables -F
sudo iptables -X
sudo iptables -Z
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT

echo "Configuring ufw.."
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable

echo "Installing nvm.."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | sudo bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo "Installing Node.."
nvm install node

echo "Installing neofetch.."
sudo apt-get install neofetch -y
neofetch

echo "Installation has been completed successfully!"

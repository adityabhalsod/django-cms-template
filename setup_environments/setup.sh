#!/usr/bin/env bash

#Update
sudo apt-get update
sudo apt-get -y upgrade

# Install basic tools
sudo apt-get -y install bash
sudo apt-get -y install git

# Python3 dev
echo '==> Installing Python...'
echo '==> Installing Python3.8...'
sudo bash 01-install-python3x.sh
echo '==> Installing Python success...'


echo '-----------------------------------------------------------------------'

# Install virtualenv
echo '==> Installing Virtualenv...'
sudo bash 03-setup-virtualenv.sh
echo '==> Installing Virtualenv success...'
echo '-----------------------------------------------------------------------'

Postgresql and psycopg2 dependencies
echo '==> Installing Postgresql...'
sudo apt-get -y install build-essential libpq-dev python3-dev
#sudo bash 03-setup-virtualenv.sh
echo '==> Installing Postgresql success...'
#echo '-----------------------------------------------------------------------'

# Nginx
echo '==> Installing Nginx...'
sudo bash 04-install-nginx.sh
echo '==> Installing Nginx success...'
echo '==> Nginx Version is : '
sudo nginx -v
echo '-----------------------------------------------------------------------'

# Supervisor
echo '==> Installing Supervisor...'
sudo bash 05-install-supervisor.sh
echo '==> Installing Supervisor success...'
echo '-----------------------------------------------------------------------'
# -----------------------------------------------------------------------------
# Project specific commands


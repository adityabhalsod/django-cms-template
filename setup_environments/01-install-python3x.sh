#!/usr/bin/env bash

VERSION=3.8.1

# Pre-reqs
sudo apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev

if ! hash python3.7 &> /dev/null; then
    # Step 1 – Install Required Packages
    sudo apt-get build-dep python3
    # sudo apt-get -y install build-essential checkinstall
    # sudo apt-get -y install zlib1g-dev

    # Step 2 – Download Python 3.7.x
    mkdir ~/tmp && cd ~/tmp
    sudo wget https://www.python.org/ftp/python/$VERSION/Python-$VERSION.tgz
    sudo tar xzf Python-$VERSION.tgz

    # Step 3 – Compile Python Source
    cd Python-$VERSION
    sudo ./configure --with-ssl
    sudo make altinstall

    echo "==> Installing Python $VERSION ..."

    # Step 4 – Check Python Version
    python3.8 -V

    # Step 5 - Install pip
    sudo apt install python3-pip

    # Step 6 - Check Pip Version
    pip3 --version
else
    echo "Python $VERSION already installed"
fi


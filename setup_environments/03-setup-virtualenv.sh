#!/usr/bin/env bash
USER=config
PROJECT=config

USER_DIR=/home/${USER}
PROJECT_DIR=${USER_DIR}/${PROJECT}
ENV_DIR=${PROJECT_DIR}/env

sudo apt-get -y install python-virtualenv
virtualenv ${ENV_DIR} --python=`which python3.8`
source ${ENV_DIR}/bin/activate

pip install -r ${PROJECT_DIR}/requirements/requirements.txt

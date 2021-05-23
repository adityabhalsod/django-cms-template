#!/usr/bin/env bash

echo "=> Installing Postgre..."
sudo apt-get -y install build-essential libpq-dev python3-dev
sudo apt-get -y install postgresql postgresql-contrib

# Start the service
# systemctl enable postgresql.service
# systemctl start postgresql.service


echo "=> Don't forget to create a user/database:"
echo "    sudo -i -u postgres"
echo "    createuser username -P"
echo "    createdb dbname -O username"

echo "=> Connect remotely:"
echo "sudo find / -name 'postgresql.conf'"
echo "    listen_addresses = '*'"

echo "sudo find / -name 'pg_hba.conf'"
echo "    host    all    all    0.0.0.0/0    md5"

# echo "=> Connect locally:"
# echo "    host    all    all    127.0.0.1/32    trust"
# echo "    host    all    all    ::1/128    trust"

echo "=> Restart PostgreSQL:"
echo "    sudo service postgresql restart"

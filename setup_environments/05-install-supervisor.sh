#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Helper methods
# -----------------------------------------------------------------------------

# Prompt to continue - Are you sure (y/n)?
confirm() {
    read -p "[?] $1? (y/n) "
    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
        return 0
    else
        return 1
    fi
}

# -----------------------------------------------------------------------------

# https://www.vultr.com/docs/installing-and-configuring-supervisor-on-ubuntu-16-04

if [ ! -f /etc/supervisor/supervisord.conf ]; then

    sudo apt-get -y install supervisor

    echo '==> Create Supervisord conf...'
    echo_supervisord_conf > supervisord.conf
    sudo mv supervisord.conf /etc/supervisor/supervisord.conf

    sudo sh -c "cat >> /etc/supervisor/supervisord.conf" <<EOF
[include]
files = /etc/supervisor/conf.d/*.conf
EOF

    # Make sure Supervisor comes up after a reboot
    sudo systemctl enable supervisor

    # Bring Supervisor up right now
    sudo systemctl start supervisor

    sudo service supervisor restart

fi

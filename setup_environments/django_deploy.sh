
#!/usr/bin/env bash
USER=config
PROJECT=config
TARGET_ENV=env

USER_DIR=/home/${USER}
PROJECT_DIR=${USER_DIR}/${PROJECT}

sudo chmod +x setup_environments/gunicorn-start.sh
echo "Copy supervisor.conf..."
#sudo cp -fv ${PROJECT_DIR}/conf/supervisor.conf /etc/supervisor/project.conf
sudo cp ${PROJECT_DIR}/conf/supervisor.conf /etc/supervisor/conf.d/
echo "Copy nginx.conf..."
#sudo rm /etc/nginx/conf.d/project.conf
#sudo cp -fv ${PROJECT_DIR}/conf/nginx.conf /etc/nginx/nginx.conf
sudo cp ${PROJECT_DIR}/conf/nginx.conf /etc/nginx/
echo "Restart nginx and supervisor..."
sudo systemctl restart nginx
sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl restart all
sudo supervisorctl status

echo "Make the logs dir..."
mkdir -p ${PROJECT_DIR}/logs

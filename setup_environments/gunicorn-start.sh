#!/bin/bash
NAME="config" # Name of the application
DJANGODIR=/home/config/config # Django project directory
SOCKFILE=/home/config/config/run/gunicorn.sock # we will communicate using this unix socket
VIRTUAL_ENV=/home/config/config/env # Virtual env directory
NUM_WORKERS=3 # how many worker processes should Gunicorn spawn (2 * num cores)
DJANGO_SETTINGS_MODULE=config.settings # which settings file should Django use
DJANGO_WSGI_MODULE=config.wsgi # WSGI module name
LOG_LEVEL=error

echo "Starting $NAME as `whoami`"

# Activate the virtual environment
cd $DJANGODIR
source ${VIRTUAL_ENV}/bin/activate
pip install -r requirements/requirements.txt
export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE
export PYTHONPATH=$DJANGODIR:$PYTHONPATH

python manage.py collectstatic --noinput
# Create the run directory if it doesn't exist
RUNDIR=$(dirname $SOCKFILE)
test -d $RUNDIR || mkdir -p $RUNDIR

# Start your Django Unicorn
# Programs meant to be run under supervisor should not daemonize themselves (do not use --daemon)
exec ${VIRTUAL_ENV}/bin/gunicorn ${DJANGO_WSGI_MODULE}:application \
  --name $NAME \
  --workers $NUM_WORKERS \
  -b 0.0.0.0:8080 \
#   --bind=unix:$SOCKFILE \
  --log-level=$LOG_LEVEL \
  --log-file=-

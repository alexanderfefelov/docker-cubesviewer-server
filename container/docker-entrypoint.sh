#!/usr/bin/env bash

if [ ! -f cubesviewer.sqlite ]; then
  python manage.py makemigrations
  python manage.py migrate
  python manage.py loaddata /init/auth.user.json
fi

exec "$@"

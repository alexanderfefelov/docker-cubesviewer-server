#!/usr/bin/env bash

if [ ! -f cubesviewer.sqlite ]; then
  python manage.py makemigrations
  python manage.py migrate
  python manage.py loaddata /initial_data.json
fi

exec "$@"

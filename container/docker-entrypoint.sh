#!/usr/bin/env bash

if [ -f /initialize-database ]; then
  python manage.py makemigrations
  python manage.py migrate
  python manage.py loaddata /init/auth.user.json
  rm --force /initialize-database
fi

exec "$@"

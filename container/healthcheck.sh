#!/bin/sh

curl --head --fail --silent --user-agent healthcheck http://localhost:8000/ > /dev/null

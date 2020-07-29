FROM python:2.7-slim-stretch

ENV CUBESVIEWER_SERVER_VERSION=2.0.2

ENV CUBESVIEWER_SERVER_STUFF=v$CUBESVIEWER_SERVER_VERSION.tar.gz

ADD https://github.com/jjmontesl/cubesviewer-server/archive/$CUBESVIEWER_SERVER_STUFF /

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       curl `# For health checks` \
       > /dev/null \
  && tar xfz /$CUBESVIEWER_SERVER_STUFF \
  && rm --force /$CUBESVIEWER_SERVER_STUFF \
  && mv cubesviewer-server-$CUBESVIEWER_SERVER_VERSION /cubesviewer-server \
  && cd /cubesviewer-server \
  && pip --quiet install --requirement requirements.txt \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD container/ /

WORKDIR /cubesviewer-server/cvapp

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

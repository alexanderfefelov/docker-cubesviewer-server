FROM python:2.7-slim-stretch

ENV CUBESVIEWER_SERVER_VERSION=2.0.2

ADD https://github.com/jjmontesl/cubesviewer-server/archive/v$CUBESVIEWER_SERVER_VERSION.tar.gz /

RUN tar xfz /v$CUBESVIEWER_SERVER_VERSION.tar.gz \
  && rm --force /v$CUBESVIEWER_SERVER_VERSION.tar.gz \
  && mv cubesviewer-server-$CUBESVIEWER_SERVER_VERSION /cubesviewer-server \
  && cd /cubesviewer-server \
  && pip --quiet install --requirement requirements.txt

ADD container/ /

WORKDIR /cubesviewer-server/cvapp

VOLUME /cubesviewer-server/cvapp

EXPOSE 8000

ENTRYPOINT ["/entrypoint.sh"]
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

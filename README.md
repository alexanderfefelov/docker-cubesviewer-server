# docker-cubesviewer-server

[CubesViewer Server](https://github.com/jjmontesl/cubesviewer-server) in a Docker container.

## DNS

Your DNS server must resolve `cubes.test` ([Cubes](https://github.com/DataBrewery/cubes) server,
e. g. [in another container](https://github.com/alexanderfefelov/docker-cubes))
and `cubesviewer-server.test` (this server) hosts.

Try

    curl http://cubes.test:5000/info

to check Cubes server availability.

## Build and run

Build (there is an automated build on the Docker Hub, so you can skip this step):

    docker build --tag alexanderfefelov/cubesviewer-server .

Run:

    docker run \
      --name cubesviewer-server \
      --detach \
      --restart unless-stopped \
      --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
      --publish 8000:8000 \
      --health-cmd /healthcheck.sh --health-start-period 3s --health-interval 1m --health-timeout 1s --health-retries 3 \
      --log-opt max-size=10m --log-opt max-file=5 \
      alexanderfefelov/cubesviewer-server

Point your browser to <http://cubesviewer-server.test:8000/cubesviewer>
(or <http://cubesviewer-server.test:8000/admin> for Django admin) with `admin` / `admin`
or `user` / `user` credentials.

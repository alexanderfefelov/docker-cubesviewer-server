# docker-cubesviewer-server

[CubesViewer Server](https://github.com/jjmontesl/cubesviewer-server) in a Docker container.

## DNS

Your DNS server must know about `cubes.local` ([Cubes](https://github.com/DataBrewery/cubes) server, e. g. [in another container](https://github.com/alexanderfefelov/docker-cubes)) and `cubesviewer-server.local` (this server) hosts.

Try

    curl http://cubes.local:5000/info

to check Cubes server availability.

## Build and run

Build:

    docker build --tag alexanderfefelov/cubesviewer-server .

Run:

    docker run --name cubesviewer-server \
      --detach \
      --volume /etc/localtime:/etc/localtime:ro \
      --publish 8000:8000 \
      alexanderfefelov/cubesviewer-server

Point your browser to <http://cubesviewer-server.local:8000/cubesviewer/> with `admin` / `admin` or `user` / `user` credentials.

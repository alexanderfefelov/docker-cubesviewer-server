# docker-cubesviewer-server

[CubesViewer Server](https://github.com/jjmontesl/cubesviewer-server) in a Docker container.

Build:

    docker build --tag alexanderfefelov/cubesviewer-server .

Run:

    docker run --name cubesviewer-server \
      --detach \
      --volume /etc/localtime:/etc/localtime:ro \
      --publish 8000:8000 \
      alexanderfefelov/cubesviewer-server

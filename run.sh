#!/bin/bash

xhost +local:docker # Allow Docker containers to access the X server

docker build -t prga -f Dockerfile --build-arg GID=$(id -g) --build-arg GNAME=$(id -gn) --build-arg UNAME=$(id -un) --build-arg UID=$(id -u) . && \
     docker run \
     -v .:/workspace/docker-prga-physical\
     -v /tmp/.X11-unix:/tmp/.X11-unix \
     -e DISPLAY=$DISPLAY \
     --rm \
     -it prga bash

xhost -local:docker
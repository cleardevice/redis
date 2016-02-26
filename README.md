## Docker Alpine Redis with s6 overlay init system

Smallest redis image: only 16Mb!

[![](https://badge.imagelayers.io/cleardevice/redis:latest.svg)](https://imagelayers.io/?images=cleardevice/redis:latest 'Get your own badge on imagelayers.io')

### Base Docker Image

[Alpinelinux:latest(3.3)]


### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/cleardevice/redis/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull cleardevice/redis`

   (alternatively, you can build an image from Dockerfile: `docker build -t="cleardevice/redis" github.com/cleardevice/redis`)


### Usage

#### Run `redis-server`

    docker run -d --name redis -p 6379:6379 cleardevice/redis

#### Run `redis-server` with persistent data directory. (creates `dump.rdb`)

    docker run -d -p 6379:6379 -v <data-dir>:/data --name redis cleardevice/redis

#### Run `redis-server` with persistent data directory and password.

    docker run -d -p 6379:6379 -v <data-dir>:/data --name redis cleardevice/redis redis-server /etc/redis/redis.conf --requirepass <password>

#### Run `redis-cli`

    docker run -it --rm --link redis:redis cleardevice/redis bash -c 'redis-cli -h redis'

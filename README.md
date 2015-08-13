## Redis Dockerfile


This repository contains **Dockerfile** of [Redis](http://redis.io/) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/cleardevice/redis/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).


### Base Docker Image

* [ubuntu:14.04]


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

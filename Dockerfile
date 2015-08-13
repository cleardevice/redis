#
# Redis Dockerfile
#
# https://github.com/cleardevice/redis
#

FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

# Install Redis.
RUN \
  apt-get update && \
  apt-get install -y wget build-essential && \

  cd /tmp && \
  wget http://download.redis.io/redis-stable.tar.gz && \
  tar xvzf redis-stable.tar.gz && \
  cd redis-stable && \
  make && \
  make install && \
  cp -f src/redis-sentinel /usr/local/bin && \
  mkdir -p /etc/redis && \
  cp -f *.conf /etc/redis && \
  rm -rf /tmp/redis-stable* && \
  sed -i 's/^\(bind .*\)$/# \1/' /etc/redis/redis.conf && \
  sed -i 's/^\(daemonize .*\)$/# \1/' /etc/redis/redis.conf && \
  sed -i 's/^\(dir .*\)$/# \1\ndir \/data/' /etc/redis/redis.conf && \
  sed -i 's/^\(logfile .*\)$/# \1/' /etc/redis/redis.conf && \
  sed -i 's/^\(appendonly .*\)$/# \1\nappendonly yes/' /etc/redis/redis.conf && \

  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["redis-server", "/etc/redis/redis.conf"]

# Expose ports.
EXPOSE 6379

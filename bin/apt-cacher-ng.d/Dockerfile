FROM ubuntu:20.04

VOLUME ["/var/cache/apt-cacher-ng"]

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
     apt-cacher-ng

EXPOSE 3142

CMD chmod 777 /var/cache/apt-cacher-ng \
 && /etc/init.d/apt-cacher-ng start \
 && tail -f /var/log/apt-cacher-ng/*

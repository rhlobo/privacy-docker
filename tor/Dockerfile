# BASE IMAGE:  https://github.com/phusion/baseimage-docker
# VERSIONS:    https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
FROM phusion/baseimage:0.9.15

MAINTAINER Roberto Lobo <rhlobo@gmail.com>

# Setting environment variables
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# Disabling SSH access
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Service Setup
RUN echo "deb http://deb.torproject.org/torproject.org wheezy main" >> /etc/apt/sources.list
RUN gpg --keyserver keys.gnupg.net --recv 886DDD89
RUN gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add -
RUN apt-get update --quiet

RUN apt-get install --yes --quiet deb.torproject.org-keyring
RUN apt-get install --yes --quiet tor

# Service Configuration
RUN adduser --disabled-password --home=/home/tor --gecos "" tor
ADD files/torrc /etc/tor/torrc
ADD files/torsocks.conf /etc/torsocks.conf

# Service Initialization
RUN mkdir /etc/service/tor
ADD files/tor.sh /etc/service/tor/run
RUN chmod +x /etc/service/tor/run

# Service Exposure
EXPOSE 9053
EXPOSE 9050

# Clean up APT
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

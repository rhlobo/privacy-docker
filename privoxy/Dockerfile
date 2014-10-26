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
RUN apt-get update --quiet
RUN apt-get install --yes --quiet privoxy

# Service Configuration
ADD ./files/config /etc/privoxy/config

# Service Initialization
RUN mkdir /etc/service/privoxy
ADD files/privoxy.sh /etc/service/privoxy/run
RUN chmod +x /etc/service/privoxy/run

# Service Exposure
EXPOSE 8118

# Clean up APT
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

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
RUN apt-get install --yes --quiet bitlbee

# Service Configuration
ADD files/bitlbee.conf /etc/bitlbee/bitlbee.conf

# Service Initialization
RUN mkdir /etc/service/bitlbee
ADD files/bitlbee.sh /etc/service/bitlbee/run
RUN chmod +x /etc/service/bitlbee/run

# Service Exposure
EXPOSE 6667

# Clean up APT
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

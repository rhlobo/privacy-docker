# BASE IMAGE:  https://github.com/phusion/baseimage-docker
# VERSIONS:    https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
FROM phusion/baseimage:0.9.15

MAINTAINER Roberto Lobo <rhlobo@gmail.com>

# Setting environment variables
ENV HOME /root

# Setting SSH access
ADD id_rsa.pub /tmp/id_rsa.pub
RUN cat /tmp/id_rsa.pub >> /root/.ssh/authorized_keys && rm -f /tmp/id_rsa.pub

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Software
RUN apt-get update --quiet
RUN apt-get install --yes --quiet bitlbee
ADD bitlbee.conf /etc/bitlbee/bitlbee.conf
RUN mkdir /etc/service/bitlbee
ADD bitlbee.sh /etc/service/bitlbee/run
RUN chmod +x /etc/service/bitlbee/run
EXPOSE 6667

# Clean up APT
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# --------------

#RUN apt-get update
#RUN apt-get install software-properties-common language-pack-en -y
#RUN apt-get install bitlbee bitlbee-plugin-otr perl -y
#RUN ln -sf /usr/share/zoneinfo/PST8PDT /etc/localtime
#ADD run.sh /run.sh
#RUN chmod +x /run.sh
#CMD ["/run.sh"]
#service bitlbee {start|stop|restart|force-reload}

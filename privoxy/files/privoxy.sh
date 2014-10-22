#!/bin/sh
exec /sbin/setuser privoxy /usr/sbin/privoxy --no-daemon /etc/privoxy/config >>/var/log/privoxy.log 2>&1

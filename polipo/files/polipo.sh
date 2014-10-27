#!/bin/sh
exec /sbin/setuser polipo /usr/bin/polipo -c /etc/polipo/config >>/var/log/polipo.log 2>&1

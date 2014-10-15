#!/bin/sh
exec /sbin/setuser tor /usr/bin/tor >>/var/log/tor.log 2>&1

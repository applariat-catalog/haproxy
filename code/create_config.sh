#!/bin/sh
#Dynamically create the config based on container ENV_VARS

[ -n "$WEB_SVC" ]  && cat /conf/web.cfg >> /usr/local/etc/haproxy/haproxy.cfg

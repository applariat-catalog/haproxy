#! /bin/sh
# appLariats generic haproxy build script

#Log everything in /src/build.log
logfile=/code/build.log
exec > $logfile 2>&1
set -x

#check inside code artifact for /code/haproxy-conf/haproxy.cfg and use it if exists
#customizing haproxy through providing haproxy-conf/haproxy.cfg as part of the code artifact
if [ -e /code/haproxy-conf/haproxy.cfg ]
then
 cp -f /code/haproxy-conf/haproxy.cfg /usr/local/etc/haproxy/
else
 #look inside /conf for haproxy.cfg and use it if exists
 #customizing haproxy through cloning this github repo and providing conf/haproxy.cfg
 if [ -e /conf/haproxy.cfg ]
 then
  cp -f /conf/haproxy.cfg /usr/local/etc/haproxy/
 fi
 #if non of the above, default config file inside the image will be used
fi

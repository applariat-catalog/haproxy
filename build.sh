#! /bin/sh
# appLariats generic haproxy build script
# Requirements - A valid haproxy.cfg file exists within the /src/conf/
# Copies the haproxy.cfg file from the /src/conf/ and copies it into /usr/local/etc/haproxy/haproxy.cfg

#Log everything in /src/build.log
logfile=/src/build.log
exec > $logfile 2>&1
set -x

#Check for haproxy.cfg and throw exception if not present
if [ -e /src/conf/haproxy.cfg ]
then
    cp -f /src/conf/haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
else
    echo "ERROR! haproxy.cfg not found"
    exit 1
fi

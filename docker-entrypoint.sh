#!/bin/bash

# 启动redis
/etc/init.d/redis start

# 启动tomcat
/usr/local/tomcat8/bin/startup.sh

exec "$@"
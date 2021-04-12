#!/usr/bin/env bash

[ "$DEBUG" ] && set -x

# if [ "$(ls -A /app/zentaopms)" = "" ]; then
#   cp -a /var/www/zentaopms/* /app/zentaopms
# fi
if [ ! -f /app/zentaopms/VERSION ] || [ "$(cat /app/zentaopms/VERSION)" != "$(cat /var/www/zentaopms/VERSION)" ]; then
  cp -a /var/www/zentaopms/* /app/zentaopms
fi
chmod -R 777 /app/zentaopms/www/data /app/zentaopms/tmp
chmod 777 /app/zentaopms/www /app/zentaopms/config
chmod -R a+rx /app/zentaopms/bin/*

/etc/init.d/apache2 start

chown -R www-data:www-data /app/zentaopms

tail -f /var/log/apache2/zentao_error_log

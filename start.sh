#!/bin/bash

ROOTT="/var/www/html"

chown -Rf www-data.www-data $ROOTT

/usr/sbin/apache2ctl -D FOREGROUND &

tail -f /var/log/apache2/*log


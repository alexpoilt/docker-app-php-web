#!/bin/bash

chown -Rf www-data.www-data ${DIR_WWW}

/usr/sbin/apache2ctl -D FOREGROUND &

tail -f /var/log/apache2/*log


#!/bin/bash

set -e

if [ ! -e "${DIR_WWW}" ]; then
  mkdir -p ${DIR_WWW}
fi

if [ -d ${DIR_WWW} ]; then
  echo "--> Já exite um código fonte no diretório ${DIR_WWW}" 
  chown -Rf www-data.www-data ${DIR_WWW}
else
  echo "--> Ainda não existe um código fonte no diretório ${DIR_WWW}"
  echo "--> Clonando o projeto do URL passado"
  cd ${DIR_WWW} && git clone ${GIT_URL_PROJECT}
  chown -Rf www-data.www-data ${DIR_WWW}
fi

/usr/sbin/apache2ctl -D FOREGROUND &

tail -f /var/log/apache2/*log

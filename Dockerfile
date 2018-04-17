FROM ubuntu:14.04
MAINTAINER alvaro@alvarobacelar.com

ENV APACHE_RUN_USER=www-data \ 
    APACHE_RUN_GROUP=www-data \
    APACHE_LOG_DIR=/var/log/apache2 \
    DOMAIN_NAME=yourapp.com \
    DIR_WWW=/var/www/html \
    GIT_URL_PROJECT=https://github.com/alvarobacelar/CiclOps.git

RUN apt-get update && apt-get install -y git apache2 php5 libapache2-mod-php5 php5-mcrypt php5-mysqlnd php5-ldap php5-gd git

ADD . ${DIR_WWW}

RUN php5enmod mcrypt
RUN php5enmod mysql
RUN php5enmod ldap

RUN perl -p -i -e "s/max_execution_time = 30/max_execution_time = 120/g" /etc/php5/apache2/php.ini
RUN perl -p -i -e "s/upload_max_filesize = 2M/upload_max_filesize = 500M/g" /etc/php5/apache2/php.ini
RUN perl -p -i -e "s/post_max_size = 8M/post_max_size = 500M/g" /etc/php5/apache2/php.ini

RUN mv ${DIR_WWW}/apache-default.conf /etc/apache2/sites-available/000-default.conf
RUN ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load
RUN mv ${DIR_WWW}/entrypoint.sh /srv/entrypoint.sh && chmod a+x /srv/entrypoint.sh

EXPOSE 80
VOLUME ${DIR_WWW}
ENTRYPOINT ["/srv/entrypoint.sh"]
CMD ["FOREGROUND","-D","/usr/sbin/apache2ctl"]

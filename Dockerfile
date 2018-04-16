FROM ubuntu:14.04
RUN apt-get update && apt-get install -y git apache2 php5 libapache2-mod-php5 php5-mcrypt php5-mysqlnd php5-ldap php5-gd
ENV APACHE_RUN_USER www-data 
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV DOMAIN_NAME yourapp.com
ENV DIR_WWW /var/www/html

ADD . ${DIR_WWW}

RUN php5enmod mcrypt
RUN php5enmod mysql
RUN php5enmod ldap

RUN perl -p -i -e "s/max_execution_time = 30/max_execution_time = 120/g" /etc/php5/apache2/php.ini

RUN mv ${DIR_WWW}/apache-default.conf /etc/apache2/sites-available/000-default.conf
RUN ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load
RUN mv ${DIR_WWW}/start.sh /start.sh && chmod a+x /start.sh
WORKDIR ${DIR_WWW}
EXPOSE 80
VOLUME /var/www/html
CMD /start.sh


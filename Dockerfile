FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y supervisor nginx php-fpm mysql-server php-mysql && apt clean

RUN sed -i 's/listen = .*/listen = 127.0.0.1:9000/' /etc/php/*/fpm/pool.d/www.conf
RUN echo "\n[mysqld]\ndefault_authentication_plugin=mysql_native_password" >> /etc/mysql/mysql.cnf

COPY ./config/ /etc/supervisor/conf.d/
# COPY php.conf /etc/supervisor/conf.d/
# COPY mysqld.conf /etc/supervisor/conf.d/

COPY ./config_mysql.sh /config_mysql.sh
RUN bash config_mysql.sh

COPY default /etc/nginx/sites-available/
COPY ./php/ /var/www/html/
# COPY index.php /var/www/html/
# COPY insert.php /var/www/html/
# COPY select.php /var/www/html/
# COPY info.php /var/www/html/
EXPOSE 80 9000 3306


CMD ["supervisord", "-n"]
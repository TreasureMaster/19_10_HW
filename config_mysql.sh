#!/bin/bash

echo "Setting up mysql."
/usr/bin/mysqld_safe & sleep 10
mysql -e "CREATE DATABASE web;"
mysql -e "CREATE USER 'web'@'localhost' IDENTIFIED WITH mysql_native_password BY 'webpassword';"
mysql -e "GRANT ALL ON web.* TO 'web'@'localhost';"

killall mysqld
sleep 10

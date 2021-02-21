#!/bin/sh

LOG='www'
PASS='www'
NAME_DB='wordpress_db'
HOSTS='%'

/usr/bin/mysql_install_db

chmod 777 -R /var/lib/mysql/

#Start in daemon mode to create the NAME_DB
/usr/share/mariadb/mysql.server start

mysql <<MYSQL_SCRIPT
CREATE DATABASE wordpress_db;
CREATE USER '$LOG'@'$HOSTS' IDENTIFIED BY '$PASS';
GRANT ALL PRIVILEGES ON wordpress_db.* TO '$LOG'@'$HOSTS';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

mysql wordpress_db < wordpress_db.sql

/usr/share/mariadb/mysql.server stop


#Start process
sleep 2
/usr/bin/mysqld_safe
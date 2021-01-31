#!/bin/sh
LOG='admin'
PASS='admin'

/usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"

/usr/share/mariadb/mysql.server start

mysql <<MYSQL_SCRIPT
CREATE DATABASE wordpress_db;
CREATE USER '$LOG'@localhost IDENTIFIED BY '$PASS';
GRANT ALL PRIVILEGES ON wordpress_db.* TO '$LOG'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

/usr/share/mariadb/mysql.server stop

/usr/bin/mysqld_safe --datadir="/var/lib/mysql"

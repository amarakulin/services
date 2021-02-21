#!/bin/sh 
cd ./wordpress
sh run_wp.sh 
cd ../mysql
sh run_mysql.sh 
cd ../phpmyadmin
sh run_phpmyadmin.sh
cd ../nginx
sh run_configs.sh
cd ../ftps
sh run_ftps.sh
cd ../grafana
sh run_grafana.sh
cd ../influxdb
sh run_influxdb.sh

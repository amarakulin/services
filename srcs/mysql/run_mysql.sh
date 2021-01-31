#!/bin/sh 
docker build -t mysql_img .
kubectl apply -f mysql.yaml

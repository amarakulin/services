#!/bin/sh 
docker build -t nginx_img .
kubectl apply -f nginx.yaml

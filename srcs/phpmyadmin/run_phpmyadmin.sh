#!/bin/sh
docker build -t phpmyadmin_img .
kubectl apply -f phpmyadmin.yaml

#!/bin/sh 
docker build -t wp_img .
kubectl apply -f wp.yaml


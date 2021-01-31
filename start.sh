#!/bin/sh 

minikube start --vm-driver=virtualbox
minikube addons enable metallb
#kubectl apply -f config_metallb.yaml
eval $(minikube docker-env)



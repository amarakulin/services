#!/bin/sh 

minikube start --vm-driver=virtualbox
minikube addons enable metallb
eval $(minikube docker-env)
eval $(minikube docker-env)
eval $(minikube docker-env)
eval $(minikube docker-env)
eval $(minikube docker-env)
kubectl apply -f ./srcs/config_metallb.yaml
cd ./srcs
sh run_all_containers.sh


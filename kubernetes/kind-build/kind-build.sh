#! /bin/bash
kind create cluster --config yamls/kind-3nodes.yaml
kubectl label node kind-worker node-role.kubernetes.io/node=
kubectl label node kind-worker2 node-role.kubernetes.io/node=
kind load docker-image 50857500/php:7.3.25
kind load docker-image mysql:5.7.34
kind load docker-image nginx
kind load docker-image redis
kubectl apply -f yamls/php-fpm.yaml
PHPSVC=$(kubectl get svc php-svc -o jsonpath='{.spec.clusterIP}{"\n"}') envsubst < yamls/nginx-config.yaml | kubectl apply -f -
kubectl apply -f yamls/nginx.yaml
kubectl apply -f yamls/mysql-config.yaml
kubectl apply -f yamls/mysql.yaml
kubectl apply -f yamls/redis.yaml

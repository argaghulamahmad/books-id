#!/usr/bin/env bash

min=1
max=5

echo "Creating the volume..."

kubectl apply -f ./kubernetes/persistent-volume.yml
kubectl apply -f ./kubernetes/persistent-volume-claim.yml


echo "Creating the database credentials..."

kubectl apply -f ./kubernetes/secret.yml


echo "Creating the postgres deployment and service..."

kubectl create -f ./kubernetes/postgres-deployment.yml
kubectl autoscale deployment postgres --min=${min} --max=${max}
kubectl create -f ./kubernetes/postgres-service.yml



echo "Creating the flask deployment and service..."

kubectl create -f ./kubernetes/flask-deployment.yml
kubectl autoscale deployment flask --min=${min} --max=${max}
kubectl create -f ./kubernetes/flask-service.yml


echo "Adding the ingress..."

minikube addons enable ingress
kubectl apply -f ./kubernetes/minikube-ingress.yml


echo "Creating the vue deployment and service..."

kubectl create -f ./kubernetes/vue-deployment.yml
kubectl autoscale deployment vue --min=${min} --max=${max}
kubectl create -f ./kubernetes/vue-service.yml

echo "Creating the vue admin deployment and service..."

kubectl create -f ./kubernetes/vue-admin-deployment.yml
kubectl autoscale deployment vue-admin --min=${min} --max=${max}
kubectl create -f ./kubernetes/vue-admin-service.yml
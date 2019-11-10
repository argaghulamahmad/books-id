#!/usr/bin/env bash
docker build -t argaghulamahmad/flask-kubernetes ./services/server
docker push argaghulamahmad/flask-kubernetes

docker build -t argaghulamahmad/vue-kubernetes ./services/client -f ./services/client/Dockerfile-minikube
docker push argaghulamahmad/vue-kubernetes
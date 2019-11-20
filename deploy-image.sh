#!/usr/bin/env bash
docker build -t argaghulamahmad/flask-kubernetes ./services/server
docker push argaghulamahmad/flask-kubernetes

docker build -t argaghulamahmad/flask-kubernetes-admin ./services/server-admin/
docker push argaghulamahmad/flask-kubernetes-admin

docker build -t argaghulamahmad/vue-kubernetes ./services/client -f ./services/client/Dockerfile-minikube
docker push argaghulamahmad/vue-kubernetes

docker build -t argaghulamahmad/vue-kubernetes-admin ./services/client-admin/ -f ./services/client-admin/Dockerfile-minikube
docker push argaghulamahmad/vue-kubernetes-admin
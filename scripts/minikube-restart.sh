#!/usr/bin/env bash
minikube stop; minikube delete
minikube start
minikube dashboard --url
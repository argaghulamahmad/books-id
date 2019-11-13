#!/usr/bin/env bash

echo "Create books database"
POD_NAME=$(kubectl get pod -l service=postgres -o jsonpath="{.items[0].metadata.name}")
kubectl exec $POD_NAME --stdin --tty -- createdb -U sample books

FLASK_POD_NAME=$(kubectl get pod -l app=flask -o jsonpath="{.items[0].metadata.name}")
echo "Migrate database"
kubectl exec $FLASK_POD_NAME --stdin --tty -- python manage.py recreate_db
echo "Seeding database"
kubectl exec $FLASK_POD_NAME --stdin --tty -- python manage.py seed_db

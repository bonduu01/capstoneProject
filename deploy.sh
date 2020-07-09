#!/usr/bin/env bash

#Pulls docker image from DockerHub

docker pull bonduu01/udacitycaptoneproject:latest

#docker deploy command to deploy application as a container

docker run -d -p 8282:8080 --name udacitycaptoneproject bonduu01/udacitycaptoneproject:latest

#The load-balancer.yml creates a deployment, associated replica sets with 3 pods, each of which runs the udacitycaptoneproject application.

kubectl apply -f /app/load-balancer.yaml

#Expose deployed service

kubectl expose deployment udacitycapstoneproject --type=LoadBalancer --name=udacitycapstoneproject-service
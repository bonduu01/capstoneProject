#!/usr/bin/env bash

#Pulls docker image from DockerHub

docker pull bonduu01/udacitycaptoneproject:latest

#docker deploy command to deploy application as a container

docker run -d -p 8282:8080 -name udacitycaptoneproject bonduu01/udacitycaptoneproject:latest

#Deploys image into target server into AWS server with static private ip: 172.31.6.246

kubectl create deployment udacitycapstoneproject --image=bonduu01/udacitycaptoneproject:latest

#Run deployed image on port 8080

kubectl run udacitycapstoneproject --image=bonduu01/udacitycaptoneproject:latest --port=8080
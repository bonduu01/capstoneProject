#!/usr/bin/env bash

#Pulls docker image from DockerHub

docker pull bonduu01/udacitycaptoneproject:latest

#Deploys image into target server into AWS server with static private ip: 172.31.6.246
kubectl create deployment udacityCapstomeProject --image=bonduu01/udacitycaptoneproject:latest
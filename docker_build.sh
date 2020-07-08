#!/usr/bin/env bash

#Builds application into a docker image

docker build --rm -t bonduu01/udacitycaptoneproject:latest .

#list images

docker images ls
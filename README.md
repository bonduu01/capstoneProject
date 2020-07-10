 ## Project Overview

This project is based on Udacity's final capstone project.


## Project Specification

##Summary of Capstone Project


##Step 1 Springboot application
* Created a springboot application to display "Welcome to Udacity Captone Project Hello Udacity Reviewer, My name is Peter Molokwu and this is my final Captone project on Udacity's Nano program Cloud DevOps Engineer"
* Springboot application is configured on application.properties file to run on port 8080.

##Step 2 Github Repository

* A repository name capstoneProject is created on github, github url: https://github.com/bonduu01/capstoneProject.git
* git pull request is initiated to pull repository into local system.

##Step 3 Jenkins

Jenkins application is installed on target server. all dependent plugins are installed.

##Step 4: JenkinsFile

* Dockerfile is created, on docker file, application jar target/capstoneProject-0.0.1-SNAPSHOT.jar is created when Dockerfile is built.
* docker_build.sh contains script to build.
* Lint html, images for failed (Failed_lint_image.png) and successful (Successful_lint_image.png) lints are contained in image project images.
* docker_update.sh pushes created docker image to dockerhub.
* Ansible command is finally used to deploy into target server using information contained in inventory file and deploy.yml.

##Step 5 Deployment processes

* The deploy.yml file contains tasks which is: copy deploy.sh, load-balancer.yaml and nginx.conf to target deployment server.
* Afterwards, the deploy.sh file is run locally on target server.
* The deploy.sh consist of set on commands to run locally on target server which are highlighted below:
  1. Pull docker image bonduu01/udacitycaptoneproject:latest from dockerhub. 
  2. Deploy on container by running docker run command with port 8282 exposed.
  3. Confirmation of deployed application url: http://ec2-35-167-33-104.us-west-2.compute.amazonaws.com:8282/ image can be viewed at project images folder with name "docker deploy image.png".
  4. The load-balancer.yml creates a kubenetes deployment, associated replica sets with 3 pods, each of which runs the udacitycaptoneproject application loadbalanced to a single external virtual ip address.
  5. Expose deployed service to kubectl --loadbalancer commands.
  6. Command to retrieve external load balancer ip address and store into file path /app
  7. nginx is installed so that external ip can be called via aws instance public dns.
  8. nginx config is setup with loadbalanced external ip address and aws public dns.
  9. The Docker container deployed into a Kubernetes cluster, configured and proxied to nginx can be viewed via url: http://ec2-35-167-33-104.us-west-2.compute.amazonaws.com/ note: kubenetes deploy image.png
  
##Images

- 1.png: This image represents the build step.
- 2.png: This image represents the lint step.
- 3.png: This image represents push to dockerhub.
- 4.png: This image represents deploy to target production server using docker run and kubectl commands.
- 5.png: This image contains aws ec2 servers used named minikube and jenkins. Minikube is server where application was containerized and deployed. t
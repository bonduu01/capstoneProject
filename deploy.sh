#!/usr/bin/env bash

#Pulls docker image from DockerHub

docker pull bonduu01/udacitycaptoneproject:latest

#docker deploy command to deploy application as a container

docker run -d -p 8282:8080 --name udacitycaptoneproject bonduu01/udacitycaptoneproject:latest

#The load-balancer.yml creates a deployment, associated replica sets with 3 pods, each of which runs the udacitycaptoneproject application.

kubectl apply -f /app/load-balancer.yaml

#Expose deployed service

kubectl expose deployment udacitycapstoneproject --type=LoadBalancer --name=udacitycapstoneproject-service

#Command to retrieve external load balancer ip address and store into file path /app
rm -rf /app/cluster.txt
kubectl get services udacitycapstoneproject-service >> /app/cluster.txt

#installs nginx, enable nginx service and starts service
apt install nginx -y && systemctl enable nginx

#Retrive and store in a variable external IP address stored in /app/cluster.txt
var="$(grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' /app/cluster.txt)"

#Upload application name conf file to nginx conf path /etc/nginx/conf.d
cat <<EOF >>/etc/nginx/conf.d/ec2-35-167-33-104.us-west-2.compute.amazonaws.conf
server {
# The IP that you forwarded in your router (nginx proxy)
  listen 80; # this is not the default_server

# Make site accessible from http://localhost/
 server_name ec2-35-167-33-104.us-west-2.compute.amazonaws.com;

 access_log  /var/log/nginx/mini-access.log;
 error_log /var/log/nginx/mini-error.log;

# The internal IP of the VM that host you Apache config
 set \$upstream $var:8080;

   location / {

     proxy_pass_header Authorization;
     proxy_pass http://$upstream;
     proxy_set_header Host $host;
     proxy_set_header X-Real-IP $remote_addr;
     proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
     proxy_http_version 1.1;
     proxy_set_header Connection "";
     proxy_buffering off;
     client_max_body_size 0;
     proxy_read_timeout 36000s;
     proxy_redirect http://$upstream ec2-35-167-33-104.us-west-2.compute.amazonaws.com/;

   }
}
EOF

#Fixed a bug on nginx.conf
yes | cp -rf /app/nginx.conf /etc/nginx/

#restart nginx
systemctl restart nginx



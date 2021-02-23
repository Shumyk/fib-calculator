# fib-calculator

Multi Docker container application.
The application contains Redis, Postgres, Client, Server, Worker and Nginx containers in order to learn how to build and deploy multi-container applications.

Aim of this project is to calculate Fibonnaci value.
Redis and Postgres contains requested numbers and calculated values.

Client is React Application responsible for render UI.
Server is Express Application which exposes endpoint which caluculates Fibonacci value. Calls Worker.
Worker is JS application which holds actuall logic of calculating Fibonacci value and setting it to Redis.
Nginx is responsible for request routing to Client and Server.

Project contains also docker-compose.yml file which build containers for development mode.
Also here Dockerrun.aws.json which is used for determing containers and its details for AWS deployment.


--  k8s directory
Configuration files for Kubernetes. Inludes configs for all deployments, cluster IPs, persistent volume claim, redis, postgres, ingress service.

-- .travis.yml - configuration for Travis CI automatic builds

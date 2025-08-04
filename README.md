# Symfony DevOps Case Study – Full Stack Deployment on AWS

This repository contains a complete end-to-end DevOps setup for deploying a minimal Symfony backend application using AWS infrastructure. The project demonstrates modern DevOps practices including containerization, Infrastructure as Code (IaC), continuous deployment, and cloud-native service deployment using AWS ECS Fargate.

---

## Repository Structure

symfony-devops/
├── symfony-app/ # Symfony application (PHP backend)
├── symfony-aws-infra/ # Terraform code for AWS infrastructure
├── .github/workflows/ # GitHub Actions workflow for CI/CD
└── .gitignore

---

## 1. Application Overview

The Symfony application is a minimal PHP backend with a single route:

- Health Check Endpoint: `/healthz`  
- Response: HTTP 200 OK with text "OK"

This endpoint is used by AWS ECS and Load Balancer to determine if the service is healthy and ready to serve traffic.

---

## 2. Technologies Used

- Symfony (PHP micro-framework)
- Docker (multi-stage build)
- AWS ECS Fargate (container hosting)
- AWS ECR (image storage)
- AWS ALB (load balancing and health checks)
- GitHub Actions (CI/CD pipeline)
- Terraform (Infrastructure as Code)
- AWS VPC, IAM, Security Groups

---

## 3. How to Use This Project

### A. Clone the Repository

``bash
git clone https://github.com/SaiTejaGodi/symfony-devops.git
cd symfony-devops ``
B. Local Development (Optional)
Run the Symfony app using Docker:

``cd symfony-app
docker build -t symfony-app .
docker run -p 8000:8000 symfony-app ``
# Visit http://localhost:8000/healthz

C. Provision Infrastructure (Terraform)

``cd symfony-aws-infra
terraform init
terraform plan
terraform apply``
This will provision:

VPC, subnets, IGW, and routing

ECS cluster and Fargate task definition

Application Load Balancer

Security groups and IAM roles

ECS service with the Symfony container

D. Continuous Deployment via GitHub Actions:

The GitHub Actions pipeline is triggered on every push to main:

Builds Docker image from symfony-app/

Pushes to AWS ECR

Updates ECS Fargate service with a new task definition

Restarts service with zero downtime

Make sure you’ve configured the following GitHub Secrets:

AWS_ACCESS_KEY_ID	IAM user access key
AWS_SECRET_ACCESS_KEY	IAM user secret
AWS_REGION	e.g., eu-central-1 
ECR_REPOSITORY	symfony-app
ECS_CLUSTER	e.g., symfony-cluster
ECS_SERVICE	e.g., symfony-service
ECS_TASK_DEF_NAME	e.g., symfony-task

E. Access the Application
After successful deployment, get your Load Balancer DNS name from the AWS Console and visit:

http://<load-balancer-dns>/healthz
You should see OK.

4. Infrastructure Changes
All infrastructure changes should be done using Terraform. Follow this process:


cd symfony-aws-infra
``terraform plan      
terraform apply   `` 



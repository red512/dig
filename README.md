# Flask Python App and React on AWS EKS Cluster
This repository contains the Terraform configuration and Kubernetes manifests for deploying a Flask-Python backend application and a React frontend on an AWS EKS cluster. Additionally, it includes Dockerfiles for both the backend and frontend applications.


Overview
The main focus of this project is to deploy a Flask-Python backend application and a React frontend on a Kubernetes cluster running on AWS EKS. The cluster is set up using Terraform and includes various components like PostgreSQL, Prometheus monitoring, Metrics Server, and ArgoCD for GitOps management.


Components
- Terraform Configuration:


* 0-aws-provider.tf: Configures the AWS provider for Terraform. 
* 1-vpc.tf: Defines the Virtual Private Cloud (VPC) and its components.
* 2-eks.tf: Creates the EKS cluster, including the EKS control plane and worker nodes.
* 3-iam.tf: Sets up IAM roles and policies required for EKS and other resources.
* 4-helm-provider.tf: Configures the Helm provider to manage Helm charts and deployments.
* 5-helm-prometheus.tf: Deploys Prometheus monitoring using Helm.
* 6-helm-postgres.tf: Installs PostgreSQL using Helm.
* 7-argocd.tf: Sets up ArgoCD, a GitOps tool, to manage applications on the EKS cluster.
* 8-metrics-server.tf: Deploys Metrics Server for resource utilization metrics.


Flask-Python Backend and React Frontend:
- The flask-pytorch-backend-master directory contains the source code for the Flask-Python backend and React frontend applications. Separate Dockerfiles are provided for both the backend and frontend folders. The deployments, services nad are in the gitops repo

Continuous Integration and Deployment (CI/CD)
* A simple CI pipeline using GitHub Actions is set up to build and push the frontend Docker image to Docker Hub on each push.
* For CD, ArgoCD is utilized for continuous application deployment based on changes in the GitOps repository, ensuring the cluster remains up-to-date.



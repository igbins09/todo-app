# To-Do List App with DevOps Pipeline

A minimal To-Do List app showcasing a DevOps pipeline with containerization, CI/CD, and cloud deployment on Azure.

## Features
- Add and delete tasks via a simple web UI (in-memory storage).

## DevOps Pipeline
- **Containerization**: Docker
- **CI/CD**: GitHub Actions
- **IaC**: Terraform (provisions Azure resources)
- **Deployment**: Azure Container Apps

## Setup Instructions
1. Clone: `git clone https://github.com/igbins09/todo-app`
2. Run locally: `npm install && node server.js`
3. Dockerize: `docker build -t todo-app . && docker run -p 3000:3000 todo-app`
4. Provision Azure: `terraform apply`
5. Deploy: Push to `main` branch to trigger CI/CD.

## Skills Demonstrated
- Docker containerization
- Automated CI/CD with GitHub Actions
- Infrastructure as Code with Terraform
- Azure cloud deployment

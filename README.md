# AWS Terraform Ansible Docker CI/CD Deployment

This project demonstrates an automated deployment pipeline using **AWS**, **Terraform**, **Ansible**, **Docker**, and **GitHub Actions** for CI/CD. The setup provisions an EC2 instance on AWS, installs Docker using Ansible, and hosts an Nginx-based web server on the instance.

## Table of Contents
- [Overview](#overview)
- [Architecture](#architecture)
- [Technologies Used](#technologies-used)
- [Setup Instructions](#setup-instructions)
- [CI/CD Pipeline](#cicd-pipeline)
- [Usage](#usage)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

---

## Overview
This project automates infrastructure deployment, server configuration, and application hosting on AWS using infrastructure as code (IaC) tools and CI/CD practices. The GitHub Actions pipeline provisions cloud infrastructure with Terraform, configures the instance with Ansible, and deploys a Dockerized Nginx web server.

## Architecture
The deployment includes the following components:
1. **AWS EC2 Instance**: Hosted in a Virtual Private Cloud (VPC) and secured by security groups.
2. **Terraform**: Provisions the EC2 instance and configures networking.
3. **Ansible**: Installs Docker and runs an Nginx container to serve the application.
4. **Docker**: Runs the Nginx web server on the EC2 instance.
5. **GitHub Actions**: Automates deployment with a CI/CD pipeline triggered by code updates.


## Technologies Used
- **AWS**: Cloud provider for EC2 instance.
- **Terraform**: Infrastructure as Code (IaC) tool to manage AWS resources.
- **Ansible**: Configuration management tool to install and configure software.
- **Docker**: Containerization tool to run Nginx server.
- **GitHub Actions**: CI/CD automation tool for deploying updates.

## Setup Instructions
1. **AWS Setup**:
   - Create an AWS account.
   - Set up IAM roles and a key pair.
   - Configure necessary permissions for Terraform and Ansible to access AWS.

2. **Local Setup**:
   - Install [Terraform](https://www.terraform.io/downloads.html) and [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).
   - Clone this repository: 
     ```bash
     git clone https://github.com/VishalChaskar/aws-cicd.git
     ```
   - Create an SSH key pair to access the EC2 instance (if not using an existing one).
  
3. **GitHub Secrets Configuration**:
   - Add your `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, and SSH private key in **GitHub Secrets** under the repository settings.
   - Define any additional secrets for Terraform variables if needed.

## CI/CD Pipeline
The **GitHub Actions** workflow file (`main.yml`) includes:
1. **Terraform Job**: Creates and configures the EC2 instance on AWS.
2. **Ansible Job**: Installs Docker and deploys an Nginx container on the EC2 instance.
3. **Output Handling**: Retrieves the EC2 instance IP and uses it in the Ansible playbook.

Each job in the pipeline is triggered on changes to the `main` branch, ensuring that any updates to the code are deployed automatically.

## Usage
- **Accessing the Deployed Application**:
  - Once the pipeline completes, the web application can be accessed via the public IP of the EC2 instance.
  - Retrieve the IP from the **GitHub Actions** job output or by running:
    ```bash
    terraform output vm_ip
    ```
  
## Troubleshooting
- **SSH Access Issues**: Ensure that the correct private key is added to your SSH agent or GitHub Secrets.
- **Permissions**: Verify IAM permissions for both Terraform and Ansible roles.
- **Networking**: Confirm that the security group allows inbound traffic on required ports (22 for SSH, 80 for HTTP).

## Contributing
Contributions are welcome! Please fork this repository, create a new branch, and submit a pull request with any enhancements or bug fixes.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

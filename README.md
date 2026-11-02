# AWS EC2 Website Deployment and Troubleshooting Lab

## Project Overview

This project demonstrates how to deploy a website on an AWS EC2 instance using Amazon Linux 2023 and Nginx.

It also provides hands-on experience with AWS networking, security groups, Linux administration, and infrastructure troubleshooting.

## Architecture

- Cloud provider: AWS
- Region: eu-north-1
- Compute: Amazon EC2
- Instance type: t3.micro
- Operating system: Amazon Linux 2023
- Web server: Nginx
- Storage: 8 GiB gp3
- Networking: VPC, public subnet, Internet Gateway
- Firewall: EC2 Security Group
- Automation: EC2 User Data
- Version control: Git and GitHub

## Deployment

The EC2 instance uses the `user-data.sh` script to:

1. Install Nginx.
2. Create a custom HTML webpage.
3. Enable Nginx at system startup.
4. Start the Nginx service.

## Security

- HTTP traffic is allowed on port 80.
- SSH access is restricted to a specific public IP address.
- Private keys and AWS credentials are excluded from Git.

## Validation

The website was tested using:

`curl -I http://<EC2-PUBLIC-IP>`

The server returned an HTTP 200 OK response.

## Troubleshooting Exercise

A controlled failure will be introduced by removing the HTTP inbound rule from the EC2 security group.

The investigation will cover:

- Checking the EC2 instance state.
- Verifying the Nginx service.
- Inspecting security group rules.
- Identifying the cause of the connectivity failure.
- Restoring HTTP access.
- Testing the website again.

## Learning Outcomes

- Deploying a Linux server on AWS.
- Understanding VPCs, subnets, and Internet Gateways.
- Configuring EC2 security groups.
- Automating server configuration with User Data.
- Testing website availability.
- Diagnosing and resolving infrastructure failures.

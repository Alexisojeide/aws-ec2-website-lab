# AWS EC2 Website Deployment and Troubleshooting Lab

## Project Overview

This project demonstrates how to deploy a website on an AWS EC2 instance using Amazon Linux 2023 and Nginx.

It provides hands-on experience with AWS networking, security groups, Linux administration, automated provisioning, and infrastructure troubleshooting.

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

After deployment, I verified that the website was publicly accessible using its EC2 public IP address and confirmed that Nginx returned an HTTP 200 response.

## Networking and Security

Configured the EC2 security group to control inbound traffic:

- HTTP (TCP 80): Allows public website access.
- SSH (TCP 22): Restricted to the administrator's public IP address.

The instance was deployed in a public subnet with an Internet Gateway route.

## Troubleshooting Exercise

I deliberately removed the HTTP inbound security group rule to simulate a website connectivity failure.

### Symptoms

- The EC2 instance remained running.
- External HTTP requests timed out.
- SSH access initially failed because the administrator's public IP had changed.

### Investigation

1. Checked the EC2 instance state using AWS CLI.
2. Inspected the security group's inbound rules.
3. Restored SSH access using the administrator's current public IP.
4. Connected to the instance and checked the Nginx service.
5. Confirmed that Nginx was active and running.

### Root Cause

The HTTP inbound rule for TCP port 80 was missing from the EC2 security group.

The EC2 instance and Nginx service were healthy, but external traffic could not reach the website.

### Resolution

Restored the HTTP inbound rule using AWS CLI and verified website accessibility with `curl`.

The website returned:

`HTTP/1.1 200 OK`

This confirmed that connectivity had been restored without restarting Nginx.

## Key Lessons

- Understand the relationship between EC2, VPCs, subnets, route tables, and security groups.
- Use EC2 User Data to automate instance provisioning.
- Distinguish application health from network connectivity.
- Diagnose security-group issues using AWS CLI.
- Restrict SSH access to trusted IP addresses.
- Verify infrastructure changes instead of assuming they worked.

## Project Documentation

- [Architecture Documentation](documentation/architecture.md)
- [Troubleshooting Report](documentation/troubleshooting.md)
- [EC2 User Data Script](user-data.sh)

## Technologies Used

AWS EC2, Amazon Linux 2023, Nginx, AWS CLI, VPC, Security Groups, Linux, Bash, Git, and GitHub.

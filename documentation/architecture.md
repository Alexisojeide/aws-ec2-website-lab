
# AWS EC2 Website Architecture

## Overview

This project deploys a website on an AWS EC2 instance using Amazon Linux 2023 and Nginx.

## Architecture Diagram

```mermaid
flowchart TD
    A[Internet User] --> B[Internet Gateway]
    B --> C[Public Subnet]
    C --> D[EC2 Instance]
    D --> E[Amazon Linux 2023]
    E --> F[Nginx Web Server]
    F --> G[Website HTML]

## AWS Components

| Component | Purpose |
|---|---|
| Amazon VPC | Provides an isolated network for AWS resources |
| Public Subnet | Places EC2 in a network with internet routing |
| Internet Gateway | Allows internet communication |
| EC2 | Hosts the website |
| Security Group | Controls inbound network traffic |
| Amazon Linux 2023 | Operating system |
| Nginx | Serves the website over HTTP |
| User Data | Automates server configuration |

## Network Access

- HTTP: TCP port 80, accessible from the internet.
- SSH: TCP port 22, restricted to the administrator's public IP.

## Deployment Flow

1. AWS launches the EC2 instance.
2. The User Data script runs during startup.
3. Nginx is installed.
4. The website HTML file is created.
5. Nginx is enabled and started.
6. Users access the website through the EC2 public IP address.

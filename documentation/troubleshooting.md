# AWS EC2 Website Troubleshooting Report

## Project

AWS EC2 Website Deployment and Troubleshooting Lab

## Incident Summary

The website became inaccessible after the HTTP inbound rule was removed from the EC2 security group.

External HTTP requests to the EC2 public IP address timed out.

## Initial Environment

- Compute: AWS EC2
- Operating System: Amazon Linux 2023
- Web Server: Nginx
- HTTP Port: 80
- SSH Port: 22
- Region: eu-north-1

## Failure Symptoms

The following command was used to test website access:

`curl --connect-timeout 5 -I http://<EC2-PUBLIC-IP>`

Result:

`curl: (28) Failed to connect: Timeout was reached`

## Investigation

### 1. EC2 Instance Health

Checked the EC2 instance state using AWS CLI.

Result: Running.

### 2. Security Group Inspection

Inspected the inbound security group rules.

Finding:
- SSH on TCP port 22 was allowed.
- HTTP on TCP port 80 was missing.

### 3. SSH Access Investigation

SSH access initially failed because the administrator's public IP address had changed.

The SSH security group rule was updated to allow the current administrator IP using a /32 CIDR range.

SSH access was successfully restored.

### 4. Nginx Service Health

Connected to the EC2 instance and checked:

`sudo systemctl status nginx`

Result:
- Nginx was active (running).
- Configuration syntax validation was successful.
- Master and worker processes were running.

## Root Cause

The HTTP inbound rule on TCP port 80 had been removed from the EC2 security group.

The EC2 instance and Nginx service remained healthy, but external users could not reach the website.

## Resolution

Restored the HTTP inbound rule using AWS CLI:

`aws ec2 authorize-security-group-ingress`

The rule allows TCP port 80 from `0.0.0.0/0`.

SSH access was also restored by updating the administrator's allowed IP address.

## Verification

Tested external website access again:

`curl -I http://<EC2-PUBLIC-IP>`

Result:

`HTTP/1.1 200 OK`

Server: nginx/1.30.6

The website was successfully restored.

## Lessons Learned

- Security groups control access to AWS resources.
- A running EC2 instance does not guarantee website availability.
- Application health and network accessibility must be investigated separately.
- SSH access can fail when an administrator's public IP changes.
- AWS CLI can be used to investigate and restore network access.
- Troubleshooting should identify the root cause before restarting services.

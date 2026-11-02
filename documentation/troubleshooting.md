# AWS EC2 Website Troubleshooting Report

## Project

AWS EC2 Website Deployment and Troubleshooting Lab

## Current Status

The website was successfully deployed on an AWS EC2 instance running Amazon Linux 2023 and Nginx.

An HTTP request to the website returned `200 OK`.

## Planned Failure Scenario

The HTTP inbound rule (TCP port 80) will be temporarily removed from the EC2 security group.

Expected result: the website will become inaccessible from the internet, even though the EC2 instance and Nginx may still be running.

## Investigation Plan

1. Check whether the EC2 instance is running.
2. Check whether the Nginx service is active.
3. Inspect the security group's inbound rules.
4. Test HTTP connectivity.
5. Identify the root cause.

## Planned Resolution

Restore the HTTP inbound rule on TCP port 80.

## Verification

Test the website again and confirm that it returns `HTTP 200 OK`.

## Lessons to Document

- How security groups control network traffic.
- How to distinguish an application problem from a network access problem.
- How to investigate infrastructure failures systematically.

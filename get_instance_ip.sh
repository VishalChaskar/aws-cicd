#!/bin/bash

# Capture the EC2 instance's public IP from Terraform
INSTANCE_IP=$(terraform output -raw instance_ip)

# Check if the IP is available
if [ -z "$INSTANCE_IP" ]; then
  echo "Error: EC2 instance IP is not available."
  exit 1
fi

# Save the IP to a file
echo "$INSTANCE_IP" > instance_ip.txt
echo "EC2 Instance IP: $INSTANCE_IP"

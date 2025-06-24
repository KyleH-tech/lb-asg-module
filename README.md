# 🚀 Terraform VPC + Load Balancer + Auto Scaling Group Module

This repository demonstrates a fully modular infrastructure-as-code project using **Terraform** and **AWS**. It provisions a highly available, scalable architecture including:

- Custom VPC with public subnets across multiple Availability Zones
- Application Load Balancer (ALB)
- Auto Scaling Group (ASG) with Launch Template
- User data for EC2 bootstrapping
- Security groups and routing setup
- Clean module separation for compute and networking

---

## 📁 Project Structure

terraform-vpc-module/
├── modules/
│ ├── lb-asg/ # Load Balancer, Auto Scaling Group, Launch Template
│ └── vpc/ # VPC, subnets, IGW, route tables
├── main.tf # Module composition
├── variables.tf
├── outputs.tf
├── terraform.tfvars # Optional for user-defined variables
├── README.md


---

## ✨ Features

- Multi-AZ public subnets (1 per AZ)
- ALB forwarding HTTP traffic to EC2 instances via Target Group
- Auto Scaling Group that scales based on desired configuration
- Launch Template with user data support
- Security groups scoped to LB and EC2 for safe access
- Reusable modules to support infrastructure scale

---

## 🛠️ Usage

### 1. Clone the repository

git clone https://github.com/KyleH-tech/lb-asg-module.git

###2. Configure your variables
You can edit terraform.tfvars or define values at runtime:

aws_region        = "us-east-1"
local_ip          = "YOUR_PUBLIC_IP"
⚠️ Replace YOUR_PUBLIC_IP with your actual IP to allow SSH or HTTP access if needed

###3. Add user-data to the asg launch template. Code I used that had no errors for me:
#!/bin/bash
# Use this for your user data (script from top to bottom)
# install httpd (Linux 2 version)
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html


📦 Module Inputs
Module: network
| Name                 | Type     | Description                             |
| -------------------- | -------- | --------------------------------------- |
| `aws_region`         | `string` | AWS region to deploy to                 |
| `availability_zones` | `list`   | List of AZs (e.g. `["us-east-1a",...]`) |
| `local_ip`           | `string` | IP to allow inbound traffic from        |

Module: compute
| Name                 | Type           | Description                       |
| -------------------- | -------------- | --------------------------------- |
| `aws_region`         | `string`       | AWS region to deploy to           |
| `vpc_id`             | `string`       | VPC ID from network module        |
| `public_subnet_ids`  | `list(string)` | Subnets to place ASG/ALB          |
| `availability_zones` | `list`         | AZs for load balancing + scaling  |
| `local_ip`           | `string`       | Your IP for optional restrictions |


📤 Outputs
vpc_id – The ID of the created VPC
public_subnet_ids – List of public subnet IDs
set_region – AWS region used

✍️ Author Notes
This repository was created as part of a personal DevOps learning journey and professional demonstration. It showcases real-world infrastructure concepts including load balancing, high availability, scaling, and Terraform modularization.

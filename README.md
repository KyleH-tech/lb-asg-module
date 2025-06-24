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

terraform-vpc-module/</br>
├── modules/</br>
│ ├── lb-asg/ # Load Balancer, Auto Scaling Group, Launch Template</br>
│ └── vpc/ # VPC, subnets, IGW, route tables</br>
├── main.tf # Module composition</br>
├── variables.tf</br>
├── outputs.tf</br>
├── terraform.tfvars # Optional for user-defined variables</br>
├── README.md</br>


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

aws_region        = "us-east-1"</br>
local_ip          = "YOUR_PUBLIC_IP"</br>
⚠️ Replace YOUR_PUBLIC_IP with your actual IP to allow SSH or HTTP access if needed

###3. Add user-data to the asg launch template. Code I used that had no errors for me:</br>
#!/bin/bash </br>
#Use this for you ec2 user data (from top to bottom)</br>
#install httpd (Linux 2 version)</br>
yum update -y</br>
yum install -y httpd</br>
systemctl start httpd</br>
systemctl enable httpd</br>
echo "Hello World from $(hostname -f)" > /var/www/html/index.html</br>


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

<h1>Side note: please review example folder for help</h1>

# lb-asg-module + VPC module

A modular Terraform project that deploys a scalable and highly available infrastructure on AWS, including:

- Custom VPC with public subnets
- Application Load Balancer (ALB)
- Auto Scaling Group (ASG) with EC2 instances
- Launch Template with user data
- Configurable security groups

This module is designed for simplicity, reusability, and demonstration of real-world infrastructure patterns using Terraform on AWS.

---

## 📦 Module Structure

```bash
terraform-vpc-module/
├── modules/
│   ├── network/             # VPC, subnets, route tables
│   └── lb-asg/              # ALB, ASG, Launch Template
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── README.md


🚀 Features
Creates a custom VPC across 3 Availability Zones

Deploys EC2 instances via Auto Scaling Group using a Launch Template

Routes traffic through an Application Load Balancer (ALB)

Associates ALB Target Group with the ASG

All resources are modular and parameterized

🛠️ Usage
1. Clone the repository
git clone https://github.com/<your-username>/terraform-vpc-module.git
cd terraform-vpc-module

🔐 Security Groups
ALB SG allows inbound HTTP (port 80) from anywhere
EC2 SG allows HTTP traffic only from ALB SG
Egress rules allow outbound internet traffic (optional)

🧠 Author Notes
This project showcases:

Multi-AZ deployment
Load-balanced and autoscaled infrastructure
Terraform modules and reusable architecture
It is intended for learning, interviews, and demonstration purposes. Production-grade deployments should integrate private subnets, NAT gateways, HTTPS, and monitoring.

resource "aws_security_group" "sg_instance" {
  name = "asg-terraform-sg"
  vpc_id = var.vpc_id
  
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = [ aws_security_group.sg_lb.id ]
  }
  egress {
    to_port = 0
    from_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  tags = {
    "Name" = "EC2 Security Group"
  }
}
resource "aws_security_group" "sg_lb" {
  name = "lb-terraform-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  tags = {
    "Name" = "Loadbalancer Security Group"
  }
}

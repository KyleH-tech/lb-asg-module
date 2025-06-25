resource "aws_launch_template" "launch_config" {
  name = "terraform_ASG"
  image_id = "ami-0f3f13f145e66a0a3"
  instance_type = "t2.micro"
  user_data = base64encode(file(""))
  vpc_security_group_ids = [aws_security_group.sg_instance.id]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg" {

  vpc_zone_identifier = var.public_subnet_ids
  desired_capacity = 3
  max_size = 6
  min_size = 1

  launch_template {
    id = aws_launch_template.launch_config.id
    version = "$Latest"
  }

  
}

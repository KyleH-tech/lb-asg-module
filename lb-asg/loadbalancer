resource "aws_lb" "lb" {
  
  name = "test-lb-tf"
  load_balancer_type = "application"
  subnets = var.public_subnet_ids
  security_groups = [ aws_security_group.sg_lb.id ]

  tags = {
    "Name" = "load-balancer"
  }
}
resource "aws_lb_listener" "lb_listener" {

  load_balancer_arn = aws_lb.lb.arn
  port = "80"
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.lb_target_group.arn
  }
}
resource "aws_lb_target_group" "lb_target_group" {
 name = "learning-asg-lb"
 protocol = "HTTP"
 port = 80
 vpc_id = var.vpc_id
}
resource "aws_autoscaling_attachment" "app" {


  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn = aws_lb_target_group.lb_target_group.arn
}

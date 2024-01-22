resource "aws_lb" "alb" {
  name               = "iac-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = var.subnets
}

resource "aws_lb_listener" "iac-listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-group.arn
  }
}

resource "aws_lb_target_group" "alb-group" {
  name     = "iac-alb-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

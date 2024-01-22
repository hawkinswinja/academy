resource "aws_launch_template" "template" {
  name_prefix   = "iac-template"
  image_id      = var.ami
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]
  user_data = filebase64("${path.module}/script.sh")
}

resource "aws_autoscaling_group" "asg" {
  vpc_zone_identifier = var.subnets
  max_size           = 5
  min_size           = 1
  health_check_type    = "ELB"

  launch_template {
    id      = aws_launch_template.template.id
    version = "$Latest"
  }

  lifecycle { 
    ignore_changes = [target_group_arns]
  }

  tag {
    key                 = "Name"
    value               = "iac-asg"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "desired" {
  for_each = {
    decrease = var.asg-decrease
    increase = var.asg-increase
  }
  name                   = "asg-policy-${each.key}"
  scaling_adjustment     = each.value
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.asg.name
}

resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.asg.name
  lb_target_group_arn   = aws_lb_target_group.alb-group.arn
}

resource "aws_cloudwatch_metric_alarm" "scaling" {
  for_each = {
    decrease = {
      operator = "LessThanOrEqualToThreshold"
      threshold = "10"
    }
    increase = {
      operator = "GreaterThanOrEqualToThreshold"
      threshold = "85"
    }
  }
  alarm_description   = "Monitors CPU utilization for iac ASG"
  alarm_actions       = [aws_autoscaling_policy.desired[each.key].arn]
  alarm_name          = "asg-scaling-${each.key}"
  comparison_operator = each.value["operator"]
  namespace           = "AWS/EC2"
  metric_name         = "CPUUtilization"
  threshold           = each.value["threshold"]
  evaluation_periods  = "2"
  period              = "120"
  statistic           = "Average"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg.name
  }
}

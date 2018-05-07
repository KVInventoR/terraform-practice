resource "aws_autoscaling_policy" "cpu-policy" {
  name                   = "cpu-policy"
  autoscaling_group_name = "${module.asg.this_autoscaling_group_id}"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "cpu-alarm" {
  alarm_name          = "cpu-alarm"
  alarm_description   = "cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "30"

  dimensions = {
    "AutoScalingGroupName" = "${module.asg.this_autoscaling_group_name}"
  }

  alarm_actions   = ["${aws_autoscaling_policy.cpu-policy.arn}"]
  actions_enabled = true
}

resource "aws_autoscaling_policy" "cpu-policy-scaledown" {
  name                   = "cpu-policy-scaledown"
  autoscaling_group_name = "${module.asg.this_autoscaling_group_name}"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "-1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "cpu-alarm-scaledown" {
  alarm_name          = "cpu-alarm-scaledown"
  alarm_description   = "cpu-alarm-scaledown"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "5"

  dimensions = {
    "AutoScalingGroupName" = "${module.asg.this_autoscaling_group_name}"
  }

  alarm_actions   = ["${aws_autoscaling_policy.cpu-policy-scaledown.arn}"]
  actions_enabled = true
}

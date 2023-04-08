####### cloud_watch publico c

resource "aws_cloudwatch_metric_alarm" "cpu_alarm_up_publico" {
  alarm_name          = "cpu_servers_up"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "85"

  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.pfsense_firewall.name
  }

  alarm_description = "Alarm CPU"
  alarm_actions     = [aws_autoscaling_policy.policy_up_publico.arn]
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm_down_publico" {
  alarm_name          = "cpu_servers_down"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "50"

  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.pfsense_firewall.name
  }

  alarm_description = "Alarm CPU"
  alarm_actions     = [aws_autoscaling_policy.policy_down_publico.arn]
}

####### cloud_watch privado #######

resource "aws_cloudwatch_metric_alarm" "cpu_alarm_up_privado" {
  alarm_name          = "cpu_servers_up"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "85"

  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.servidores_internos.name
  }

  alarm_description = "Alarm CPU"
  alarm_actions     = [aws_autoscaling_policy.policy_up_privado.arn]
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm_down_privado" {
  alarm_name          = "cpu_servers_down"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "50"

  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.servidores_internos.name
  }

  alarm_description = "Alarm CPU"
  alarm_actions     = [aws_autoscaling_policy.policy_down_privado.arn]
}

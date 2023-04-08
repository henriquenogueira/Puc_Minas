resource "aws_launch_template" "servers" {
  name = var.launch_template_name_firewall

  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size = 10
    }
  }

  disable_api_stop = true

  disable_api_termination = true

  ebs_optimized = true

  image_id = var.ami

  instance_initiated_shutdown_behavior = "terminate"

  instance_type = var.instance_type

  key_name = aws_key_pair.generated_key.key_name

  monitoring {
    enabled = true
  }

  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "pfsense_firewall"
    }
  }
  depends_on = [
    aws_instance.pfsense_firewall
  ]
}

resource "aws_autoscaling_group" "pfsense_firewall" {
  name                = var.autoscalling_servers_publicos
  vpc_zone_identifier = [aws_subnet.publica_1.id, aws_subnet.publica_2.id,aws_subnet.publica_3.id]
  desired_capacity    = 1
  max_size            = 4
  min_size            = 1

  launch_template {
    id      = aws_launch_template.servers.id
    version = "$Latest"
  }

  depends_on = [
    aws_launch_template.servers
  ]
}

resource "aws_autoscaling_attachment" "alb_attachment_publico" {
  autoscaling_group_name = aws_autoscaling_group.pfsense_firewall.id
  lb_target_group_arn    = aws_lb_target_group.pfsense.arn
  depends_on = [
    aws_lb.lb_publico
  ]
}

resource "aws_autoscaling_policy" "policy_up_publico" {
  name                   = var.policy_up_name
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.pfsense_firewall.name
  cooldown               = 100
}

resource "aws_autoscaling_policy" "policy_down_publico" {
  name                   = var.policy_down_name
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.pfsense_firewall.name
  cooldown               = 100
}
resource "aws_launch_template" "servers_privados" {
  name = var.launch_template_name_servidores_internos

  block_device_mappings {
    device_name = var.device_name

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
    resource_type = var.resource_type

    tags = {
      Name = "servidores_internos"
    }
  }
}

resource "aws_autoscaling_group" "servidores_internos" {
  name                = var.autoscalling_servers_names[0]
  vpc_zone_identifier = [aws_subnet.privada_1.id, aws_subnet.privada_2.id]
  desired_capacity    = 1
  max_size            = 4
  min_size            = 1

  launch_template {
    id      = aws_launch_template.servers_privados.id
    version = "$Latest"
  }

  depends_on = [
    aws_launch_template.servers_privados
  ]
}

resource "aws_autoscaling_attachment" "alb_attachment" {
  autoscaling_group_name = aws_autoscaling_group.servidores_internos.id
  lb_target_group_arn    = aws_lb_target_group.servers_privados.arn
  depends_on = [
    aws_lb.lb_privado
  ]
}

resource "aws_autoscaling_policy" "policy_up_privado" {
  name                   = var.policy_up_name
  scaling_adjustment     = 1
  adjustment_type        = var.adjustment_type
  autoscaling_group_name = aws_autoscaling_group.servidores_internos.name
  cooldown               = 100
}

resource "aws_autoscaling_policy" "policy_down_privado" {
  name                   = var.policy_down_name
  scaling_adjustment     = 1
  adjustment_type        = var.adjustment_type
  autoscaling_group_name = aws_autoscaling_group.servidores_internos.name
  cooldown               = 100
}
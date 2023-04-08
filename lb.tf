#### LoadBalancer Publico ####

resource "aws_lb" "lb_publico" {
  name               = var.lb_name_publico
  internal           = false
  load_balancer_type = var.type_lb
  security_groups    = [aws_security_group.allow_tls.id]
  subnets            = [aws_subnet.publica_1.id, aws_subnet.publica_2.id, aws_subnet.publica_3.id]

  enable_deletion_protection = false
  depends_on = [
    aws_subnet.publica_1, aws_subnet.publica_2, aws_subnet.publica_3
  ]
}

resource "aws_lb_listener" "server_public" {
  load_balancer_arn = aws_lb.lb_publico.arn
  port              = var.https_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.pfsense.arn
  }
}

resource "aws_lb_target_group" "pfsense" {
  name     = "pfsense-tg"
  port     = var.https_port
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb_target_group_attachment" "tg_attach" {
  target_group_arn = aws_lb_target_group.pfsense.arn
  target_id        = aws_instance.pfsense_firewall.id
  port             = var.https_port

  depends_on = [
    aws_lb_listener.server_public
  ]
}

#### LoadBalancer Privado ####


resource "aws_lb" "lb_privado" {
  name               = var.lb_name_privado
  internal           = true
  load_balancer_type = var.type_lb
  security_groups    = [aws_security_group.allow_tls.id]
  subnets            = [aws_subnet.privada_1.id, aws_subnet.privada_2.id, aws_subnet.privada_3.id]

  enable_deletion_protection = false
  depends_on = [
    aws_subnet.privada_1, aws_subnet.privada_2, aws_subnet.privada_3
  ]
}

resource "aws_lb_listener" "privado" {
  load_balancer_arn = aws_lb.lb_privado.arn
  port              = var.https_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.servers_privados.arn
  }
}

resource "aws_lb_target_group" "servers_privados" {
  name     = var.target_group_privado_name
  port     = var.https_port
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}
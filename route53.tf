resource "aws_route53_zone" "prod" {
  name = var.domain_name

  tags = {
    Environment = "prod"
  }
}

resource "aws_route53_record" "prod-ns" {
  zone_id = aws_route53_zone.prod.zone_id
  name    = "vpn"
  type    = "NS"
  ttl     = "30"
  records = [aws_lb.lb_publico.dns_name]
}
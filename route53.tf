resource "aws_route53_zone" "prod" {
  name = "meu.examplo.com"

  tags = {
    Environment = "prod"
  }
}

resource "aws_route53_record" "prod-ns" {
  zone_id = aws_route53_zone.prod.zone_id
  name    = "vpn.examplo"
  type    = "NS"
  ttl     = "30"
  records = ["12.25.36.90"]
}
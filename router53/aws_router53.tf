data "aws_route53_zone" "main" {
  name = var.router53zone
}

resource "aws_route53_record" "main" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "t1.kusoc.com."
  type    = "NS"
  ttl     = 300
  records = var.huawednsnameservers
}
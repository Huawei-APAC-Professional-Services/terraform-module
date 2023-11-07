resource "huaweicloud_dns_zone" "main" {
  name      = aws_route53_record.main.name
  ttl       = 3000
  zone_type = "public"
}
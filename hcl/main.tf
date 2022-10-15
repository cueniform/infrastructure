resource "aws_route53_zone" "cueniform_com" {
  name = "cueniform.com"
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_route53_record" "www_cueniform_com_A" {
  zone_id = aws_route53_zone.cueniform_com.zone_id
  name    = "www.cueniform.com"
  type    = "A"
  ttl     = 3600
  records = [
    "66.111.4.53",
    "66.111.4.54",
  ]
}

resource "aws_route53_record" "cueniform_com_A" {
  zone_id = aws_route53_zone.cueniform_com.zone_id
  name    = "cueniform.com"
  type    = "A"
  ttl     = 3600
  records = [
    "66.111.4.53",
    "66.111.4.54",
  ]
}

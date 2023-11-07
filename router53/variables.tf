variable "huawednsnameservers" {
  type    = list(string)
  default = ["ns1.huaweicloud-dns.com.", "ns1.huaweicloud-dns.cn.", "ns1.huaweicloud-dns.net.", "ns1.huaweicloud-dns.org."]
}

variable "router53zone" {
  type = string
}
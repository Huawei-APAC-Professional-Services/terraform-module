variable "group_name" {
  type = string
}

variable "ttl_in_days" {
  type    = number
  default = 30
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "streams" {
  type = list(object({
    name        = string
    ttl_in_days = optional(number, null)
    tags        = optional(map(string, {}))
  }))
  default = []
}
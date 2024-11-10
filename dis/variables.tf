variable "name" {
  type = string
}

variable "partitions" {
  type    = number
  default = 2
}

variable "type" {
  type    = string
  default = "COMMON"
}

variable "retention_period" {
  type    = number
  default = 24
}

variable "data_type" {
  type    = string
  default = "BLOB"
}

variable "max_partition_count" {
  type    = number
  default = null
}

variable "min_partition_count" {
  type    = number
  default = null
}

variable "data_schema" {
  type    = string
  default = null
}

variable "compression_format" {
  type    = string
  default = null
}

variable "csv_delimiter" {
  type    = string
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}
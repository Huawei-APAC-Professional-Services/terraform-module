variable "cts_bucket_name" {
  type = string
}

variable "hfa_regions" {
  type = set(string)
}

variable "hfa_cts_regions" {
  type = map(string)
}
variable "users" {
  type = list(object({
    name             = string
    display_name     = string
    family_name      = string
    given_name       = string
    email            = string
    permissionset_id = string
    account_id       = string
  }))
}
## Custom role must be version 1.1, the following one is not json encoded:
#{
#    "Version": "1.1",
#    "Statement": [{
#            "Effect": "Allow",
#            "Action": [
#                "iam:users:listUsers",
#                "iam:users:getUser"
#            ]
#        }
#    ]
#}
# https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/data-sources/identity_role
variable "custom_role" {
  type        = string
  default     = ""
  description = "JSON encoded role policy"
}

# Custom policy must be version 5.0, the following one is not json encoded:
#{
#    "Version": "5.0",
#    "Statement": [{
#            "Effect": "Allow",
#            "Action": [
#                "tms:predefineTags:create",
#                "tms:predefineTags:update",
#                "tms:predefineTags:delete",
#                "tms:resourceTags:create",
#                "tms:resourceTags:delete"
#            ]
#        }
#    ]
#}
variable "custom_policy" {
  type        = string
  default     = ""
  description = "JSON encoded policy"
}

variable "permission_sets" {
  type = list(object({
    name             = string
    session_duration = optional(string, "PT8H")
  }))
}
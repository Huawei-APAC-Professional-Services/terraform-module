variable "name" {
  type = string
}

variable "job_type" {
  type    = string
  default = "sync"
}

variable "db_engine" {
  type    = string
  default = "postgresql"
}

variable "source_db" {
  type = object({
    name               = optional(string, null)
    ip                 = string
    port               = optional(number, 5432)
    user               = string
    password           = string
    instance_id        = optional(string, null)
    vpc_id             = optional(string, null)
    subnet_id          = optional(string, null)
    region             = optional(string, null)
    ssl_enabled        = optional(bool, false)
    ssl_cert_key       = optional(string, null)
    ssl_cert_name      = optional(string, null)
    ssl_cert_check_sum = optional(string, null)
    ssl_cert_password  = optional(string, null)
  })
}

variable "target_db" {
  type = object({
    name               = optional(string, null)
    ip                 = string
    port               = optional(number, 5432)
    user               = string
    password           = string
    instance_id        = optional(string, null)
    vpc_id             = optional(string, null)
    subnet_id          = optional(string, null)
    region             = optional(string, null)
    ssl_enabled        = optional(bool, false)
    ssl_cert_key       = optional(string, null)
    ssl_cert_name      = optional(string, null)
    ssl_cert_check_sum = optional(string, null)
    ssl_cert_password  = optional(string, null)
  })
}

variable "migration_direction" {
  type    = string
  default = "up"
}

variable "network_type" {
  type    = string
  default = "vpn"
}

variable "migration_type" {
  type    = string
  default = "FULL_INCR_TRANS"
}

variable "description" {
  type    = string
  default = ""
}

variable "node_type" {
  type    = string
  default = "medium"
}

variable "tables" {
  type = list(object({
    database    = string
    table_names = list(string)
  }))
  default = []
}

variable "source_database_name" {
  type    = string
  default = null
}

variable "migrate_definer" {
  type    = bool
  default = true
}

variable "limit_speed" {
  type = list(object({
    speed      = string
    start_time = optional(string, null)
    end_time   = optional(string, null)
  }))
  default = []
}

variable "policy_config" {
  type = list(object({
    filter_ddl_policy         = optional(string, null)
    conflict_policy           = optional(string, "overwrite")
    index_trans               = optional(bool, true)
    topic_policy              = optional(string, null)
    topic                     = optional(string, null)
    partition_policy          = optional(string, null)
    kafka_data_format         = optional(string, null)
    topic_name_format         = optional(string, null)
    partitions_num            = optional(string, null)
    replication_factor        = optional(string, null)
    is_fill_materialized_view = optional(bool, false)
    export_snapshot           = optional(bool, false)
    slot_name                 = optional(string, null)
    file_and_position         = optional(string, null)
    gtid_set                  = optional(string, null)
  }))
  default = []
}

variable "job_action" {
  type    = string
  default = "start"
}


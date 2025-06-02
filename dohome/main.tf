terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = ">= 1.60.0"
    }
  }
}

module "postgresql_db_migration" {
  for_each = toset(["world_happiness", "titanic"])
  source   = "../drs"
  name     = each.value
  source_db = {
    name     = "ecspg"
    ip       = "10.10.1.33"
    user     = "postgres"
    password = "password"

  }
  target_db = {
    name        = "rds-dohome"
    ip          = "10.10.1.73"
    user        = "root"
    password    = "Pass@w0rd"
    region      = "southeast-3"
    vpc_id      = "b7eba8b6-0b69-4922-9fc6-0f0007d0a86e"
    subnet_id   = "65061bf0-269d-4742-869a-1fdd960fd226"
    instance_id = "70faf3d9ecee457da275c232128c6ffbin03"
  }
  policy_config = [{
    filter_ddl_policy = "drop_database"
    conflict_policy   = "overwrite"
    index_trans       = true
  }]
  source_database_name = each.value
}
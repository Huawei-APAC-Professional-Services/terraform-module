resource "huaweicloud_drs_job" "this" {
  name                    = var.name
  type                    = var.job_type
  engine_type             = var.db_engine
  direction               = var.migration_direction
  net_type                = var.network_type
  migration_type          = var.migration_type
  description             = var.description
  migrate_definer         = var.migrate_definer
  destination_db_readnoly = "true"

  node_type = var.node_type
  action    = var.job_action

  source_db {
    name        = var.source_db.name
    engine_type = var.db_engine
    ip          = var.source_db.ip
    port        = var.source_db.port
    user        = var.source_db.user
    password    = var.source_db.password
    instance_id = var.source_db.instance_id
    vpc_id      = var.source_db.vpc_id
    subnet_id   = var.source_db.subnet_id
    region      = var.source_db.region
    ssl_enabled = var.source_db.ssl_enabled
  }

  destination_db {
    name        = var.target_db.name
    engine_type = var.db_engine
    ip          = var.target_db.ip
    port        = var.target_db.port
    user        = var.target_db.user
    password    = var.target_db.password
    instance_id = var.target_db.instance_id
    vpc_id      = var.target_db.vpc_id
    subnet_id   = var.target_db.subnet_id
    region      = var.target_db.region
    ssl_enabled = var.target_db.ssl_enabled
  }

  dynamic "tables" {
    for_each = var.tables
    content {
      database    = tables.value.database
      table_names = tables.value.table_names
    }
  }

  databases = var.source_database_name == null ? null : [var.source_database_name]

  dynamic "limit_speed" {
    for_each = var.limit_speed
    content {
      speed      = limit_speed.value["speed"]
      start_time = limit_speed.value["start_time"]
      end_time   = limit_speed.value["end_time"]
    }
  }

  dynamic "policy_config" {
    for_each = var.policy_config
    content {
      filter_ddl_policy         = policy_config.value.filter_ddl_policy
      conflict_policy           = policy_config.value.conflict_policy
      index_trans               = policy_config.value.index_trans
      topic_policy              = policy_config.value.topic_policy
      topic                     = policy_config.value.topic
      partition_policy          = policy_config.value.partition_policy
      kafka_data_format         = policy_config.value.kafka_data_format
      topic_name_format         = policy_config.value.topic_name_format
      partitions_num            = policy_config.value.partitions_num
      replication_factor        = policy_config.value.replication_factor
      is_fill_materialized_view = policy_config.value.is_fill_materialized_view
      export_snapshot           = policy_config.value.export_snapshot
      slot_name                 = policy_config.value.slot_name
      file_and_position         = policy_config.value.file_and_position
      gtid_set                  = policy_config.value.gtid_set
    }
  }
}
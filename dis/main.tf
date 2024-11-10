resource "huaweicloud_dis_stream" "this" {
  stream_name                    = var.name
  partition_count                = var.partitions
  stream_type                    = var.type
  retention_period               = var.retention_period
  data_type                      = var.data_type
  auto_scale_max_partition_count = var.max_partition_count
  auto_scale_min_partition_count = var.min_partition_count
  data_schema                    = var.data_schema
  compression_format             = var.compression_format
  csv_delimiter                  = var.csv_delimiter
  tags                           = var.tags
}
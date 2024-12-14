resource "huaweicloud_identity_agency" "rms_tracker_agency" {
  delegated_service_name = "op_svc_eps"
  description            = "Created by HFA. To ensure that services run properly, do not delete this agency."
  duration               = "FOREVER"
  name                   = "rms_tracker_agency"

  all_resources_roles = ["OBS OperateAccess", "SMN Administrator", "KMS Administrator"]

  lifecycle {
    ignore_changes = [
      description
    ]
  }
}

resource "huaweicloud_rms_resource_recorder" "this" {
  agency_name = huaweicloud_identity_agency.rms_tracker_agency.name

  selector {
    all_supported  = var.config_collect_all_supported_resource
    resource_types = var.config_collect_specific_resources
  }

  dynamic "obs_channel" {
    for_each = var.obs_channel
    content {
      bucket = obs_channel.value["bucket"]
      region = obs_channel.value["region"]
    }
  }

  dynamic "smn_channel" {
    for_each = var.smn_channel
    content {
      topic_urn = smn_channel.value["smn_urn"]
      region    = smn_channel.value["region"]
    }
  }
}
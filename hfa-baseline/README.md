# Huawei Cloud Foundation Architecture Baseline Module

## Usage
`Config Aggregation Account`  

```hcl
module "hfa_security_account_baseline" {
  source                           = "github.com/Huawei-APAC-Professional-Services/terraform-module/hfa-baseline"
  hfa_config_member_account_ids    = ["accund_id_1","accound_id_2"]
  hfa_config_aggregator_account_id = "account_id_3"
  hfa_cts_regions_obs_config       = {"ap-southeast-1":"ctsbucket1","ap-southeast-2":"ctsbuckt2"}
  hfa_config_bucket_region         = "ap-southeast-1"
  hfa_config_bucket_name           = "config-bucket"
  hfa_config_smn_topic             = zipmap(["ap-southeast-1"], ["topic_urn"])
}
``` 

`Normal Account` 
```hcl
module "hfa_security_account_baseline" {
  source                           = "github.com/Huawei-APAC-Professional-Services/terraform-module/hfa-baseline"
  hfa_config_aggregator_account_id = "account_id_3"
  hfa_cts_regions_obs_config       = {"ap-southeast-1":"ctsbucket1","ap-southeast-2":"ctsbuckt2"}
  hfa_config_bucket_region         = "ap-southeast-1"
  hfa_config_bucket_name           = "config-bucket"
  hfa_config_smn_topic             = zipmap(["ap-southeast-1"], ["topic_urn"])
}
``` 
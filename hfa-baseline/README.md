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

## Config Rules (20 builtins as of Nov 2023)
| Rule Name                                   | Type    | Scope      | Status  | Comments           |
|---------------------------------------------|---------|------------|---------|--------------------|
| access-keys-rotated                         | builtin | IAM-All    | Enabled | 90 days by default |
| iam-group-has-users-check                   | builtin | IAM-All    | Enabled |                    |
| iam-root-access-key-check                   | builtin | IAM-All    | Enabled |                    |
| iam-user-mfa-enabled                        | builtin | IAM-All    | Enabled |                    |
| iam-user-single-access-key                  | builtin | IAM-All    | Enabled |                    |
| mfa-enabled-for-iam-console-access          | builtin | IAM-All    | Enabled |                    |
| root-account-mfa-enabled                    | builtin | IAM-All    | Enabled |                    |
| iam-user-console-and-api-access-at-creation | builtin | IAM-All    | Enabled |                    |
| cts-support-validate-check                  | builtin | CTS-All    | Enabled |                    |
| cts-tracker-exists                          | builtin | CTS-All    | Enabled |                    |
| cts-kms-encrypted-check                     | builtin | CTS-All    | Enabled |                    |
| multi-region-cts-tracker-exists             | builtin | CTS-All    | Enabled |                    |
| resources-in-supported-region               | builtin | All-All    | Enabled |                    |
| kms-not-scheduled-for-deletion              | builtin | KMS-All    | Enabled |                    |
| tracker-config-enabled-check                | builtin | Config-All | Enabled |                    |
| ecs-instance-key-pair-login                 | builtin | ECS-All    | Enabled |                    |
| ecs-instance-no-public-ip                   | builtin | ECS-All    | Enabled |                    |
| ecs-multiple-public-ip-check                | builtin | ECS-All    | Enabled |                    |
| volume-unused-check                         | builtin | ECS-All    | Enabled |                    |
| volumes-encrypted-check                     | builtin | ECS-All    | Enabled |                    |



## CIS Cloud Benchmark equivalent on Huawei Cloud

<details>

<summary>Identity and Access Management</summary>

This section contains recommendations for configuring identity and access management related options.

### Maintain contact details(Manual)

Ensure contact email and mobile details for Huawei Cloud accounts are are current and map to more than one individual in your organization.

Change Notification: []


</details>
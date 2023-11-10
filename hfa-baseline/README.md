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

## Config Rules (25 builtins as of Nov 2023)
| Rule Name                                   | Type    | Scope  | Status  | Comments           |
|---------------------------------------------|---------|--------|---------|--------------------|
| access-keys-rotated                         | builtin | IAM    | Enabled | 90 days by default |
| iam-group-has-users-check                   | builtin | IAM    | Enabled |                    |
| iam-root-access-key-check                   | builtin | IAM    | Enabled |                    |
| iam-user-mfa-enabled                        | builtin | IAM    | Enabled |                    |
| iam-user-single-access-key                  | builtin | IAM    | Enabled |                    |
| mfa-enabled-for-iam-console-access          | builtin | IAM    | Enabled |                    |
| root-account-mfa-enabled                    | builtin | IAM    | Enabled |                    |
| iam-user-console-and-api-access-at-creation | builtin | IAM    | Enabled |                    |
| iam-password-policy                         | builtin | IAM    | Enabled | Strong             |
| iam-role-has-all-permissions                | builtin | IAM    | Enabled |                    |
| cts-support-validate-check                  | builtin | CTS    | Enabled |                    |
| cts-tracker-exists                          | builtin | CTS    | Enabled |                    |
| cts-kms-encrypted-check                     | builtin | CTS    | Enabled |                    |
| multi-region-cts-tracker-exists             | builtin | CTS    | Enabled |                    |
| resources-in-supported-region               | builtin | All    | Enabled |                    |
| kms-not-scheduled-for-deletion              | builtin | KMS    | Enabled |                    |
| tracker-config-enabled-check                | builtin | Config | Enabled |                    |
| ecs-instance-key-pair-login                 | builtin | ECS    | Enabled |                    |
| ecs-instance-no-public-ip                   | builtin | ECS    | Enabled |                    |
| ecs-multiple-public-ip-check                | builtin | ECS    | Enabled |                    |
| volume-unused-check                         | builtin | ECS    | Enabled |                    |
| volumes-encrypted-check                     | builtin | ECS    | Enabled |                    |
| vpc-acl-unused-check                        | builtin | VPC    | Enabled |                    |
| vpc-sg-restricted-ssh                       | builtin | VPC    | Enabled |                    |
| vpc-default-sg-closed                       | builtin | VPC    | Enabled |                    |

## CIS Cloud Benchmark equivalent on Huawei Cloud

<details>

<summary>1. Identity and Access Management</summary>

This section contains recommendations for configuring identity and access management related options.

- [ ]  1.1 Maintain contact details [`Config`: :x:] [`CTS Key Events Notifications`: :x:] [`Automated`: :x:] 
       :bangbang: **Change Event is captured by CTS but not supported by Key Event Notifications and Config**
- [ ]  1.2 Ensure no 'root' user account access key exists [`Config`: :x:] [`CTS Key Events Notifications`: :white_check_mark:] [`Automated`: :x:] 
- [x]  1.3 Ensure MFA is enabled for the 'root' user account [`Config`: :white_check_mark:] [`CTS Key Events Notifications`: :white_check_mark:] [`Automated`: :x:]
- [ ]  1.4 Eliminate use of the 'root' user for administrative and daily tasks [`Config`: :x:] [`CTS Key Events Notifications`: :white_check_mark:] [`Automated`: :x:]
- [x]  1.5 Ensure IAM password policy requires strong password or minimum length of 14 or greater [`Config`: :white_check_mark:] [`CTS Key Events Notifications`: :white_check_mark:] [`Automated`: :white_check_mark:]
- [ ]  1.6 Ensure IAM password policy prevents password reuse [`Config`: :x:] [`CTS Key Events Notifications`: :white_check_mark:] [`Automated`: :white_check_mark:] [`Automated`: :x:]
- [x]  1.7 Ensure multi-factor authentication (MFA) is enabled for all IAM users that have a console password [`Config`: :white_check_mark:] [`CTS Key Events Notifications`: :white_check_mark:] [`Automated`: :x:]
- [ ]  1.8 Do not setup access keys during initial user setup for all IAM users that have a console password [`Config`: :white_check_mark:] [`CTS Key Events Notifications`: :x:] [`Automated`: :x:]
- [ ]  1.9 Ensure credentials unused for 45 days or greater are disabled [`Config`: :x:] [`CTS Key Events Notifications`: :x:] [`Automated`: :x:]
- [ ]  1.10 Ensure there is only one active access key available for any single IAM user with console access [`Config`: :white_check_mark:] [`CTS Key Events Notifications`: :x:] [`Automated`: :x:]
- [ ]  1.11 Ensure access keys are rotated every 90 days or less [`Config`: :white_check_mark:] [`CTS Key Events Notifications`: :x:] [`Automated`: :x:]
- [ ]  1.12 Ensure IAM Users Receive Permissions Only Through Groups [`Config`: :x:] [`CTS Key Events Notifications`: :x:] [`Automated`: :x:]
- [ ]  1.13 Ensure IAM policies that allow full "*:*" administrative privileges are not attached [`Config`: :white_check_mark:] [`CTS Key Events Notifications`: :x:] [`Automated`: :x:]
- [x] 1.14 Ensure hardware MFA is enabled for the 'root' user account [`Config`: :white_check_mark:] [`CTS Key Events Notifications`: :white_check_mark:] [`Automated`: :x:]
- [ ]  1.15 Ensure IAM users are managed centrally via identity federation or AWS Organizations for multi-account environments [`Config`: :x:] [`CTS Key Events Notifications`: :x:] [`Automated`: :x:]
</details>

<details>

<summary>Storage</summary>

### Ensure MFA Delete is enabled on OBS buckets
### Ensure that OBS Buckets are configured with 'Block public access (bucket settings)'

</details>

<details>

<summary>ECS</summary>

### Ensure EBS Volume Encryption is Enabled in all Regions

Change Notification: 
  - [x] Config Notification

### Ensure that OBS Buckets are configured with 'Block public access (bucket settings)'

</details>

<details>
<summary>Database</summary>

### Ensure that encryption-at-rest is enabled for RDS Instances

### Ensure Auto Minor Version Upgrade feature is Enabled for RDS Instances

### Ensure that public access is not given to RDS Instance

### 

</details>

<details>
<summary>SFS</summary>

### Ensure that encryption is enabled for SFS file systems

### Ensure Auto Minor Version Upgrade feature is Enabled for RDS Instances

### Ensure that public access is not given to RDS Instance

### 

</details>

<details>
<summary>SFS</summary>

### Ensure CTS is enabled in all regions

### Ensure CTS log file validation is enabled

### Ensure the OBS bucket used to store CTS logs is not publicly accessible
### Ensure CloudTrail trails are integrated with LTS
### Ensure Config is enabled in all regions

### Ensure OBS bucket access logging is enabled on the CTS OBS bucket

### Ensure CTSlogs are encrypted at rest using KMS CMKs

### Ensure rotation for customer created symmetric CMKs is enabled

### Ensure VPC flow logging is enabled in all VPCs

### Ensure that Object-level logging for write events is enabled for OBS bucket
### Ensure that Object-level logging for read events is enabled for OBS bucket

</details>

<details>
<summary>Monitoring</summary>

### Ensure unauthorized API calls are monitored

### Ensure management console sign-in without MFA is monitored

### Ensure usage of 'root' account is monitored

Change Notification: 
  - [x] CTS SMN Notification

### Ensure IAM policy changes are monitored

Change Notification: 
  - [x] CTS SMN Notification

### Ensure CTS configuration changes are monitored

Change Notification: 
  - [x] CTS SMN Notification

### Ensure Huawei Cloud Management Console authentication failures are monitored
### Ensure disabling or scheduled deletion of customer created CMKs is monitored

Change Notification: 
  - [x] CTS SMN Notification

### Ensure OBS bucket policy changes are monitored

Change Notification: 
  - [x] CTS SMN Notification

### Ensure Config configuration changes are monitored

Change Notification: 
  - [x] CTS SMN Notification

### Ensure security group changes are monitored

Change Notification: 
  - [x] CTS SMN Notification

### Ensure Network Access Control Lists (NACL) changes are monitored

Change Notification: 
  - [x] CTS SMN Notification

### Ensure route table changes are monitored

Change Notification: 
  - [x] CTS SMN Notification

### Ensure VPC changes are monitored

Change Notification: 
  - [x] CTS SMN Notification

### Ensure Organizations changes are monitored

Change Notification: 
  - [x] CTS SMN Notification

</details>

<details>
<summary>Networking</summary>

### Ensure no Network ACLs allow ingress from 0.0.0.0/0 to remote server administration ports

### Ensure no security groups allow ingress from 0.0.0.0/0 to remote server administration ports

### Ensure no security groups allow ingress from ::/0 to remote server administration ports

### Ensure the default security group of every VPC restricts all traffic

</details>
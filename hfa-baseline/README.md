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
| iam-password-policy                         | builtin | IAM    | Enabled | Strong by default  |
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
| vpc-flow-logs-enabled                       | builtin | VPC    | Enabled |                    |
| rds-instance-no-public-ip                   | builtin | RDS    | Enabled |                    |
| rds-instances-enable-kms                    | builtin | RDS    | Enabled |                    |
| rds-instance-enable-backup                  | builtin | RDS    | Enabled |                    |

## CIS Cloud Benchmark equivalent on Huawei Cloud

Legend:

:white_check_mark: Capability of builtin policy

:ballot_box_with_check: Capability of customized policy

:x: Unabled to detect compliance status

- [x] Relevant Settings are set during HFA implementation if applicable
- [ ] Cannot implement the recommendation through configurations

<details>

<summary>1. Identity and Access Management</summary>

This section contains recommendations for configuring identity and access management related options.

- [ ]  1.1 Maintain account contact details [`Config`: :x:]
:bangbang: **Change Event is captured by CTS but not supported by Key Event Notifications and Config**
- [ ]  1.2 Ensure no 'root' user account access key exists [`Config`: :ballot_box_with_check:]
- [ ]  1.3 Ensure MFA is enabled for the 'root' user account [`Config`: :white_check_mark:]
- [ ]  1.4 Eliminate use of the 'root' user for administrative and daily tasks [`Config`: :ballot_box_with_check:]
- [x]  1.5 Ensure IAM password policy requires strong password or minimum length of 14 or greater [`Config`: :white_check_mark:]
- [x]  1.6 Ensure IAM password policy prevents password reuse [`Config`: :ballot_box_with_check:]
- [ ]  1.7 Ensure multi-factor authentication (MFA) is enabled for all IAM users that have a console password [`Config`: :white_check_mark:]
- [ ]  1.8 Do not setup access keys during initial user setup for all IAM users that have a console password [`Config`: :white_check_mark:]
- [ ]  1.9 Ensure credentials unused for 45 days or greater are disabled [`Config`: :white_check_mark:]
- [ ]  1.10 Ensure there is only one active access key available for any single IAM user with console access [`Config`: :white_check_mark:]
- [ ]  1.11 Ensure access keys are rotated every 90 days or less [`Config`: :white_check_mark:]
- [x]  1.12 Ensure IAM Users Receive Permissions Only Through Groups [`Config`: :x:]
            :information_source: **Enterprise Project Management Service diabled**
- [ ]  1.13 Ensure IAM policies that allow full "*:*" administrative privileges are not attached [`Config`: :white_check_mark:]
- [ ]  1.14 Ensure hardware MFA is enabled for the 'root' user account [`Config`: :white_check_mark:]
- [ ]  1.15 Ensure IAM users are managed centrally via identity federation or Huawei Identity Center for multi-account environments [`Config`: :x:]
</details>

<details>

<summary>2. Storage</summary>

This section contains recommendations for storage related services.

- [x]  2.1 Ensure MFA Delete is enabled on OBS buckets [`Config`: :x:]
           :information_source: **Critial Operation Protection enabled**
- [ ]  2.2 Ensure that OBS Buckets are not public accessible [`Config`: :x:]
- [ ]  2.3 Ensure that encryption is enabled for SFS file systems [`Config`: :x:]
- [ ]  2.1 Ensure EBS Volume Encryption is Enabled in all Regions [`Config`: :white_check_mark:]

</details>


<details>
<summary>3. Database</summary>

- [ ]  3.1 Ensure that encryption-at-rest is enabled for RDS Instances [`Config`: :white_check_mark:]
- [ ]  3.2 Ensure that public access is not given to RDS Instance [`Config`: :white_check_mark:]
- [ ]  3.3 Ensure that automated backup is enabled RDS Instance [`Config`: :white_check_mark:]

</details>


<details>
<summary>4. Management Service</summary>
This section contains recommendations for management related services.

- [x]  4.1 Ensure CTS is enabled in all regions [`Config`: :white_check_mark:]
- [x]  4.2 Ensure CTS log file validation is enabled [`Config`: :white_check_mark:]
- [x]  4.3 Ensure the OBS bucket used to store CTS logs is not publicly accessible [`Config`: :x:]
- [ ]  4.4 Ensure CTS trails are integrated with LTS  [`Config`: :x:]
- [x]  4.5 Ensure Config is enabled in all regions [`Config`: :white_check_mark:]
- [ ]  4.6 Ensure OBS bucket access logging is enabled on the CTS OBS bucket [`Config`: :x:]
- [x]  4.7 Ensure CTS logs are encrypted at rest using KMS CMKs [`Config`: :x:]
- [ ]  4.8 Ensure rotation for customer created symmetric CMKs is enabled [`Config`: :x:]
- [ ]  4.9 Ensure VPC flow logging is enabled in all VPCs [`Config`: :x:]
- [ ]  4.10 Ensure that Object-level logging for write events is enabled for OBS bucket [`Config`: :x:]

</details>

<details>
<summary>5. Networking</summary>

- [ ]  5.1 Ensure no Network ACLs allow ingress from 0.0.0.0/0 to remote server administration ports [`Config`: :x:]
- [ ]  5.2 Ensure no security groups allow ingress from 0.0.0.0/0 to remote server administration ports [`Config`: :x:]
- [ ]  5.3 Ensure no security groups allow ingress from ::/0 to remote server administration ports [`Config`: :x:]
- [ ]  5.4 Ensure no security groups allow ingress from ::/0 to remote server administration ports [`Config`: :x:]
- [ ]  5.5 Ensure the default security group of every VPC restricts all traffic [`Config`: :x:]

</details>

<details>
<summary>6. Monitoring</summary>

- [ ]  6.1 Ensure unauthorized API calls are monitored [`CTS Key Events Notifications`: :x:]
- [ ]  6.2 Ensure management console sign-in without MFA is monitored [`CTS Key Events Notifications`: :x:]
- [x]  6.3 Ensure usage of 'root' account is monitored [`CTS Key Events Notifications`: :white_check_mark:]
- [x]  6.4 Ensure IAM policy changes are monitored [`CTS Key Events Notifications`: :white_check_mark:]
- [x]  6.5 Ensure CTS configuration changes are monitored [`CTS Key Events Notifications`: :white_check_mark:]
- [ ]  6.6 Ensure Huawei Cloud Management Console authentication failures are monitored[`CTS Key Events Notifications`:  :x:]
- [x]  6.7 Ensure disabling or scheduled deletion of customer created CMKs is monitored [`CTS Key Events Notifications`:  :white_check_mark:]
- [x]  6.8 Ensure OBS bucket policy changes are monitored [`CTS Key Events Notifications`:  :white_check_mark:]
- [x]  6.9 Ensure Config configuration changes are monitored [`CTS Key Events Notifications`:  :white_check_mark:]
- [x]  6.10 Ensure security group changes are monitored[`CTS Key Events Notifications`:  :white_check_mark:]
- [x]  6.11 Ensure Network Access Control Lists (NACL) changes are monitored [`CTS Key Events Notifications`:  :white_check_mark:]
- [x]  6.12 Ensure route table changes are monitored [`CTS Key Events Notifications`:  :white_check_mark:]
- [x]  6.13 Ensure VPC changes are monitored [`CTS Key Events Notifications`:  :white_check_mark:]
- [x]  6.14 Ensure Organizations changes are monitored [`CTS Key Events Notifications`:  :white_check_mark:]
- [ ]  6.15 Ensure Account information changes are monitored [`CTS Key Events Notifications`: :x:]

</details>
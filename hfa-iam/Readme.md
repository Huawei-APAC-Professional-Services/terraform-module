# HFA IAM Management
This module is designed to build the underlying IAM structure to allow manage all memeber accounts except the ```Centralized IAM Account``` in HFA. There are the following two types of resource will be created or configured in this module:

1. Currenlty with Huawei Cloud, the ```Agency``` is the fundamental resource for cross account access management, This module only creates the necessary agencies required by HFA minimum baseline, So it needs to be customized to meet customer scenarios. 
2. Baisc Account settings like password policy and account ACL

## Agency Configuration  

The following table shows the agencies that will be created by this module and its permission

| Agency Name | Permission | Comments |
| :----------:| :---------:| :-------:|
| hfa_readonly_agency | "Tenant Guest" | Allow readonly access to  the member accounts |
| hfa_security_agency | "Tenant Guest"<br>"LTS FullAccess"<br>"CTS FullAccess"<br>"Security Administrator" | Allow security team to configure CTS in every accounts due to the current provider limitations |

## Account Settings 

### Password Policy
Excepting account root user there should not have any users in member accounts. So this configuration will just configure a strong password policy following industry best practice. 


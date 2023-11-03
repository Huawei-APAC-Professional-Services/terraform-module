# HFA Account Delegation
This module contains the common agencies that required by every member accounts except Central IAM account. 

The following table shows the agencies that will be created by this module and its permission

| Agency Name | Permission | Comments |
| :----------:| :---------:| :-------:|
| hfa_readonly_agency | "Tenant Guest" | Allow readonly access to  the member accounts |
| hfa_security_agency | "Tenant Guest"<br>"LTS FullAccess"<br>"CTS FullAccess"<br>"Security Administrator" | Allow security team to configure CTS in every accounts due to the current provider limitations |
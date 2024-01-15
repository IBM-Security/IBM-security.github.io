---
# v10.0.6 vs. v10.0.5 comparison
## new

- add ssh public key - https://{appliance_hostname}/sysaccount/self/ssh-keys/v1
- add ssh public key for admin - https://{appliance_hostname}/admin_cfg/ssh-keys/v1
- add ssh public key for other user - https://{appliance_hostname}/sysaccount/users/{user_name}/ssh-keys/v1
+ more ssh apis
- Import a new partner - not sure what this is
- Reading the notices and machine code terms - seems new
- Retrieve a list of ACL - /isam/pdadmin/acllistext/v1
- Retrieve a list of objects protected by a given ACL or attribute
- Retrieve a specific ACL

## changes

- Create a FIDO2 Relying Party -> timeout seems new parameter
- Retrieve a list of FIDO2 Relying Parties - new parameter : timeout
- Retrieve a specific FIDO2 Relying Party - new parameter : timeout
- Update a specific FIDO2 Relying Party - new parameter : timeout
- Create a new FIDO2 Metadata service - new parameter : jwsTruststore
- Retrieve a list of FIDO2 Metadata Services  - new parameter : jwsTruststore
- Retrieve a specific FIDO2 Metadata Service  - new parameter : jwsTruststore
- Update a FIDO2 Metadata service - new parameter : jwsTruststore
- Create a new federation - saml - new parameter : keySelectionCriteria
- Create a new partner - saml : new parameter : keySelectionCriteria
- Retrieve a federation : saml : new parameter : keySelectionCriteria
- Retrieve a list of federations - saml : new parameter : keySelectionCriteria
- Retrieve a list of partners - saml : new parameter : keySelectionCriteria
- Retrieve a partner - saml : new parameter : keySelectionCriteria
- Update a specific federation - saml : new parameter : keySelectionCriteria
- Update a specific partner - saml : new parameter : keySelectionCriteria
- OAuth2 IBM Security Verify OIDC provider configuration for a reverse proxy instance  - oauth2_config seems to have new defaults
- Retrieving details for a particular LMI user - new ssh-keys field
- Retrieving the administrator settings - new field sshdPasswordAuthentication, enable_ssh_pubkey_auth, ssh_pubkey_auth_attribute
- Update a specified API protection definition - new parameters grantTypes, enforce-granttype-deletion

## critical changes

- https://github.com/IBM-Security/isam-ansible-collection/issues/169 - case_sensitive_url becomes case_insensitive_url
- Creating a new API Access Control Resource Server - same parameter issue case_sensitive_url -> case_insensitive_url
- Creating a standard or virtual junction - same parameter issue case_sensitive_url -> case_insensitive_url
- Retrieving a detailed list of standard and virtual junctions - same parameter issue case_sensitive_url -> case_insensitive_url
- Updating an existing API Access Control Resource Server - same parameter issue case_sensitive_url -> case_insensitive_url
- Creating a new API Access Control Resource Server - same parameter issue case_sensitive_url -> case_insensitive_url
- Adding a back-end server to an existing standard or virtual junction -  same parameter issue case_sensitive_url -> case_insensitive_url


## not sure if this is new
- /setup_service_agreements/non_ibm_text

## documentation updates

- Retrieving the administrator settings - renamed variable (or documentation error) - sessionInactiveTimeout -> sessionInactivityTimeout -> documentation update
- Updating the administrator settings - renamed variable (or documentation error) - sessionInactiveTimeout -> sessionInactivityTimeout -> documentation update
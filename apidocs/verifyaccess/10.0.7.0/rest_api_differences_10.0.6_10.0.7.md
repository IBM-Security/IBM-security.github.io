# v10.0.7 vs. v10.0.6 comparison

## new
- Create_a_Volume - docker ( requires Verify Access Container Extension )
- Create_Container_Deployment - ( requires Verify Access Container Extension )
- Create_Registry_Authentication - ( requires Verify Access Container Extension )
- Delete_Container_Deployment - ( requires Verify Access Container Extension )
- Delete_Container_Image - ( requires Verify Access Container Extension )
- Delete_Container_Volume - ( requires Verify Access Container Extension )
- Delete_Registry_Authentication.xml - ( requires Verify Access Container Extension )
- Export_a_Container_Volume.xml - ( requires Verify Access Container Extension )
- Get_All_Container_Configurations - ( requires Verify Access Container Extension )
- Get_All_Registry_Authentication - ( requires Verify Access Container Extension )
- Get_Container_Configuration - ( requires Verify Access Container Extension )
- Get_Container_Metadata - ( requires Verify Access Container Extension )
- Get_Container_Metadata_List - ( requires Verify Access Container Extension )
- Get_Image_List - ( requires Verify Access Container Extension )
- Get_Image_Properties - ( requires Verify Access Container Extension )
- Get_list_of_Container_Volumes - ( requires Verify Access Container Extension )
- Get_Registry_Authentication - ( requires Verify Access Container Extension )
- Get_the_health_of_a_container - ( requires Verify Access Container Extension ) 
- Get_the_health_of_all_containers - ( requires Verify Access Container Extension )
- Import_a_zip_file_as_a_volume - ( requires Verify Access Container Extension )
- Pull_Container_Image - ( requires Verify Access Container Extension )
- Update_Container_Deployment - ( requires Verify Access Container Extension )
- Update_Container_Image - ( requires Verify Access Container Extension )
- Update_Container_Registry_Authentication - ( requires Verify Access Container Extension )
- Renaming_a_personal_certificate_in_a_certificate_database
- Retrieve a list of all audit components
- Retrieve a specific audit component
- Retrieve all audit components for a type
- Retrieve_the_remote_syslog_forwarding_sources
- Update a specific audit component
- Update all audit components for a type
- Update all audit components

## changes
- Create a FIDO2 Relying Party - new parameter `mdsRefresh`
- Retrieve a list of FIDO2 Relying Parties - new parameter `mdsRefresh`
- Retrieve a specific FIDO2 Relying Party - new parameter `mdsRefresh`
- Creating_a_JDBC_server_connection - name="url" Oracle jdbcConnection url
- Modifying_a_JDBC_server_connection - name="url" Oracle jdbcConnection url
- Retrieving_a_JDBC_server_connection - name="url" Oracle jdbcConnection url
- Retrieving_a_list_of_all_JDBC_server_connections - name="url" Oracle jdbcConnection url
- Retrieving_a_list_of_all_server_connections - name="url" Oracle jdbcConnection url

## critical changes
- Generating_a_self-signed_personal_certificate_in_a_certificate_database - new required parameter `Content-Type: application/json`
- Importing_a_personal_certificate_into_a_certificate_database - `header` required parameters
- Importing_a_signer_certificate_into_a_certificate_database - `header` required parameters

## Obsolete
- set private cert as default (not valid since 10.0.3)
- Create a new FIDO2 Metadata service - removed parameter `retryInterval`
- Retrieve a list of FIDO2 Metadata Services - removed parameter `retryInterval`
- Retrieve a specific FIDO2 Metadata Service - removed parameter `retryInterval`
- Update a FIDO2 Metadata service - removed parameter `retryInterval`
- Create a new federation partner - changes in supported algoritms
- Retrieve a list of partners - changes in supported algoritms
- Retrieve a partner - changes in supported algoritms
- Update a specific federation - changes in supported algoritms
- Update a specific partner - changes in supported algoritms


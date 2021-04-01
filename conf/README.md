# File : Detail on installationDetails.txt file and how to configure it.
### Programmer : Altaf Hossain
### Version : 1.1
### Last Change Date : 06,June,2019
### Author : Altaf Hossain
### Description : This is the file that will give you complete detail information about  installationDetails.txt

| Variable & Value | Description |
| ------ | ------ |
| dir="/opt/Axway-7.5.3" | This is the directory where the gateway will be installed. |
| analytics="yes" |	select yes if you want to install analytics and no is not|
| username="admin" | this is the user name of gateway |
| adminpasswd="changeme" | this is the password of admin user |
| cassandra="yes" | select yes if you want to install cassandra and no is not |
| cassandraInstalldir="/opt/db/cassandra" | This is the directory where the cassandra will be installed|
| cassandraJDK="/opt/Axway-7.5.3/apigateway/platform/jre" | This is the directory where the jdk is installed that will be used by cassandra |
| analyticsLicenseFilePath="/root/apiportal.lic" | This is license File Path of analytics |
| licenseFilePath="/root/apiportal.lic"	| This is license File Path of gateway |
| cassandrahost="10.151.9.3:9042,localhost:9042" | This is the cassandra host details that are required usually if the same instance has the cassndra then you can use localhost |
| replicationfactor="3" | the new key space created will have replication factor 3 |
| cassandraStart="1" | if you want to start cassandra then select 1 or if not then 0 |
| nm_name="10.151.9.3" | nodemanager name usually we set it to IP of the machine |
| group="front"	| Name of the group in which instance will be created |
| instancename="front-11" | Name of the instance |
| instance="yes" | select yes if you want  to create instance |
| password="changeme" | password used at the time of instance creation |
| adminManagerName="apiadmin" | user name for the API manager |
| adminManagerPass="changeme" | password for api manager | 
| apimgmtlicenseFilePath="/root/apiportal.lic" | license File Path of api manager |
| apimgmt="yes"	| select yes if you want to install apimanager and no is not |
| anm="yes"	| select yes if you want to configure this node as admin of the topology  and no is not |
| anmhost="10.151.9.3" | if this node is not your admin node then provide the admin node IP here |
| anmport="8090" | if this node is not your admin node then provide the admin node ports |
| enable_components="nodemanager,apigateway,cassandra,packagedeploytools,analytics,apimgmt" | you need to select the components that you want to install |
| disable_components="qstart,policystudio,configurationstudio,apitester" | you need to provide the list of components that you do not want to install |

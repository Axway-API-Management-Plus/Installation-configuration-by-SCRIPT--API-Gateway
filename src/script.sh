# File : Script to install apigateway, cassandra, setup api manager and install api analyticsLicenseFilePath
# Programmer : Altaf Hossain
# Version : 1.1
# Last Change Date : 06,June,2019
# Author : Altaf Hossain
# Description : The Script helps to :- Install API gateway in unattended form, if required install & Start cassandra, Register HOST, Create group and instance, If require,  set up API manager & if require, Install Analytics 

#Include : installationDetails.txt
#Description : This is the text file that is used at the time of installation you can set the values to yes/no in case you want a component like apimanager, cassandra to install for not.

#NOTE : We need to keep the Installation file "APIGateway_7.5.3_Install_linux-x86-64_BN8.run" (or can be any other version installation file), script and installationDetails.txt needs to be in same directory.

#!/bin/bash

# Read the Source file installationDetails.txt for the information to load which components are needed to be installed and the value of each variables like IP'samples/scripts
source installationDetails.txt

# unattended installation of APIGateway and other components depending on the entry of installationDetails.txt
./APIGateway_7.5.3_Install_linux-x86-64_BN8.run --mode unattended --setup_type advanced --licenseFilePath $licenseFilePath --prefix $dir --enable-components $enable_components --disable-components $disable_components --username $username --adminpasswd $adminpasswd --cassandraInstalldir $cassandraInstalldir --cassandraJDK $cassandraJDK --startCassandra $cassandraStart --analyticsLicenseFilePath $analyticsLicenseFilePath --apimgmtLicenseFilePath $apimgmtlicenseFilePath

# Check is Cassandra is yes of not
if [ $cassandra == 'yes' ]
then

#go to the installation_dir/apigateway/samples/scripts where the run.sh file is present that is used at the time of instance creation and add cassndra node entry in it (usually localhost 9042 is used, if the same machine has the cassandra in it)

        cd $dir/apigateway/samples/scripts

        ./run.sh $dir/apigateway/samples/scripts/cassandra/updateCassandraSettings.py -r $replicationfactor -H $cassandrahost
fi

# go to installation_dir/apigateway/posix/bin

        cd $dir/apigateway/posix/bin

		
# check if this node is admin node of the cluster or not	
if [ $anm == 'yes' ]

then

# domain registration takes place here keeping node as the admin

        ./managedomain --initialize --nm_name $nm_name

fi

if [ $anm == 'no' ]

then

# domain registration taked place here addressing the admin node

                ./managedomain --add --nm_name $nm_name --anm_host $anmhost --anm_port $anmport --username $username --password $password

fi

# start node manager
        ./nodemanager -d
		
if [ $instance == 'yes']		

then

# created instance and group
        ./managedomain  --create_instance --name $instancename --group $group --username $username --password $password
# start instance
        ./startinstance -g $group -n $instancename -d

fi
		
# check if api manager is yes or not
if [ $apimgmt == 'yes' ]

then
                cd $dir/apigateway/posix/bin
# Use setup-apimanager script to install and configure api manager 
        ./setup-apimanager --username $username --password $adminpasswd --adminName $adminManagerName --adminPass $adminManagerPass -g $group -n $instancename --update
fi

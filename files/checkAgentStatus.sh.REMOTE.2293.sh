#!/bin/bash
#sudo su
#code for checking status of ids service
touch /tmp/outputfile
chmod 777 /tmp/outputfile
touch /tmp/idsfile
chmod 777 /tmp/idsfile
service --status-all | grep -i sisidsdaemon | grep -i loaded | cut -d " " -f5 > /tmp/idsfile
service_status_ids=`cat /tmp/idsfile`
if [ "$service_status_ids" == "loaded" ]
then
        echo "Agent Installation status of IDS service Success" |  tr '\n' '=' >> /tmp/outputfile
        cat /tmp/idsfile >> /tmp/outputfile
else
        echo "Agent Installation status of IDS service Failed" >> /tmp/outputfile
fi

#code for checking status of ips service
touch /tmp/ipsutilfile
chmod 777 /tmp/ipsutilfile
service --status-all | grep -i sisipsutildaemon | grep -i loaded | cut -d " " -f5 > /tmp/ipsutilfile
service_status_ipsutil=`cat /tmp/ipsutilfile`
if [ "$service_status_ipsutil" == "loaded" ]
then
        echo "Agent Installation status of IPSUTIL service Success" |  tr '\n' '=' >> /tmp/outputfile
        cat /tmp/ipsutilfile  >> /tmp/outputfile
else
        echo "Agent Installation status of IPSUTIL service Failed" >> /tmp/outputfile
fi

#code for checking status of ips service
touch /tmp/ipsfile
chmod 777 /tmp/ipsfile
service --status-all | grep -i sisipsdaemon | grep -i loaded | cut -d " " -f5 > /tmp/ipsfile
service_status_ips=`cat /tmp/ipsfile`
if [ "$service_status_ips" == "loaded" ]
then
        echo "Agent Installation status of IPS service Success" |  tr '\n' '=' >> /tmp/outputfile
        cat /tmp/ipsfile  >> /tmp/outputfile
else
        echo "Agent Installation status of IPS service Failed" >> /tmp/outputfile
fi


#code for checking status of caf service
touch /tmp/caffile
chmod 777 /tmp/caffile
service --status-all | grep -i cafagent | grep -i loaded | cut -d " " -f5 > /tmp/caffile
service_status_caf=`cat /tmp/caffile`
if [ "$service_status_caf" == "loaded" ]
then
        echo "Agent Installation status of CAF service Success" |  tr '\n' '=' >> /tmp/outputfile
        cat /tmp/caffile  >> /tmp/outputfile
else
        echo "Agent Installation status of CAF service Failed" >> /tmp/outputfile
fi

#print overall status
cat /tmp/outputfile
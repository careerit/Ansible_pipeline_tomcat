#!/bin/bash
RESOURCE_GROUP=$1

chmod 400 id_rsa

echo -e "Host 10.*\n \tStrictHostKeyChecking no" > ~/.ssh/config

cat ~/.ssh/config 


echo "Create hosts file"
echo "[webservers]" > hosts 
az vm list --resource-group $RESOURCE_GROUP --show-details \
           --query "[?contains(name, 'web')].privateIps" -otsv >> hosts  

echo "Run Ansible Playbook"
ansible-playbook -i hosts tomcat_playbook.yaml --private-key id_rsa



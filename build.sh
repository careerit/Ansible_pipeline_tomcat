#!/bin/bash

ls -l .
ls -l ~/.ssh/
cat id_demo
cat ~/.ssh/id_demo

echo "[webservers]" > hosts 
az vm list --resource-group Victory-rg --show-details --query "[?contains(name, 'web')].privateIps" -otable | tail +3 >> hosts  



ansible-playbook -i hosts tomcat_playbook.yaml 

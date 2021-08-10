#!/bin/bash

ls -l .
ls -l ~/.ssh/
cat id_rsa
cat ~/.ssh/id_rsa
chmod 400 id_rsa

echo "[webservers]" > hosts 
az vm list --resource-group Victory-rg --show-details --query "[?contains(name, 'web')].privateIps" -otable | tail +3 >> hosts  



ansible-playbook -i hosts tomcat_playbook.yaml --private-key id_rsa

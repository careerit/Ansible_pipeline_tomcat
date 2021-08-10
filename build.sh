#!/bin/bash

chmod 400 id_rsa

echo "Create hosts file"
echo "[webservers]" > hosts 
az vm list --resource-group Victory-rg --show-details --query "[?contains(name, 'web')].privateIps" -otsv >> hosts  

echo "Run Ansible Playbook"
ansible-playbook -i hosts tomcat_playbook.yaml --private-key id_rsa

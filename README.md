# Pipeline to Install Tomcat with Ansible

## Azure Connection


- Get the tenant ID of your subscription

```bash
az account show
```

- Create Service Principle for the Azure DevOps Service Connection

```bash
az ad sp create-for-rbac --name AzCloud --role Contributor --scope /subscriptions/"8d4847a9-69e0-421a-a34c-bdbe015475c7"
```
To specifically get AppID and Service Principal

```bash
 az ad sp create-for-rbac --name azdo --role Contributor --scope /subscriptions/"8d4847a9-69e0-421a-a34c-bdbe015475c7" --query "[].{AppID:appId,  Tenant:tenant}"
```

- Go to project settings --> Service Connections
- Click on New Service Connection
- Select Azure Resource manager
- Choose Manual
- Add the required detials.








## Dynamic Inventory


```bash
az vm list --resource-group Victory-rg --show-details --query "[?contains(name, 'web')].privateIps" -otable | tail +3 >> hosts  
```


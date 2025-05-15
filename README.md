# Code samples

## Using Azure CLI and a parameters file

```bicep
az deployment mg create --template-file ./main.bicep --parameters ./main.bicepparam --location <location> --management-group-id <ID of the management group to deploy this template not where the subscription will be associated>
```
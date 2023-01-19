# container-apps-storage-volume-examples
Examples of using different types of storage to do I/O operations.

The 3 storage mounts defined in this repo follow what is seen here in [Use storage mounts in Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/storage-mounts?pivots=aca-cli)

- Container file system (`container-storage` folder)
- Temporary storage (Ephemeral) (`ephemeral-storage` folder)
- Azure Files (`azure-files-storage` folder)

## How to run these examples
Build the `Dockerfile` in the associated example and push it to your Azure Container Registry. This should be a fully runnable and ready to go example.

**IMPORTANT**: Ensure to populate your needed environment variables prior to running and/or deployment.

The following folders contains key items are the same under each parent folder:
- `deployments`: Use the contents in this folder to deploy to Azure. This contains `deployment.bicep` - which is the Bicep file used to deploy the example, as well as `deployment-command.sh`, which is the command used to deploy the Bicep file.
- `kubernetes`: This is for local development. For the `container-storage` and `ephemeral-storage` examples, this can be ran on a local cluster. There is no current local example for the `azure-files-examples`.




  
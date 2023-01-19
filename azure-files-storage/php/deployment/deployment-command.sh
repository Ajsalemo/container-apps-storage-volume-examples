#!/bin/bash

az deployment group create \
  --resource-group "$RESOURCE_GROUP" \
  --template-file ./deployment.bicep \
  --parameters \
    environmentName="$CONTAINERAPPS_ENVIRONMENT" \
    containerAppName="$CONTAINERAPPS_NAME" \
    azureContainerRegistry="$AZURE_CONTAINER_REGISTRY" \
    azureContainerRegistryImage="$AZURE_CONTAINER_REGISTRY_IMAGE" \
    azureContainerRegistryImageTag="$AZURE_CONTAINER_REGISTRY_IMAGE_TAG" \
    azureContainerRegistryUsername="$AZURE_CONTAINER_REGISTRY_USERNAME" \
    azureContainerRegistryPassword="$AZURE_CONTAINER_REGISTRY_PASSWORD" \
    azureStorageAccountName="$AZURE_STORAGE_ACCOUNT_NAME" \
    azureFilesAccountKey="$AZURE_FILES_ACCOUNT_KEY" \
    azureFilesShareName="$AZURE_FILES_SHARE_NAME" \
    appInsightsName="$AZURE_APP_INSIGHTS_NAME" \
    logAnalyticsWorkspaceName="$AZURE_LAW_NAME" 

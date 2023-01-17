param environmentName string 
param logAnalyticsWorkspaceName string
param appInsightsName string
param containerAppName string 
param azureContainerRegistry string
param azureContainerRegistryImage string 
param azureContainerRegistryImageTag string
@secure()
param azureContainerRegistryUsername string
@secure()
param azureContainerRegistryPassword string
param location string = resourceGroup().location

resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logAnalyticsWorkspaceName
  location: location
  properties: any({
    retentionInDays: 30
    features: {
      searchVersion: 1
    }
    sku: {
      name: 'PerGB2018'
    }
  })
}

resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: appInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

resource appEnvironment 'Microsoft.App/managedEnvironments@2022-06-01-preview' = {
  name: environmentName
  location: location
  properties: {
    daprAIInstrumentationKey: appInsights.properties.InstrumentationKey
    appLogsConfiguration: {
      destination: 'log-analytics'
      logAnalyticsConfiguration: {
        customerId: logAnalyticsWorkspace.properties.customerId
        sharedKey: logAnalyticsWorkspace.listKeys().primarySharedKey
      }
    }
  }
}

resource containerApp 'Microsoft.App/containerApps@2022-06-01-preview' = {
  name: containerAppName
  location: location
  properties: {
    environmentId: appEnvironment.id
    configuration: {
      ingress: {
        targetPort: 8000
        external: true
      }
      secrets: [
        {
          name: 'azurecontainerregistrypasswordsecretref'
          value: azureContainerRegistryPassword
        }
      ]
      registries: [
        {
          server: '${azureContainerRegistry}.azurecr.io'
          username: azureContainerRegistryUsername
          passwordSecretRef: 'azurecontainerregistrypasswordsecretref'
        }
      ]
    }
    template: {
      containers: [
        {
          image: '${azureContainerRegistry}.azurecr.io/${azureContainerRegistryImage}:${azureContainerRegistryImageTag}'
          name: 'python'
          resources: {
            cpu: json('0.5')
            memory: '1Gi'
          }
        }
      ]
      scale: {
        minReplicas: 1
        maxReplicas: 1
      }
    }
  }
}


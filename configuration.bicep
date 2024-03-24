@description('Environment name')
@allowed([
  'prd'
  'dev'
])
param environment string

var environmentConfigurationMap = {
  dev: {
    privateEndpointVnet: { // Private endpoint VNet settings
      resoureGroupName: 'fbitn-vnet-eastus2'
      virtualNetworkName: 'vnet-corp-development-01-eastus2-01' // Name of the VNet
      subnetName: 'snet-corp-development-01-privateendpoint-eastus2-01'
    }
  }
  prd: {
    privateEndpointVnet: { // Private endpoint VNet settings
      resoureGroupName: 'fbitn-vnet-eastus2'
      virtualNetworkName: 'vnet-corp-production-01-eastus2-01' // Name of the VNet
      subnetName: 'snet-corp-production-01-privateendpoint-eastus2-01'
    }
  }
}

output settings object = environmentConfigurationMap[environment]

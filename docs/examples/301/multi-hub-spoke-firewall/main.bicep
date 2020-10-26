param region1 string {
    default: 'northeurope'
}

param region2 string {
    default: 'westeurope'
}

param sharedKey string {
    secure: true
}
param gatewaySku string {
    allowed: [
        'Standard'
        'HighPerformance'
        'VpnGw1'
        'VpnGw2'
        'VpnGw3'
    ]
    default: 'VpnGw1'
}

var hub_vnet_region1_cfg = {
    name: 'hub-vnet-${region1}'
    addressSpacePrefix: '10.0.0.0/16'
    subnetNameShared: 'shared-services'
    subnetPrefixFirewall: '10.0.0.0/24'
    subnetPrefixShared: '10.0.1.0/24'
    subnetPrefixGateway: '10.0.255.0/24'
    gatewayName: 'gw-${region1}'
    gatewayPublicIPName: 'gw-pip-${region1}'
    connectionName: '${region1}-to-${region2}'
    asn: 65010
}

var spoke_vnet_region1_cfg = {
    name: 'spoke-vnet-${region1}'
    addressSpacePrefix: '10.1.0.0/16'
    subnetName: 'service-${region1}'
    subnetPrefix: '10.0.0.0/24'
}

var hub_vnet_region2_cfg = {
    name: 'hub-vnet-${region2}'
    addressSpacePrefix: '10.10.0.0/16'
    subnetNameShared: 'shared-services'
    subnetPrefixFirewall: '10.10.0.0/24'
    subnetPrefixShared: '10.10.1.0/24'
    subnetPrefixGateway: '10.10.255.0/24'
    gatewayName: 'gw-${region2}'
    gatewayPublicIPName: 'gw-pip-${region2}'
    connectionName: '${region2}-to-${region1}'
    asn: 65015
}

var spoke_vnet_region2_cfg = {
    name: 'spoke-vnet-${region2}'
    addressSpacePrefix: '10.11.0.0/16'
    subnetName: 'service-${region2}'
    subnetPrefix: '10.11.0.0/24'
}

resource rg_region1 'Microsoft.Resources/resourceGroups@2020-06-01' = {
    name: 'hub-spoke-${region1}'
    location: region1
}

resource rg_region2 'Microsoft.Resources/resourceGroups@2020-06-01' = {
    name: 'hub-spoke-${region2}'
    location: region2
}
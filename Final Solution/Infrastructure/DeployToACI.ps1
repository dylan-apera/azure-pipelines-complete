param(
    [string]$resourceGroup,
    [string]$containerName,
    [string]$containerImage,
    [string]$containerRegistry,
    [string]$osType,
    [string]$cpus,
    [string]$memory,
    [string]$azureUsername,
    [string]$azurePassword, #Should be SecureString in real applications
    [string]$environmentVariables,
    [string]$appDns,
    [string]$appPort

)

az login -u $azureUsername -p $azurePassword 

$acrUsername=az acr credential show --name $containerRegistry --resource-group $resourceGroup --query username 

$acrPassword=az acr credential show --name $containerRegistry --resource-group $resourceGroup --query passwords[0].value

$acrloginserver = $(az acr show --name $containerRegistry --query loginServer)

az container create --resource-group $resourceGroup --name $containerName --image $containerImage --os-type $osType --cpu $cpus --memory $memory --registry-login-server $acrloginserver --registry-username $acrUsername --registry-password $acrPassword --dns-name-label $appDns --ports $appPort --environment-variables $environmentVariables
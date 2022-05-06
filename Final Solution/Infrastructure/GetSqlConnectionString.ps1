param(
    [string]$resourceGroup,
    [string]$azureUsername,
    [string]$azurePassword, #Should be SecureString in real applications
    [string]$sqlServerName,
    [string]$databaseName,
    [parameter(Mandatory,ValueFromPipeline)][ref]$sqlConnectionString
)

az login -u $azureUsername -p $azurePassword 

$sqlConnectionString.Value = az sql db show-connection-string --server $sqlServerName --name $databaseName --client ado.net
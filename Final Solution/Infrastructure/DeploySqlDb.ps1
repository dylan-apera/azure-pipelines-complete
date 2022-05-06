param(
    [string]$resourceGroup,
    [string]$azureUsername,
    [string]$azurePassword, #Should be SecureString in real applications
    [string]$sqlServerName,
    [string]$sqlServerSku,
    [string]$sqlServerUsername,
    [string]$sqlServerPassword, #Should be SecureString in real applications
    [string]$databaseName,
    [string]$azureRegion
)

az login -u $azureUsername -p $azurePassword 

#Create a SQL Server
az sql server create --name $sqlServerName --resource-group $resourceGroup --location $azureRegion --admin-user $sqlServerUsername --admin-password $sqlServerPassword  

#Open firewall ports for the SQL Server
az sql server firewall-rule create --resource-group $resourceGroup --server $sqlServerName -n AllowLODSystem --start-ip-address '0.0.0.0' --end-ip-address '255.255.255.255'  

#Create a database to host the API data
az sql db create --resource-group $resourceGroup --server $sqlServerName --name $databaseName --service-objective $sqlServerSku --capacity 10 --tags $databaseName
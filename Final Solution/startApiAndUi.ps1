
Write-Host -ForegroundColor Yellow "Starting API and UI with docker-compose (docker-compose -f '.\dc.allup.yml' up --build -d)"
docker-compose -f '.\dc.allup.yml' up --build -d

Write-Host -ForegroundColor Yellow 'Standing by for database to respond.  If this does not respond in roughly 5 minutes please contact your instructor.'
do {
	$apicheck = Invoke-RestMethod -Method Get -Uri 'http://localhost:8080/api/customers' -StatusCodeVariable 'dbcallcheck' -SkipCertificateCheck -SkipHttpErrorCheck
	Start-Sleep -Seconds 3
	Write-Host -ForegroundColor Yellow 'Checking database...'
} until ($dbcallcheck -eq '200')

Write-Output -InputObject $apicheck
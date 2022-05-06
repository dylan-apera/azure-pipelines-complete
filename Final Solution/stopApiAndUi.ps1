Write-Host -ForegroundColor Yellow "Stopping running containers...Please be patient."
docker stop $(docker ps -a -q)

Write-Host -ForegroundColor Yellow "Removing built containers..."
docker rm $(docker ps -a -q)

Write-Host -ForegroundColor Yellow "Removing dangling images..."
docker image prune -f
Write-Host -ForegroundColor Yellow 'Building ModernUIAppSolution/ModernUIApp/ModernUIApp.csproj'
dotnet build ./ModernUIAppSolution/ModernUIApp/ModernUIApp.csproj --nologo -v q

Write-Host -ForegroundColor Yellow 'Building ModernUIAppSolution/ModernUIApp.Tests/ModernUIApp.Tests.csproj'
dotnet build ./ModernUIAppSolution/ModernUIApp.Tests/ModernUIApp.Tests.csproj --nologo -v q

Write-Host -ForegroundColor Yellow 'Building ModernApiAppSolution/ModernApiApp/ModernApiApp.csproj'
dotnet build ./ModernApiAppSolution/ModernApiApp/ModernApiApp.csproj --nologo -v q

Write-Host -ForegroundColor Yellow 'Building ModernApiAppSolution/ModernApiApp.DataAccess/ModernApiApp.DataAccess.csproj'
dotnet build ./ModernApiAppSolution/ModernApiApp.DataAccess/ModernApiApp.DataAccess.csproj --nologo -v q

Write-Host -ForegroundColor Yellow 'Building ModernApiAppSolution/ModernApiApp.Entities/ModernApiApp.Entities.csproj'
dotnet build ./ModernApiAppSolution/ModernApiApp.Entities/ModernApiApp.Entities.csproj --nologo -v q

Write-Host -ForegroundColor Yellow 'Building ModernApiAppSolution/ModernApiApp.Tests/ModernApiApp.Tests.csproj'
dotnet build ./ModernApiAppSolution/ModernApiApp.Tests/ModernApiApp.Tests.csproj --nologo -v q
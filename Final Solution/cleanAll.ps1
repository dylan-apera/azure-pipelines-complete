Write-Host -ForegroundColor Yellow 'Cleaning ModernUIAppSolution/ModernUIApp/ModernUIApp.csproj'
dotnet clean ./ModernUIAppSolution/ModernUIApp/ModernUIApp.csproj --nologo -v q

Write-Host -ForegroundColor Yellow 'Cleaning ModernUIAppSolution/ModernUIApp.Tests/ModernUIApp.Tests.csproj'
dotnet clean ./ModernUIAppSolution/ModernUIApp.Tests/ModernUIApp.Tests.csproj --nologo -v q

Write-Host -ForegroundColor Yellow 'Cleaning ModernApiAppSolution/ModernApiApp/ModernApiApp.csproj'
dotnet clean ./ModernApiAppSolution/ModernApiApp/ModernApiApp.csproj --nologo -v q

Write-Host -ForegroundColor Yellow 'Cleaning ModernApiAppSolution/ModernApiApp.DataAccess/ModernApiApp.DataAccess.csproj'
dotnet clean ./ModernApiAppSolution/ModernApiApp.DataAccess/ModernApiApp.DataAccess.csproj --nologo -v q

Write-Host -ForegroundColor Yellow 'Cleaning ModernApiAppSolution/ModernApiApp.Entities/ModernApiApp.Entities.csproj'
dotnet clean ./ModernApiAppSolution/ModernApiApp.Entities/ModernApiApp.Entities.csproj --nologo -v q

Write-Host -ForegroundColor Yellow 'Cleaning ModernApiAppSolution/ModernApiApp.Tests/ModernApiApp.Tests.csproj'
dotnet clean ./ModernApiAppSolution/ModernApiApp.Tests/ModernApiApp.Tests.csproj --nologo -v q
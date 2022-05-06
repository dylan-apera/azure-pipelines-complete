Write-Host -ForegroundColor Yellow "Testing ModernApiAppSolution/ModernApiApp.Tests/ModernApiApp.Tests.csproj"
dotnet test ./ModernApiAppSolution/ModernApiApp.Tests/ModernApiApp.Tests.csproj /p:CollectCoverage=true /p:CoverletOutputFormat=cobertura /p:Exclude="[xunit*]\*" /p:CoverletOutput="./TestResults/"

Write-Host -ForegroundColor Yellow "Testing ModernUIAppSolution/ModernUIApp.Tests/ModernUIApp.Tests.csproj"
dotnet test ./ModernUIAppSolution/ModernUIApp.Tests/ModernUIApp.Tests.csproj /p:CollectCoverage=true /p:CoverletOutputFormat=cobertura /p:Exclude="[xunit*]\*" /p:CoverletOutput="./TestResults/"

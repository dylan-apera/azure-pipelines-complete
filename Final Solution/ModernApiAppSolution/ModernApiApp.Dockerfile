FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS publish
WORKDIR /src

COPY ./ModernApiApp.Entities/* ./ModernApiApp.Entities/
RUN dotnet restore ./ModernApiApp.Entities/ModernApiApp.Entities.csproj

COPY ./ModernApiApp.DataAccess/* ./ModernApiApp.DataAccess/
RUN dotnet restore ./ModernApiApp.DataAccess/ModernApiApp.DataAccess.csproj

COPY ./ModernApiApp/* ./ModernApiApp/
RUN dotnet restore ./ModernApiApp/ModernApiApp.csproj

RUN dotnet publish ./ModernApiApp/ModernApiApp.csproj -c Release -o /app/publish --no-restore

FROM base as final
WORKDIR /app
COPY --from=publish /app/publish .

ENV ApiAppDatabaseServer modernapiapp.database
ENV ApiAppDatabaseName ModernApiDB
ENV ApiAppDatabaseUser sa
ENV ApiAppDatabasePassword Microsoft2018!1
ENV ASPNETCORE_ENVIRONMENT Development

ENTRYPOINT [ "dotnet", "ModernApiApp.dll" ]
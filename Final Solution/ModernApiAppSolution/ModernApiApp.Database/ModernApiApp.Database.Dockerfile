#Build Image
FROM microsoft/mssql-server-windows-express
COPY deploy/ ./scripts/
ENV ACCEPT_EULA Y
ENV sa_password Microsoft2018!1

#Create DB Schema and Test Dataset
RUN sqlcmd -i ./scripts/SqlCmdScript.sql 

#Expose network ports
EXPOSE 1433
EXPOSE 5434
USE master
GO

CREATE DATABASE ModernApiDB
GO

USE [ModernApiDB]
GO

GO
CREATE TABLE [dbo].[Customers] (
    [id] int identity not null primary key,
    [address] nvarchar(128) not null,
    [companyname] nvarchar(128) not null,
    [name] nvarchar(128) not null
);
GO

INSERT INTO [dbo].[Customers] ([Address], [CompanyName], [Name]) VALUES (N'100 Main Street', N'Microsoft', N'Joe X. Doe')
INSERT INTO [dbo].[Customers] ([Address], [CompanyName], [Name]) VALUES (N'200 Contoso Way', N'Microsoft', N'Jane Y. Doe')
INSERT INTO [dbo].[Customers] ([Address], [CompanyName], [Name]) VALUES (N'300 Fabrikam Ct.', N'Microsoft', N'Jimmy Z. Doe')
INSERT INTO [dbo].[Customers] ([Address], [CompanyName], [Name]) VALUES (N'400 Northwind Trader Circle', N'Microsoft', N'Jesse W. Doe')
INSERT INTO [dbo].[Customers] ([Address], [CompanyName], [Name]) VALUES (N'500 World Wide Street', N'Microsoft', N'James V. Doe')
GO
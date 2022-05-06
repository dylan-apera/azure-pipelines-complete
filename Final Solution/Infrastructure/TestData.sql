IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES  WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'Customers'))
	BEGIN
   		DROP TABLE [dbo].[Customers]; 
	END
GO

CREATE TABLE [dbo].[Customers] (
[Id] int identity not null primary key,
[Address] nvarchar(128) not null,
[CompanyName] nvarchar(128) not null,
[Name] nvarchar(128) not null
);
GO

INSERT INTO [dbo].[Customers] ([Address], [CompanyName], [Name]) VALUES (N'100 Main Street', N'Microsoft', N'Scott X. Doe')
INSERT INTO [dbo].[Customers] ([Address], [CompanyName], [Name]) VALUES (N'200 Contoso Way', N'Microsoft', N'Kathleen Y. Doe')
INSERT INTO [dbo].[Customers] ([Address], [CompanyName], [Name]) VALUES (N'300 Fabrikam Ct.', N'Microsoft', N'Judson Z. Doe')
INSERT INTO [dbo].[Customers] ([Address], [CompanyName], [Name]) VALUES (N'400 Northwind Trader Circle', N'Microsoft', N'Amy W. Doe')
INSERT INTO [dbo].[Customers] ([Address], [CompanyName], [Name]) VALUES (N'500 World Wide Street', N'Microsoft', N'Jean-Phillip V. Doe')
INSERT INTO [dbo].[Customers] ([Address], [CompanyName], [Name]) VALUES (N'600 Main Street', N'Microsoft', N'Bill X. Doe')
INSERT INTO [dbo].[Customers] ([Address], [CompanyName], [Name]) VALUES (N'700 Contoso Way', N'Microsoft', N'Satya Y. Doe')
INSERT INTO [dbo].[Customers] ([Address], [CompanyName], [Name]) VALUES (N'800 Fabrikam Ct.', N'Microsoft', N'Brad Z. Doe')
INSERT INTO [dbo].[Customers] ([Address], [CompanyName], [Name]) VALUES (N'900 Northwind Trader Circle', N'Microsoft', N'Chris W. Doe')
INSERT INTO [dbo].[Customers] ([Address], [CompanyName], [Name]) VALUES (N'1000 World Wide Street', N'Microsoft', N'Kurt V. Doe')
GO
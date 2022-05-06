USE [ModernApiDB]
GO

DROP TABLE [dbo].[Customers];

GO
CREATE TABLE [dbo].[Customers] (
    [id] int identity not null primary key,
    [address] nvarchar(128) not null,
    [companyname] nvarchar(128) not null,
    [name] nvarchar(128) not null
);
GO
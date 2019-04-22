USE master;
ALTER DATABASE [nplaylist_authentication] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE [nplaylist_authentication];
GO

CREATE DATABASE nplaylist_authentication;
GO

USE nplaylist_authentication;

EXEC sp_configure 'CONTAINED DATABASE AUTHENTICATION', 1
GO

RECONFIGURE
GO

USE [master]
GO
ALTER DATABASE [nplaylist_authentication] SET CONTAINMENT = PARTIAL
GO

RECONFIGURE
GO

USE nplaylist_authentication;
GO

CREATE USER sa WITH PASSWORD = 'Password123'
GO

EXEC sp_addrolemember N'db_owner', N'sa'
GO
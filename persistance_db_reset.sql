USE master;
ALTER DATABASE [nplaylist_persistance] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE [nplaylist_persistance];
GO

CREATE DATABASE nplaylist_persistance;
GO

USE nplaylist_persistance;

EXEC sp_configure 'CONTAINED DATABASE AUTHENTICATION', 1
GO

RECONFIGURE
GO

USE [master]
GO
ALTER DATABASE [nplaylist_persistance] SET CONTAINMENT = PARTIAL
GO

RECONFIGURE
GO

USE nplaylist_persistance;
GO

CREATE USER sa WITH PASSWORD = 'Password123'
GO

EXEC sp_addrolemember N'db_owner', N'sa'
GO
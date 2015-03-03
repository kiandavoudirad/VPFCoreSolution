﻿/*
Deployment script for SQLVPFCoreProject

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "SQLVPFCoreProject"
:setvar DefaultFilePrefix "SQLVPFCoreProject"
:setvar DefaultDataPath "C:\Users\KDavoudiRad\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\v11.0\"
:setvar DefaultLogPath "C:\Users\KDavoudiRad\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\v11.0\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Creating [dbo].[VPFCore]...';


GO
CREATE TABLE [dbo].[VPFCore] (
    [CoreId]       INT         NOT NULL,
    [Data]         NCHAR (150) NOT NULL,
    [Privilege]    NCHAR (50)  NOT NULL,
    [MenuID]       INT         NOT NULL,
    [ParentMenuID] INT         NOT NULL,
    [ResourceKey]  NCHAR (50)  NOT NULL,
    CONSTRAINT [PK_VPFCore] PRIMARY KEY CLUSTERED ([MenuID] ASC)
);


GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]		
			   
			   
 CREATE TABLE [dbo].[VPFCore]
(
	[CoreId] INT NOT NULL, 
    [Data] NCHAR(150) NOT NULL,
	[Privilege] NCHaR(50) NOT NULL, 
    [MenuID] NCHAR(10) NOT NULL ,
	[ParentMenuID] INT NOT NULL,
	[ResourceKey] INT NOT NULL, 
    CONSTRAINT [PK_VPFCore] PRIMARY KEY ([MenuID])
	)			
--------------------------------------------------------------------------------------
*/
INSERT INTO [dbo].[VPFCore] ([CoreId], [Data], [Privilege], [MenuID], [ParentMenuID], [ResourceKey]) VALUES  (0,'Data','Admin',10811,108,'ResourceKey');
GO

GO
PRINT N'Update complete.';


GO

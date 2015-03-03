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
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creating [dbo].[VPFCores]...';


GO
CREATE TABLE [dbo].[VPFCores] (
    [CoreId]       INT            NOT NULL,
    [Data]         VARCHAR (8000) NOT NULL,
    [Privilege]    NCHAR (50)     NOT NULL,
    [MenuID]       INT            NOT NULL,
    [ParentMenuID] INT            NOT NULL,
    [ResourceKey]  NCHAR (50)     NOT NULL,
    CONSTRAINT [PK_VPFCores] PRIMARY KEY CLUSTERED ([MenuID] ASC)
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
INSERT INTO [dbo].[VPFCores] ([CoreId], [Data], [Privilege], [MenuID], [ParentMenuID], [ResourceKey]) VALUES  (1,'<svg width="640" height="480" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg"> <!-- Created with SVG-edit - http://svg-edit.googlecode.com/ --> <g>  <title>Layer 1</title>  <text xml:space="preserve" y="107.84" x="289.61" text-anchor="middle" stroke-width="0" stroke="#000000" fill="#000000" style="cursor: move; pointer-events: inherit;" font-size="24" font-family="serif" id="svg_1">Sage VPF</text>  <rect height="219.13" width="477.39" y="139.15" x="80.04" stroke-width="5" stroke="#000000" fill="#d60404" id="svg_2"/>  <polygon strokeWidth="5" strokecolor="#000000" orient="point" r2="22.26506" r="55.66265" point="5" shape="star" cy="209.57997" cx="134.82999" points="134.83,153.917 147.917,191.567 187.768,192.379 156.005,216.46 167.548,254.612 134.83,231.845 102.112,254.612 113.655,216.46 81.8917,192.379 121.743,191.567 134.83,153.917 147.917,191.567" stroke-width="5" stroke="#000000" fill="#d60404" id="svg_3"/>  <polygon strokeWidth="5" strokecolor="#000000" orient="point" r2="26.2374" r="65.59349" point="5" shape="star" cy="174.79997" cx="415.70001" points="415.7,109.206 431.122,153.573 478.083,154.53 440.653,182.908 454.255,227.866 415.7,201.037 377.145,227.866 390.747,182.908 353.317,154.53 400.278,153.573 415.7,109.206 431.122,153.573" stroke-width="5" stroke="#000000" fill="#d60404" id="svg_4"/>  <polygon strokeWidth="5" strokecolor="#000000" orient="point" r2="6.06826" r="15.17064" point="5" shape="star" cy="164.36998" cx="408.73999" points="408.74,149.199 412.307,159.461 423.168,159.682 414.511,166.245 417.657,176.643 408.74,170.438 399.823,176.643 402.969,166.245 394.312,159.682 405.173,159.461 408.74,149.199 412.307,159.461" stroke-width="5" stroke="#000000" fill="#d60404" id="svg_5"/> </g></svg>
','Admin',108101,108,'ResourceKey');
INSERT INTO [dbo].[VPFCores] ([CoreId], [Data], [Privilege], [MenuID], [ParentMenuID], [ResourceKey]) VALUES  (2,'<svg width="640" height="480" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg"><g><title>Layer 1</title><rect id="svg_1" height="112" width="136" y="101" x="88" stroke-linecap="null" stroke-linejoin="null" stroke-dasharray="null" stroke-width="5" stroke="#000000" fill="#FF0000"/><text xml:space="preserve" text-anchor="middle" font-family="serif" font-size="24" id="svg_2" y="125" x="372" stroke-linecap="null" stroke-linejoin="null" stroke-dasharray="null" stroke-width="0" stroke="#000000" fill="#000000">AR Transaction</text></g></svg>','Admin',108102,108,'ResourceKey');
INSERT INTO [dbo].[VPFCores] ([CoreId], [Data], [Privilege], [MenuID], [ParentMenuID], [ResourceKey]) VALUES  (3,'<svg width="640" height="480" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g><title>Layer 1</title><text style="cursor: move;" xml:space="preserve" text-anchor="middle" font-family="serif" font-size="24" id="svg_6" y="187" x="351" stroke-width="0" stroke="#000000" fill="#ff2626">BL Transaction</text><ellipse ry="40" rx="65" id="svg_10" cy="74" cx="185" stroke-linecap="null" stroke-linejoin="null" stroke-dasharray="null" stroke-width="5" stroke="#000000" fill="#3f7f00"/><line id="svg_11" y2="75" x2="494" y1="71" x1="234" stroke-linecap="null" stroke-linejoin="null" stroke-dasharray="null" stroke-width="5" stroke="#000000" fill="none"/><line id="svg_12" y2="37" x2="471" y1="68" x1="319" stroke-linecap="null" stroke-linejoin="null" stroke-dasharray="null" stroke-width="5" stroke="#000000" fill="none"/><a xlink:href="http://www.google.com" id="svg_15"><polygon stroke-width="5" stroke="#000000" points="83.12568421663096,189 58.16345035636178,223.35756737984786 17.773707535322743,210.23414441151064 17.773707535322735,167.76585558848936 58.16345035636177,154.64243262015214 83.12568421663096,189 " strokeWidth="5" strokecolor="#000000" fill="#7f7f00" edge="42.46829" orient="x" sides="5" shape="regularPoly" id="svg_14" cy="189" cx="47"/></a></g></svg>',108103,108,'ResourceKey');
INSERT INTO [dbo].[VPFCores] ([CoreId], [Data], [Privilege], [MenuID], [ParentMenuID], [ResourceKey]) VALUES  (4,'<svg width="640" height="480" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g><title>Layer 1</title><text style="cursor: move;" xml:space="preserve" text-anchor="middle" font-family="serif" font-size="24" id="svg_2" y="125" x="372" stroke-linecap="null" stroke-linejoin="null" stroke-dasharray="null" stroke-width="0" stroke="#000000" fill="#000000">CP Transaction</text><a xlink:href="http://www.google.com" id="svg_3"> <rect opacity="0.75" id="svg_1" height="125" width="446" y="63" x="154" stroke-linecap="null" stroke-linejoin="null" stroke-dasharray="null" stroke-width="0" stroke="#d61b1b" fill="#00cbff"/></a><path id="svg_8" d="m177.14749,225.50417c116.32071,-68.56268 232.64273,68.56773 348.96658,0l0,123.41722c-116.32385,68.56732 -232.64587,-68.56253 -348.96658,0l0,-123.41722z" opacity="0.75" stroke-linecap="null" stroke-linejoin="null" stroke-dasharray="null" stroke-width="0" stroke="#8e1212" fill="#7f0000"/><text xml:space="preserve" text-anchor="middle" font-family="serif" font-size="24" id="svg_9" y="290" x="376" opacity="0.75" stroke-linecap="null" stroke-linejoin="null" stroke-dasharray="null" stroke-width="0" stroke="#8e1212" fill="#000000">Click on Blue Square!</text></g></svg>','Admin',108104,108,'ResourceKey');
GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Update complete.';


GO

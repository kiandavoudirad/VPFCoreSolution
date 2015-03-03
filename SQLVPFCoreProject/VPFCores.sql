CREATE TABLE [dbo].[VPFCores]
(
	[CoreId] INT NOT NULL, 
    [Data]VARCHAR(8000) NOT NULL,
	[Privilege] NCHaR(50) NOT NULL, 
    [MenuID] INT NOT NULL ,
	[ParentMenuID] INT  NOT NULL,
	[ResourceKey] NCHAR(50) NOT NULL, 
    CONSTRAINT [PK_VPFCores] PRIMARY KEY ([MenuID]) 
	)
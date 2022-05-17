
CREATE TABLE [ods].[CPR_ADJTYPE](
	[RecordID] [INT] IDENTITY(1, 1) NOT NULL,
	[CPK_ADJTYPE] [int] NOT NULL,
	[TEXT_] [varchar](20) NULL,
	[CODE] [varchar](5) NULL,
	[GLACCT] [varchar](20) NULL,
	[GLDEPT] [varchar](10) NULL,
	[DELFLAG] [int] NOT NULL,
	[TOUCHDATE] [datetime] NULL,
	[CHGBYHOST] [varchar](100) NULL,
	[CREATEDON] [datetime] NULL,
	[CREATEDBY] [varchar](100) NULL,
	[EffectiveDate] [DATETIME] NULL,
    [ExpirationDate] [DATETIME] NULL,    
    [CurrentRowFlag] [BIT] NOT NULL,
    [DeleteRowFlag] [BIT] NOT NULL,
    [InsertDate] [DATETIME] NULL,
    [UpdateDate] [DATETIME] NULL,
    CONSTRAINT [PKods.CPR_ADJTYPE.RecordID]
        PRIMARY KEY CLUSTERED ([RecordID] ASC)
) ON [PRIMARY]
GO
ALTER TABLE [ods].[CPR_ADJTYPE]
ADD CONSTRAINT [ods.CPR_ADJTYPEEffectiveDate]
    DEFAULT (GETDATE()) FOR [EffectiveDate]
GO
ALTER TABLE [ods].[CPR_ADJTYPE]
ADD CONSTRAINT [ods.CPR_ADJTYPEDeleteRowFlag]
    DEFAULT ((0)) FOR [DeleteRowFlag]
GO
ALTER TABLE [ods].[CPR_ADJTYPE]
ADD CONSTRAINT [ods.CPR_ADJTYPEInsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]
GO

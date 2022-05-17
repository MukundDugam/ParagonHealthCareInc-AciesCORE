CREATE TABLE [ods].[CPR_PTDAYS](
	[RecordID] [INT] IDENTITY(1, 1) NOT NULL,
	[CPK_PTDAYS] [int] NOT NULL,
	[MRN] [varchar](6) NULL,
	[NEW_STAT] [varchar](9) NULL,
	[STAT_DATE] [datetime] NULL,
	[NOTES] [varchar](50) NULL,
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
 CONSTRAINT [PKods_CPR_PTDAYS.RecordID] PRIMARY KEY CLUSTERED ([RecordID] ASC)

) ON [PRIMARY]
GO
GO
ALTER TABLE [ods].[CPR_PTDAYS]
ADD CONSTRAINT [ods.CPR_PTDAYSEffectiveDate]
    DEFAULT (GETDATE()) FOR [EffectiveDate]
GO
ALTER TABLE [ods].[CPR_PTDAYS]
ADD CONSTRAINT [ods.CPR_PTDAYSDeleteRowFlag]
    DEFAULT ((0)) FOR [DeleteRowFlag]
GO
ALTER TABLE [ods].[CPR_PTDAYS]
ADD CONSTRAINT [ods.CPR_PTDAYSInsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]
GO


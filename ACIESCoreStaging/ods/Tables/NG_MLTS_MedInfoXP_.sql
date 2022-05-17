CREATE TABLE [ods].[NG_MLTS_MedInfoXP_]
(
	[RecordID]	[INT] IDENTITY(1, 1) NOT NULL,
	[seq_no] [uniqueidentifier] NOT NULL,
	[practice_id] [char](4) NULL,
	[created_by] [int] NOT NULL,
	[create_timestamp] [datetime] NOT NULL,
	[modified_by] [int] NOT NULL,
	[modify_timestamp] [datetime] NOT NULL,
	[create_timestamp_tz] [smallint] NULL,
	[modify_timestamp_tz] [smallint] NULL,
	[row_timestamp] [varchar](50) NOT NULL,
	[ActiveInd] [varchar](1) NULL,
	[DrugName] [varchar](100) NULL,
	[Jcode] [varchar](20) NULL,
	[Manufacturer] [varchar](50) NULL,
	[NDC] [varchar](15) NULL,
	[SimDescription] [varchar](80) NULL,
	[UnitType] [varchar](10) NULL,
	[Category] [varchar](100) NULL,
	[sim_descripton] [varchar](100) NULL,
	[Admin_InitialHr] [varchar](20) NULL,
	[Admin_AddlHr] [varchar](20) NULL,
	[Admin_Seq] [varchar](20) NULL,
	[Admin_Concurrent] [varchar](20) NULL,
	[Admin_IVPInitial] [varchar](20) NULL,
	[Admin_IVPSeq] [varchar](20) NULL,
	[Admin_Inj] [varchar](20) NULL,
	[SalesLevel] [varchar](100) NULL,
	[ChronicAcute] [varchar](10) NULL,
	[EffectiveDate] [DATETIME] NULL,
    [ExpirationDate] [DATETIME] NULL,    
    [CurrentRowFlag] [BIT] NOT NULL,
    [DeleteRowFlag] [BIT] NOT NULL,
    [InsertDate] [DATETIME] NULL,
    [UpdateDate] [DATETIME] NULL,
    CONSTRAINT [PKods.NG_MLTS_MedInfoXP_.RecordID]
        PRIMARY KEY CLUSTERED ([RecordID] ASC)
) ON [PRIMARY]
GO
ALTER TABLE [ods].[NG_MLTS_MedInfoXP_]
ADD CONSTRAINT [ods.NG_MLTS_MedInfoXP_EffectiveDate]
    DEFAULT (GETDATE()) FOR [EffectiveDate]
GO
ALTER TABLE [ods].[NG_MLTS_MedInfoXP_]
ADD CONSTRAINT [ods.NG_MLTS_MedInfoXP_DeleteRowFlag]
    DEFAULT ((0)) FOR [DeleteRowFlag]
GO
ALTER TABLE [ods].[NG_MLTS_MedInfoXP_]
ADD CONSTRAINT [ods.NG_MLTS_MedInfoXP_InsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]
GO
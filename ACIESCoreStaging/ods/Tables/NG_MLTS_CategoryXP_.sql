CREATE TABLE [ods].[NG_MLTS_CategoryXP_]
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
	[Category] [varchar](100) NULL,
	[Acuity] [int] NULL,
	[SalesLevel] [varchar](10) NULL,
	[ChronicAcute] [varchar](10) NULL,
	[EffectiveDate] [DATETIME] NULL,
    [ExpirationDate] [DATETIME] NULL,    
    [CurrentRowFlag] [BIT] NOT NULL,
    [DeleteRowFlag] [BIT] NOT NULL,
    [InsertDate] [DATETIME] NULL,
    [UpdateDate] [DATETIME] NULL,
    CONSTRAINT [PKods.NG_MLTS_CategoryXP_.RecordID]
        PRIMARY KEY CLUSTERED ([RecordID] ASC)
) ON [PRIMARY]
GO
ALTER TABLE [ods].[NG_MLTS_CategoryXP_]
ADD CONSTRAINT [ods.NG_MLTS_CategoryXP_EffectiveDate]
    DEFAULT (GETDATE()) FOR [EffectiveDate]
GO
ALTER TABLE [ods].[NG_MLTS_CategoryXP_]
ADD CONSTRAINT [ods.NG_MLTS_CategoryXP_DeleteRowFlag]
    DEFAULT ((0)) FOR [DeleteRowFlag]
GO
ALTER TABLE [ods].[NG_MLTS_CategoryXP_]
ADD CONSTRAINT [ods.NG_MLTS_CategoryXP_InsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]
GO
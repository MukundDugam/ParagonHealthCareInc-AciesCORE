CREATE TABLE [ods].[NG_code_tables]
(
	[RecordID] [INT] IDENTITY(1, 1) NOT NULL,
	[code_type] [varchar](30) NOT NULL,
	[code] [varchar](25) NOT NULL,
	[description] [varchar](200) NOT NULL,
	[delete_ind] [char](1) NOT NULL,
	[create_timestamp] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[modify_timestamp] [datetime] NOT NULL,
	[modified_by] [int] NOT NULL,
	[row_timestamp] [varchar](50) NOT NULL,
	[attribute1] [varchar](10) NULL,
	[EffectiveDate] [DATETIME] NULL,
    [ExpirationDate] [DATETIME] NULL,    
    [CurrentRowFlag] [BIT] NOT NULL,
    [DeleteRowFlag] [BIT] NOT NULL,
    [InsertDate] [DATETIME] NULL,
    [UpdateDate] [DATETIME] NULL,
    CONSTRAINT [PKods.NG_code_tables.RecordID]
        PRIMARY KEY CLUSTERED ([RecordID] ASC)
) ON [PRIMARY]
GO
ALTER TABLE [ods].[NG_code_tables]
ADD CONSTRAINT [ods.NG_code_tablesEffectiveDate]
    DEFAULT (GETDATE()) FOR [EffectiveDate]
GO
ALTER TABLE [ods].[NG_code_tables]
ADD CONSTRAINT [ods.NG_code_tablesDeleteRowFlag]
    DEFAULT ((0)) FOR [DeleteRowFlag]
GO
ALTER TABLE [ods].[NG_code_tables]
ADD CONSTRAINT [ods.NG_code_tablesInsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]
GO
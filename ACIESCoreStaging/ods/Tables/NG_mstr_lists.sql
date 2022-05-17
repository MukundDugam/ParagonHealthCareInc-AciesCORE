CREATE TABLE [ods].[NG_mstr_lists]
(
    [RecordID] [INT] IDENTITY(1, 1) NOT NULL,
 	[mstr_list_type] [varchar](30) NOT NULL,
	[mstr_list_item_id] [uniqueidentifier] NOT NULL,
	[mstr_list_item_desc] [varchar](100) NOT NULL,
	[list_order] [int] NULL,
	[cache_ind] [char](1) NOT NULL,
	[external_id] [varchar](20) NULL,
	[delete_ind] [char](1) NOT NULL,
	[create_timestamp] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[modify_timestamp] [datetime] NOT NULL,
	[modified_by] [int] NOT NULL,
	[row_timestamp] [varchar](50) NOT NULL,
	[show_in_emr_ind] [char](1) NOT NULL,
	[enterprise_id] [char](5) NOT NULL,
	[practice_id] [char](4) NOT NULL,
	[nxmd_ind] [char](1) NOT NULL,
	[EffectiveDate] [DATETIME] NULL,
    [ExpirationDate] [DATETIME] NULL,    
    [CurrentRowFlag] [BIT] NOT NULL,
    [DeleteRowFlag] [BIT] NOT NULL,
    [InsertDate] [DATETIME] NULL,
    [UpdateDate] [DATETIME] NULL,
    CONSTRAINT [PKods.NG_mstr_lists.RecordID]
        PRIMARY KEY CLUSTERED ([RecordID] ASC)
) ON [PRIMARY]
GO
ALTER TABLE [ods].[NG_mstr_lists]
ADD CONSTRAINT [ods.NG_mstr_listsEffectiveDate]
    DEFAULT (GETDATE()) FOR [EffectiveDate]
GO
ALTER TABLE [ods].[NG_mstr_lists]
ADD CONSTRAINT [ods.NG_mstr_listsDeleteRowFlag]
    DEFAULT ((0)) FOR [DeleteRowFlag]
GO
ALTER TABLE [ods].[NG_mstr_lists]
ADD CONSTRAINT [ods.NG_mstr_listsInsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]
GO
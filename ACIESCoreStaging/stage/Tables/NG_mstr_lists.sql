CREATE TABLE [stage].[NG_mstr_lists]
(
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
	InsertDate DATETIME
        CONSTRAINT [pk_mstr_lists]
        PRIMARY KEY CLUSTERED (	[mstr_list_item_id] ASC,
	[enterprise_id] ASC)
)
GO
ALTER TABLE [stage].[NG_mstr_lists]
ADD CONSTRAINT [stage.NG_mstr_listsInsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]

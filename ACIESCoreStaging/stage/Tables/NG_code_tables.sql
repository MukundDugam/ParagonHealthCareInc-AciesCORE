CREATE TABLE [stage].[NG_code_tables]
(
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
    [InsertDate]                   DATETIME,
    CONSTRAINT [pk_code_tables]
        PRIMARY KEY NONCLUSTERED (	[code_type] ASC,
	[code] ASC)
);
GO
ALTER TABLE [stage].[NG_code_tables]
ADD CONSTRAINT [stage.NG_code_tablesInsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]
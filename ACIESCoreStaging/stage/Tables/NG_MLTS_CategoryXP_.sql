CREATE TABLE [stage].[NG_MLTS_CategoryXP_]
(
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
	[InsertDate]   DATETIME,
    CONSTRAINT [pk_MLTS_CategoryXP_]
        PRIMARY KEY NONCLUSTERED ([seq_no] ASC)
);
GO
ALTER TABLE [stage].[NG_MLTS_CategoryXP_]
ADD CONSTRAINT [stage.NG_MLTS_CategoryXP_InsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]
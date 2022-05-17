﻿  CREATE TABLE [stage].[CPR_PTDAYS](
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
	[InsertDate] DATETIME,
 CONSTRAINT [CN__PTDAYS_CPR_PTDAYS] PRIMARY KEY CLUSTERED 
(
	[CPK_PTDAYS] ASC
)
)
GO
ALTER TABLE [stage].[CPR_PTDAYS]
ADD CONSTRAINT [stage.CPR_PTDAYSInsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]
CREATE TABLE [stage].[NG_person_relationship]
(
	[person_id] [uniqueidentifier] NOT NULL,
	[related_person_id] [uniqueidentifier] NOT NULL,
	[relation_code] [char](3) NULL,
	[delete_ind] [char](1) NOT NULL,
	[create_timestamp] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[modified_by] [int] NOT NULL,
	[modify_timestamp] [datetime] NOT NULL,
	[row_timestamp] [varchar](50) NOT NULL,
	[create_timestamp_tz] [smallint] NULL,
	[modify_timestamp_tz] [smallint] NULL,
    [InsertDate]                   DATETIME,
    CONSTRAINT [pk_person_relationshhip]
        PRIMARY KEY NONCLUSTERED (	[person_id] ASC,
	[related_person_id] ASC,
	[delete_ind] ASC)
);
GO
ALTER TABLE [stage].[NG_person_relationship]
ADD CONSTRAINT [stage.NG_person_relationshipInsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]
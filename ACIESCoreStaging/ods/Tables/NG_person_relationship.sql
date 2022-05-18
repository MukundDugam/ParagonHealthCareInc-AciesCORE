CREATE TABLE [ods].[NG_person_relationship]
(
	[RecordID]					[INT] IDENTITY(1, 1) NOT NULL,
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
	[EffectiveDate] [DATETIME] NULL,
    [ExpirationDate] [DATETIME] NULL,    
    [CurrentRowFlag] [BIT] NOT NULL,
    [DeleteRowFlag] [BIT] NOT NULL,
    [InsertDate] [DATETIME] NULL,
    [UpdateDate] [DATETIME] NULL,
    CONSTRAINT [PKods.NG_person_relationship.RecordID]
        PRIMARY KEY CLUSTERED ([RecordID] ASC)
) ON [PRIMARY]
GO
ALTER TABLE [ods].[NG_person_relationship]
ADD CONSTRAINT [ods.NG_person_relationshipEffectiveDate]
    DEFAULT (GETDATE()) FOR [EffectiveDate]
GO
ALTER TABLE [ods].[NG_person_relationship]
ADD CONSTRAINT [ods.NG_person_relationshipDeleteRowFlag]
    DEFAULT ((0)) FOR [DeleteRowFlag]
GO
ALTER TABLE [ods].[NG_person_relationship]
ADD CONSTRAINT [ods.NG_person_relationshipInsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]
GO
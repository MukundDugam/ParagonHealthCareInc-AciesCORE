CREATE TABLE [ods].[NG_practice_payers_person]
(
	[RecordID] [INT] IDENTITY(1, 1) NOT NULL,
	[practice_id] [char](4) NOT NULL,
	[person_payer_id] [uniqueidentifier] NOT NULL,
	[payer_id] [uniqueidentifier] NULL,
	[person_id] [uniqueidentifier] NULL,
	[copay_amt] [numeric](19, 2) NULL,
	[deductible] [numeric](19, 2) NULL,
	[notify_ind] [char](1) NOT NULL,
	[verify_ind] [char](1) NOT NULL,
	[precert_ind] [char](1) NOT NULL,
	[copay_type] [char](1) NULL,
	[copay_percent] [int] NULL,
	[create_timestamp] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[modify_timestamp] [datetime] NOT NULL,
	[modified_by] [int] NOT NULL,
	[row_timestamp] [varchar](50) NOT NULL,
	[referral_ind] [char](1) NOT NULL,
    [EffectiveDate] [DATETIME] NULL,
    [ExpirationDate] [DATETIME] NULL,    
    [CurrentRowFlag] [BIT] NOT NULL,
    [DeleteRowFlag] [BIT] NOT NULL,
    [InsertDate] [DATETIME] NULL,
    [UpdateDate] [DATETIME] NULL,
    CONSTRAINT [PKods.NG_practice_payers_person.RecordID]
        PRIMARY KEY CLUSTERED ([RecordID] ASC)
) ON [PRIMARY]
GO
ALTER TABLE [ods].[NG_practice_payers_person]
ADD CONSTRAINT [ods.NG_practice_payers_personEffectiveDate]
    DEFAULT (GETDATE()) FOR [EffectiveDate]
GO
ALTER TABLE [ods].[NG_practice_payers_person]
ADD CONSTRAINT [ods.NG_practice_payers_personDeleteRowFlag]
    DEFAULT ((0)) FOR [DeleteRowFlag]
GO
ALTER TABLE [ods].[NG_practice_payers_person]
ADD CONSTRAINT [ods.NG_practice_payers_personInsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]
GO
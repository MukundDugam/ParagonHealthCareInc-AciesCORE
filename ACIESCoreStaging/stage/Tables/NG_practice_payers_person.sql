CREATE TABLE [stage].[NG_practice_payers_person]
(
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
	[InsertDate]                   DATETIME,
    CONSTRAINT [pk_practice_payers_person]
        PRIMARY KEY NONCLUSTERED (	[person_payer_id] ASC,
	[practice_id] ASC)
);
GO
ALTER TABLE [stage].[NG_practice_payers_person]
ADD CONSTRAINT [stage.NG_practice_payers_personInsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]
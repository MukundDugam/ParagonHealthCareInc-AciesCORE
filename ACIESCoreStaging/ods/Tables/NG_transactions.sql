CREATE TABLE [ods].[NG_transactions]
(
	[RecordID]					[INT] IDENTITY(1, 1) NOT NULL,
	[trans_id] [uniqueidentifier] NOT NULL,
	[practice_id] [char](4) NOT NULL,
	[source_id] [uniqueidentifier] NULL,
	[source_type] [char](1) NULL,
	[batch_nbr] [char](4) NULL,
	[batch_date] [varchar](8) NULL,
	[batch_item_nbr] [numeric](12, 0) NULL,
	[person_id] [uniqueidentifier] NULL,
	[insured_person_id] [uniqueidentifier] NULL,
	[payer_id] [uniqueidentifier] NULL,
	[tran_date] [datetime] NOT NULL,
	[type] [char](1) NOT NULL,
	[tran_amt] [numeric](19, 2) NOT NULL,
	[tran_code_id] [uniqueidentifier] NOT NULL,
	[billed_amt] [numeric](19, 2) NULL,
	[approved_amt] [numeric](19, 2) NULL,
	[source] [char](1) NULL,
	[post_ind] [char](1) NOT NULL,
	[post_date] [varchar](8) NULL,
	[tracking_desc_40] [varchar](80) NULL,
	[transfer_id] [uniqueidentifier] NULL,
	[transfer_type] [char](1) NULL,
	[link_id] [uniqueidentifier] NULL,
	[closing_date] [varchar](8) NULL,
	[override_closing_date] [varchar](8) NULL,
	[reason_codes_display_only] [varchar](1000) NULL,
	[person_payer_id] [uniqueidentifier] NULL,
	[alt_payer_ind] [char](1) NOT NULL,
	[alt_req_both_payments_id] [uniqueidentifier] NULL,
	[create_timestamp] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[modify_timestamp] [datetime] NOT NULL,
	[modified_by] [int] NOT NULL,
	[row_timestamp] [varchar](50) NOT NULL,
	[era_post_ind] [char](1) NOT NULL,
	[resubmission_reference_nbr] [varchar](50) NULL,
	[reversal_trans_id] [uniqueidentifier] NULL,
	[clm_lvl_remarks] [varchar](1000) NULL,
	[transaction_notes] [varchar](8000) NULL,
	[disc_reversal_ind] [char](1) NOT NULL,
	[disc_spread_type] [char](1) NULL,
	[disc_spread_percent] [char](3) NULL,
	[refund_address_line1] [varchar](55) NULL,
	[refund_address_line2] [varchar](55) NULL,
	[refund_city] [varchar](35) NULL,
	[refund_state] [varchar](3) NULL,
	[refund_zip] [varchar](9) NULL,
	[refund_country_id] [uniqueidentifier] NULL,
	[refund_county_id] [uniqueidentifier] NULL,
	[disc_level] [char](1) NULL,
	[parent_batch_nbr] [char](4) NULL,
	[parent_batch_date] [varchar](8) NULL,
	[reconciled_ind] [char](1) NOT NULL,
	[external_id1] [varchar](12) NULL,
	[external_id2] [varchar](30) NULL,
	[refund_to_name] [varchar](122) NULL,
	[refund_pat_type] [char](1) NULL,
	[apc_ind] [char](1) NOT NULL,
    [EffectiveDate] [DATETIME] NULL,
    [ExpirationDate] [DATETIME] NULL,    
    [CurrentRowFlag] [BIT] NOT NULL,
    [DeleteRowFlag] [BIT] NOT NULL,
    [InsertDate] [DATETIME] NULL,
    [UpdateDate] [DATETIME] NULL,
    CONSTRAINT [PKods.NG_transaction.RecordID]
        PRIMARY KEY CLUSTERED ([RecordID] ASC)
) ON [PRIMARY]
GO
ALTER TABLE [ods].[NG_transactions]
ADD CONSTRAINT [ods.NG_transactionEffectiveDate]
    DEFAULT (GETDATE()) FOR [EffectiveDate]
GO
ALTER TABLE [ods].[NG_transactions]
ADD CONSTRAINT [ods.NG_transactionDeleteRowFlag]
    DEFAULT ((0)) FOR [DeleteRowFlag]
GO
ALTER TABLE [ods].[NG_transactions]
ADD CONSTRAINT [ods.NG_transactionInsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]
GO
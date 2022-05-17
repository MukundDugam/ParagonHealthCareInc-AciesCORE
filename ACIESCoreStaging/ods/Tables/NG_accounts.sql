CREATE TABLE [ods].[NG_accounts]
(
    [RecordID] [INT] IDENTITY(1, 1) NOT NULL,
	[enterprise_id] [char](5) NOT NULL,
	[practice_id] [char](4) NOT NULL,
	[site_id] [char](3) NOT NULL,
	[acct_id] [uniqueidentifier] NOT NULL,
	[acct_nbr] [numeric](12, 0) NOT NULL,
	[guar_id] [uniqueidentifier] NULL,
	[guar_type] [char](1) NOT NULL,
	[print_stmt_ind] [char](1) NOT NULL,
	[print_invoice_ind] [char](1) NOT NULL,
	[last_stmt_date] [varchar](8) NULL,
	[last_letter_date] [varchar](8) NULL,
	[last_budget_letter_date] [varchar](8) NULL,
	[last_invoice_date] [varchar](8) NULL,
	[budget_enabled_ind] [char](1) NOT NULL,
	[budget_date] [varchar](8) NULL,
	[budget_due_date] [varchar](8) NULL,
	[budget_cycle] [char](1) NULL,
	[budget_num_payments] [int] NULL,
	[budget_payment_amt] [numeric](19, 2) NULL,
	[budget_total] [numeric](19, 2) NULL,
	[budget_delinquent_date] [varchar](8) NULL,
	[budget_termination_date] [varchar](8) NULL,
	[stmt_day_of_month] [smallint] NULL,
	[budget_day_of_month] [smallint] NULL,
	[invoice_day_of_month] [smallint] NULL,
	[status] [char](1) NULL,
	[next_stmt_date] [varchar](8) NULL,
	[next_invoice_date] [varchar](8) NULL,
	[force_stmt_ind] [char](1) NOT NULL,
	[credit_rating] [char](1) NULL,
	[last_self_pay_date] [varchar](8) NULL,
	[suppress_dunning_msg_ind] [char](1) NOT NULL,
	[last_print_stmt_date] [varchar](8) NULL,
	[create_timestamp] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[modify_timestamp] [datetime] NOT NULL,
	[modified_by] [int] NOT NULL,
	[row_timestamp] [varchar](30) NOT NULL,
	[outsource_exempt_ind] [char](1) NOT NULL,
	[statement_counter] [int] NOT NULL,
	[send_coll_letter_ind] [char](1) NOT NULL,
	[collection_letter_id] [uniqueidentifier] NULL,
	[last_nxmd_stmt_date] [varchar](8) NULL,
	[last_pat_pay_amt] [numeric](19, 2) NULL,
	[last_pat_pay_date] [varchar](8) NULL,
	[last_bad_debt_pay_amt] [numeric](19, 2) NULL,
	[last_bad_debt_pay_date] [varchar](8) NULL,
	[last_consent_form_id] [uniqueidentifier] NULL,
	[last_consent_print_by] [int] NULL,
	[last_consent_print_date] [datetime] NULL,
	[EffectiveDate] [DATETIME] NULL,
    [ExpirationDate] [DATETIME] NULL,    
    [CurrentRowFlag] [BIT] NOT NULL,
    [DeleteRowFlag] [BIT] NOT NULL,
    [InsertDate] [DATETIME] NULL,
    [UpdateDate] [DATETIME] NULL,
    CONSTRAINT [PKods.NG_accounts.RecordID]
        PRIMARY KEY CLUSTERED ([RecordID] ASC)
) ON [PRIMARY]
GO
ALTER TABLE [ods].[NG_accounts]
ADD CONSTRAINT [ods.NG_accoountsEffectiveDate]
    DEFAULT (GETDATE()) FOR [EffectiveDate]
GO
ALTER TABLE [ods].[NG_accounts]
ADD CONSTRAINT [ods.NG_accountsDeleteRowFlag]
    DEFAULT ((0)) FOR [DeleteRowFlag]
GO
ALTER TABLE [ods].[NG_accounts]
ADD CONSTRAINT [ods.NG_accountsInsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]
GO
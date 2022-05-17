CREATE TABLE [stage].[NG_tran_code_mstr]
(
	[tran_code_id] [uniqueidentifier] NOT NULL,
	[type] [char](1) NOT NULL,
	[source] [char](1) NOT NULL,
	[description] [varchar](40) NOT NULL,
	[sign_type] [smallint] NOT NULL,
	[allow_sign_override_ind] [char](1) NOT NULL,
	[delete_ind] [char](1) NOT NULL,
	[create_timestamp] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[modify_timestamp] [datetime] NOT NULL,
	[modified_by] [int] NOT NULL,
	[row_timestamp] [varchar](50) NOT NULL,
	[bad_debt_only_ind] [char](1) NOT NULL,
	[note] [varchar](255) NULL,
	[optical_transaction_ind] [char](1) NOT NULL,
	[discount_ind] [char](1) NOT NULL,
	[not_payment_entry_ind] [char](1) NOT NULL,
	[in_progress_ind] [char](1) NOT NULL,
	[contracted_payers_ind] [char](1) NOT NULL,
	[non_contracted_payers_ind] [char](1) NOT NULL,
	[discount_app_none_ind] [char](1) NOT NULL,
	InsertDate DATETIME
        CONSTRAINT [pk_trans_code_mstr]
        PRIMARY KEY CLUSTERED ([tran_code_id] ASC)
)
GO
ALTER TABLE [stage].[NG_tran_code_mstr]
ADD CONSTRAINT [stage.NG_tran_code_mstrInsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]

CREATE TABLE [stage].[NG_encounter_payer]
(
	[enterprise_id] [char](5) NOT NULL,
	[practice_id] [char](4) NOT NULL,
	[person_id] [uniqueidentifier] NOT NULL,
	[enc_id] [uniqueidentifier] NOT NULL,
	[cob] [int] NOT NULL,
	[payer_id] [uniqueidentifier] NOT NULL,
	[person_payer_id] [uniqueidentifier] NOT NULL,
	[insured_person_id] [uniqueidentifier] NULL,
	[encounter_copay_amt] [numeric](19, 2) NULL,
	[ins_type] [char](2) NULL,
	[claim_type] [char](2) NULL,
	[notify_user_id] [varchar](20) NULL,
	[verify_date] [varchar](8) NULL,
	[precert_nbr] [varchar](50) NULL,
	[assign_benefits_code] [char](1) NOT NULL,
	[release_of_info] [char](2) NULL,
	[pro_date] [varchar](8) NULL,
	[pro_procedure] [varchar](10) NULL,
	[pro_state] [varchar](10) NULL,
	[opt_claim_value_1] [varchar](20) NULL,
	[notify_date] [varchar](8) NULL,
	[verify_user_id] [varchar](20) NULL,
	[gabetterhealth_nbr] [varchar](30) NULL,
	[use_rem_enc_auth_ind] [char](1) NOT NULL,
	[auth_code_id] [uniqueidentifier] NULL,
	[created_by] [int] NOT NULL,
	[modified_by] [int] NOT NULL,
	[create_timestamp] [datetime] NOT NULL,
	[modify_timestamp] [datetime] NOT NULL,
	[row_timestamp] [varchar](50) NOT NULL,
	[copay_exempt_ind] [char](1) NOT NULL,
	[referral_nbr] [varchar](50) NULL,
	[referral_id] [uniqueidentifier] NULL,
	[use_rem_enc_ref_ind] [char](1) NOT NULL,
	[pm_ind] [char](1) NOT NULL,
	[property_casualty_nbr] [varchar](50) NULL,
	[Appl_placed_date] [varchar](8) NULL,
	[Appl_rmved_date] [varchar](8) NULL,
    InsertDate DATETIME
        CONSTRAINT [pk_encounter_payer]
        PRIMARY KEY CLUSTERED (	[enc_id] ASC, [person_payer_id] ASC)
)
GO
ALTER TABLE [stage].[NG_encounter_payer]
ADD CONSTRAINT [stage.NG_encounter_payerInsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]

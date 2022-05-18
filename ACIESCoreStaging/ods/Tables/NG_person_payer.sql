﻿CREATE TABLE [ods].[NG_person_payer]
(
	[RecordID]					[INT] IDENTITY(1, 1) NOT NULL,
	[person_id] [uniqueidentifier] NULL,
	[payer_id] [uniqueidentifier] NULL,
	[person_payer_id] [uniqueidentifier] NOT NULL,
	[bc_plan_code] [varchar](30) NULL,
	[active_ind] [char](1) NOT NULL,
	[copay_amt] [numeric](19, 2) NULL,
	[deductible_amt] [numeric](19, 2) NULL,
	[copay_type] [char](1) NULL,
	[copay_percent] [int] NULL,
	[policy_eff_date] [varchar](8) NULL,
	[policy_exp_date] [varchar](8) NULL,
	[policy_nbr] [varchar](80) NULL,
	[plan_nbr] [varchar](20) NULL,
	[notify_ind] [char](1) NOT NULL,
	[verify_ind] [char](1) NOT NULL,
	[precert_ind] [char](1) NOT NULL,
	[group_name] [varchar](33) NULL,
	[group_nbr] [varchar](50) NULL,
	[contact_last_name] [varchar](25) NULL,
	[contact_first_name] [varchar](25) NULL,
	[contact_middle_name] [varchar](25) NULL,
	[contact_phone] [varchar](10) NULL,
	[contact_phone_ext] [char](5) NULL,
	[contact_fax] [varchar](10) NULL,
	[msp_reason] [char](2) NULL,
	[medigap_id_nbr] [varchar](9) NULL,
	[sig_source] [char](1) NULL,
	[payer_name] [varchar](40) NULL,
	[mstr_payer_name] [varchar](40) NULL,
	[medical_cov_ind] [char](1) NOT NULL,
	[dental_cov_ind] [char](1) NOT NULL,
	[prescription_cov_ind] [char](1) NOT NULL,
	[eye_cov_ind] [char](1) NOT NULL,
	[workmens_comp_cov_ind] [char](1) NOT NULL,
	[def_cob] [int] NOT NULL,
	[employer_id] [uniqueidentifier] NULL,
	[kenpak_maid] [varchar](10) NULL,
	[kenpak_ind] [char](1) NOT NULL,
	[default_payer_date] [varchar](8) NULL,
	[ndex_county] [char](2) NULL,
	[address_line_1] [varchar](55) NULL,
	[address_line_2] [varchar](55) NULL,
	[city] [varchar](35) NULL,
	[state] [varchar](3) NULL,
	[zip] [varchar](9) NULL,
	[country_id] [uniqueidentifier] NULL,
	[county_id] [uniqueidentifier] NULL,
	[delete_ind] [char](1) NOT NULL,
	[email_address] [varchar](80) NULL,
	[claim_type] [char](2) NULL,
	[ins_type] [char](2) NULL,
	[last_elig_check] [datetime] NULL,
	[new_emp_ins_ind] [char](1) NOT NULL,
	[legacy_copay_tos_1] [varchar](2) NULL,
	[legacy_copay_tos_1_amount] [numeric](19, 2) NULL,
	[legacy_copay_tos_2] [varchar](2) NULL,
	[legacy_copay_tos_2_amount] [numeric](19, 2) NULL,
	[legacy_copay_tos_3] [varchar](2) NULL,
	[legacy_copay_tos_3_amount] [numeric](19, 2) NULL,
	[note] [varchar](255) NULL,
	[create_timestamp] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[modified_by] [int] NOT NULL,
	[modify_timestamp] [datetime] NOT NULL,
	[row_timestamp] [varchar] NOT NULL,
	[ins_card_first_name] [varchar](60) NULL,
	[ins_card_middle_name] [varchar](25) NULL,
	[ins_card_last_name] [varchar](60) NULL,
	[ins_card_suffix] [varchar](12) NULL,
	[tpl_code] [varchar](15) NULL,
	[referral_ind] [char](1) NOT NULL,
	[refund_address_line1] [varchar](55) NULL,
	[refund_address_line2] [varchar](55) NULL,
	[refund_city] [varchar](35) NULL,
	[refund_state] [varchar](3) NULL,
	[refund_zip] [varchar](9) NULL,
	[refund_country_id] [uniqueidentifier] NULL,
	[refund_county_id] [uniqueidentifier] NULL,
	[override_date_of_birth] [varchar](8) NOT NULL,
	[rts_override] [char](1) NOT NULL,
	[override_sex] [varchar](1) NULL,
    [EffectiveDate] [DATETIME] NULL,
    [ExpirationDate] [DATETIME] NULL,    
    [CurrentRowFlag] [BIT] NOT NULL,
    [DeleteRowFlag] [BIT] NOT NULL,
    [InsertDate] [DATETIME] NULL,
    [UpdateDate] [DATETIME] NULL,
    CONSTRAINT [PKods.NG_person_payer.RecordID]
        PRIMARY KEY CLUSTERED ([RecordID] ASC)
) ON [PRIMARY]
GO
ALTER TABLE [ods].[NG_person_payer]
ADD CONSTRAINT [ods.NG_person_payerEffectiveDate]
    DEFAULT (GETDATE()) FOR [EffectiveDate]
GO
ALTER TABLE [ods].[NG_person_payer]
ADD CONSTRAINT [ods.NG_person_payerDeleteRowFlag]
    DEFAULT ((0)) FOR [DeleteRowFlag]
GO
ALTER TABLE [ods].[NG_person_payer]
ADD CONSTRAINT [ods.NG_person_payerInsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]
GO
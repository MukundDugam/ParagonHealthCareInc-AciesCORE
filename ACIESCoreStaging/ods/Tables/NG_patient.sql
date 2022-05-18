﻿CREATE TABLE [ods].[NG_patient]
(
	[RecordID]					[INT] IDENTITY(1, 1) NOT NULL,
	[enterprise_id] [char](5) NOT NULL,
	[practice_id] [char](4) NOT NULL,
	[person_id] [uniqueidentifier] NOT NULL,
	[first_office_enc_date] [varchar](8) NULL,
	[last_office_enc_date] [varchar](8) NULL,
	[next_office_enc_date] [varchar](8) NULL,
	[pharmacy_code_1_id] [uniqueidentifier] NULL,
	[pharmacy_code_2_id] [uniqueidentifier] NULL,
	[default_location_id] [uniqueidentifier] NULL,
	[privacy_level] [int] NULL,
	[suppress_billing_ind] [char](1) NULL,
	[preferred_provider_id] [uniqueidentifier] NULL,
	[financial_class] [varchar](3) NULL,
	[site_id] [char](3) NOT NULL,
	[med_rec_nbr] [varchar](12) NULL,
	[guar_id] [uniqueidentifier] NULL,
	[guar_type] [char](1) NULL,
	[contact_person_id] [uniqueidentifier] NULL,
	[user_defined1] [varchar](40) NULL,
	[user_defined2] [varchar](40) NULL,
	[user_defined3] [varchar](40) NULL,
	[user_defined4] [varchar](40) NULL,
	[print_stmt_ind] [char](1) NOT NULL,
	[last_letter_date] [varchar](8) NULL,
	[rendering_prov_id] [uniqueidentifier] NULL,
	[co_managed_ind] [char](1) NOT NULL,
	[co_managed_prov_id] [uniqueidentifier] NULL,
	[mrkt_plan_id] [uniqueidentifier] NULL,
	[mrkt_source_id] [uniqueidentifier] NULL,
	[mrkt_source_type] [int] NULL,
	[mrkt_comments] [varchar](255) NULL,
	[referring_prov_id] [uniqueidentifier] NULL,
	[last_print_statement_date] [varchar](8) NULL,
	[privacy_notice_code_id] [uniqueidentifier] NULL,
	[privacy_notice_issued] [char](8) NULL,
	[privacy_notice_received] [char](8) NULL,
	[nxmd_enrollment] [char](1) NULL,
	[privacy_notice_notes] [varchar](255) NULL,
	[created_by] [int] NOT NULL,
	[create_timestamp] [datetime] NOT NULL,
	[modified_by] [int] NOT NULL,
	[modify_timestamp] [datetime] NOT NULL,
	[row_timestamp] [varchar](50) NOT NULL,
	[outsource_exempt_ind] [char](1) NOT NULL,
	[mrkt_details] [varchar](255) NULL,
	[user_defined5] [varchar](40) NULL,
	[user_defined6] [varchar](40) NULL,
	[user_defined7] [varchar](40) NULL,
	[user_defined8] [varchar](40) NULL,
	[head_of_household_id] [uniqueidentifier] NULL,
	[create_timestamp_tz] [smallint] NULL,
	[modify_timestamp_tz] [smallint] NULL,
	[no_unresolved_allergies_ind] [char](1) NOT NULL,
	[no_active_medications_ind] [char](1) NOT NULL,
	[no_active_problems] [char](1) NULL,
	[pm_ind] [char](1) NOT NULL,
	[pharmacy_code_mo_id] [uniqueidentifier] NULL,
	[no_active_problems_snomed] [char](1) NOT NULL,
	[no_known_imm_history_ind] [char](1) NOT NULL,
	[no_known_procedures_ind] [char](1) NOT NULL,
	[no_active_devices_ind] [char](1) NULL,
    [EffectiveDate] [DATETIME] NULL,
    [ExpirationDate] [DATETIME] NULL,    
    [CurrentRowFlag] [BIT] NOT NULL,
    [DeleteRowFlag] [BIT] NOT NULL,
    [InsertDate] [DATETIME] NULL,
    [UpdateDate] [DATETIME] NULL,
    CONSTRAINT [PKods.NG_patient.RecordID]
        PRIMARY KEY CLUSTERED ([RecordID] ASC)
) ON [PRIMARY]
GO
ALTER TABLE [ods].[NG_patient]
ADD CONSTRAINT [ods.NG_patientEffectiveDate]
    DEFAULT (GETDATE()) FOR [EffectiveDate]
GO
ALTER TABLE [ods].[NG_patient]
ADD CONSTRAINT [ods.NG_patientDeleteRowFlag]
    DEFAULT ((0)) FOR [DeleteRowFlag]
GO
ALTER TABLE [ods].[NG_patient]
ADD CONSTRAINT [ods.NG_patientInsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]
GO
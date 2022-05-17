﻿CREATE TABLE [stage].[NG_provider_mstr]
(
    [provider_id] [uniqueidentifier] NOT NULL,
    [description] [varchar](75) NULL,
    [last_name] [varchar](25) NULL,
    [first_name] [varchar](25) NULL,
    [middle_name] [varchar](25) NULL,
    [address_line_1] [varchar](55) NULL,
    [address_line_2] [varchar](55) NULL,
    [city] [varchar](35) NULL,
    [state] [varchar](3) NULL,
    [zip] [varchar](9) NULL,
    [country_id] [uniqueidentifier] NULL,
    [county_id] [uniqueidentifier] NULL,
    [phone] [varchar](10) NULL,
    [home_phone] [varchar](10) NULL,
    [home_fax] [varchar](10) NULL,
    [delete_ind] [char](1) NOT NULL,
    [external_id] [varchar](20) NULL,
    [email_address] [varchar](80) NULL,
    [mcs_referto_ind] [char](1) NOT NULL,
    [provider_subgrouping1_id] [uniqueidentifier] NULL,
    [provider_subgrouping2_id] [uniqueidentifier] NULL,
    [show_notes_on_appt_ind] [char](1) NOT NULL,
    [note] [varchar](255) NULL,
    [provider_type_referring_ind] [char](1) NOT NULL,
    [provider_type_pcp_ind] [char](1) NOT NULL,
    [provider_type_admitting_ind] [char](1) NOT NULL,
    [degree] [varchar](15) NULL,
    [ssn] [char](9) NULL,
    [specialty_code_1] [varchar](5) NULL,
    [specialty_code_2] [varchar](5) NULL,
    [other_lic_id] [varchar](12) NULL,
    [other_lic_desc] [varchar](10) NULL,
    [primary_loc_id] [uniqueidentifier] NULL,
    [employer_id] [uniqueidentifier] NULL,
    [language1_id] [uniqueidentifier] NULL,
    [language2_id] [uniqueidentifier] NULL,
    [language3_id] [uniqueidentifier] NULL,
    [export_service_ind] [char](1) NOT NULL,
    [pager] [varchar](10) NULL,
    [salutory_name] [varchar](15) NULL,
    [spouse_name] [varchar](25) NULL,
    [letter_code] [varchar](1) NULL,
    [hosp_affiliations] [varchar](30) NULL,
    [mobile_phone] [varchar](10) NULL,
    [home_addr_line_1] [varchar](55) NULL,
    [home_addr_line_2] [varchar](55) NULL,
    [home_city] [varchar](55) NULL,
    [home_state] [varchar](3) NULL,
    [home_zip] [varchar](9) NULL,
    [other1_name] [varchar](35) NULL,
    [other1_addr_line_1] [varchar](55) NULL,
    [other1_addr_line_2] [varchar](55) NULL,
    [other1_city] [varchar](55) NULL,
    [other1_state] [varchar](3) NULL,
    [other1_zip] [varchar](9) NULL,
    [other1_phone] [varchar](10) NULL,
    [other2_name] [varchar](35) NULL,
    [other2_addr_line_1] [varchar](55) NULL,
    [other2_addr_line_2] [varchar](55) NULL,
    [other2_city] [varchar](55) NULL,
    [other2_state] [varchar](3) NULL,
    [other2_zip] [varchar](9) NULL,
    [other2_phone] [varchar](10) NULL,
    [fax_extras] [varchar](10) NULL,
    [taxonomy_id] [uniqueidentifier] NULL,
    [fax] [varchar](10) NULL,
    [home_county_id] [uniqueidentifier] NULL,
    [other2_country_id] [uniqueidentifier] NULL,
    [other2_county_id] [uniqueidentifier] NULL,
    [other1_country_id] [uniqueidentifier] NULL,
    [other1_county_id] [uniqueidentifier] NULL,
    [provider_type_1_consulting_ind] [char](1) NOT NULL,
    [provider_type_2_consulting_ind] [char](1) NOT NULL,
    [phone_ext] [char](5) NULL,
    [home_country_id] [uniqueidentifier] NULL,
    [legacy_group_member_id] [varchar](15) NULL,
    [national_provider_id] [varchar](10) NULL,
    [refer_practice_name] [varchar](35) NULL,
    [legacy_group_member_nbr] [varchar](15) NULL,
    [zone1_id] [uniqueidentifier] NULL,
    [zone2_id] [uniqueidentifier] NULL,
    [zone3_id] [uniqueidentifier] NULL,
    [created_by] [int] NOT NULL,
    [modified_by] [int] NOT NULL,
    [create_timestamp] [datetime] NOT NULL,
    [modify_timestamp] [datetime] NOT NULL,    
    [default_tax_id] [varchar](15) NULL,
    [pqri_edits_ind] [char](1) NOT NULL,
    [provider_type_ordering_ind] [char](1) NOT NULL,
    [business_addr_valid_ind] [char](1) NULL,
    [home_addr_valid_ind] [char](1) NULL,
    [other1_addr_valid_ind] [char](1) NULL,
    [other2_addr_valid_ind] [char](1) NULL,
    InsertDate DATETIME
        CONSTRAINT [pk_provider_mstr]
        PRIMARY KEY CLUSTERED ([provider_id] ASC)
)
GO
ALTER TABLE [stage].[NG_provider_mstr]
ADD CONSTRAINT [stage.NG_provider_mstrInsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]

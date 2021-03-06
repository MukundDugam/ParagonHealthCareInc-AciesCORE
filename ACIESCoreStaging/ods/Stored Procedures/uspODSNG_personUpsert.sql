CREATE PROCEDURE [ods].[uspODSNG_person]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();

    -- Update existing records to previous version
    UPDATE [ods].[NG_person]
    SET [CurrentRowFlag] = 0,
        [ExpirationDate] = @DateTime,
        [UpdateDate] = @DateTime
    FROM [ods].[NG_person] [t]
        INNER JOIN [stage].[NG_person] [s]
            ON [t].[person_id] = [s].[person_id]
               AND [t].[CurrentRowFlag] = 1;

    SET @DateTime = DATEADD(SS, 1, @DateTime);

    -- Insert New and modified records as current version
    INSERT INTO [ods].[NG_person]
    ( [enterprise_id]
      ,[practice_id]
      ,[person_id]
      ,[site_id]
      ,[person_nbr]
      ,[other_id_number]
      ,[last_name]
      ,[first_name]
      ,[middle_name]
      ,[suffix]
      ,[prefix]
      ,[degree]
      ,[prior_last_name]
      ,[address_line_1]
      ,[address_line_2]
      ,[city]
      ,[state]
      ,[zip]
      ,[country]
      ,[county]
      ,[country_id]
      ,[county_id]
      ,[home_phone]
      ,[sec_address_line_1]
      ,[sec_address_line_2]
      ,[sec_city]
      ,[sec_state]
      ,[sec_zip]
      ,[sec_country_id]
      ,[sec_county_id]
      ,[sec_country]
      ,[sec_county]
      ,[sec_home_phone]
      ,[day_phone]
      ,[day_phone_ext]
      ,[alt_phone]
      ,[alt_phone_desc]
      ,[alt_phone_ext]
      ,[date_of_birth]
      ,[sex]
      ,[ssn]
      ,[marital_status]
      ,[expired_ind]
      ,[expired_date]
      ,[smoker_ind]
      ,[veteran_ind]
      ,[race_id]
      ,[language_id]
      ,[religion_id]
      ,[church_id]
      ,[race]
      ,[language]
      ,[religion]
      ,[church]
      ,[student_status]
      ,[primarycare_prov_id]
      ,[primarycare_prov_name]
      ,[image_id]
      ,[external_id]
      ,[email_address]
      ,[int_home_phone]
      ,[int_work_phone]
      ,[int_zip]
      ,[created_by]
      ,[create_timestamp]
      ,[modified_by]
      ,[modify_timestamp]
      ,[row_timestamp]
      ,[nickname]
      ,[uds_homeless_status_id]
      ,[uds_migrant_worker_status_id]
      ,[uds_language_barrier_id]
      ,[uds_primary_med_coverage_id]
      ,[note]
      ,[contact_seq]
      ,[home_phone_comment]
      ,[day_phone_comment]
      ,[alt_phone_comment]
      ,[sec_home_phone_comment]
      ,[email_address_comment]
      ,[contact_pref_id]
      ,[contact_pref_desc]
      ,[contact_alert_ind]
      ,[uds_pub_hsng_pri_care_id]
      ,[uds_school_hlth_ctr_id]
      ,[self_pay_ind]
      ,[uds_race_id]
      ,[uds_ethnicity_id]
      ,[uds_tribal_affiliation_id]
      ,[uds_blood_quantum_id]
      ,[uds_veteran_status]
      ,[uds_consent_to_treat_ind]
      ,[community_code_old]
      ,[mothers_maiden_name]
      ,[create_timestamp_tz]
      ,[modify_timestamp_tz]
      ,[uds_ihs_elig_status_id]
      ,[uds_tribal_class_id]
      ,[uds_decendancy_id]
      ,[uds_consent_to_treat_date]
      ,[community_code_id]
      ,[ethnicity]
      ,[ethnicity_id]
      ,[primary_dental_prov_id]
      ,[primary_dental_prov_name]
      ,[cell_phone]
      ,[cell_phone_comment]
      ,[address_type]
      ,[sec_address_type]
      ,[address_type_id]
      ,[sec_address_type_id]
      ,[soundex_last_name]
      ,[soundex_first_name]
      ,[prefix_id]
      ,[suffix_id]
      ,[prefix_old]
      ,[suffix_old]
      ,[cause_of_death_code]
      ,[cause_of_death]
      ,[birth_mothers_lname]
      ,[birth_mothers_fname]
      ,[birth_mothers_mname]
      ,[expired_time]
      ,[expired_time_tz]
      ,[email_ind]
      ,[phone_ind]
      ,[portal_ind]
      ,[sms_ind]
      ,[voice_ind]
      ,[optout_ind]
      ,[notific_pref_ind]
      ,[person_merge_station_id]
      ,[person_merge_flag]
      ,[risk_level]
      ,[exempt_frm_person_merge]
      ,[image_id_4frontimage]
      ,[image_id_4barcodeImage]
      ,[sexual_orientation]
      ,[preferred_pronoun]
      ,[enable_home_phone_ind]
      ,[enable_cell_phone_ind]
      ,[enable_email_address_ind]
      ,[enable_alt_phone_ind]
      ,[enable_day_phone_ind]
      ,[enable_sec_hm_phone_ind]
      ,[enable_int_phone_ind]
      ,[current_gender]
      ,[previous_first_name]
      ,[other_reason_so]
      ,[billing_addr_valid_ind]
      ,[secondary_addr_valid_ind]
      ,[per_corr_lang]
      ,[contact_seq_edi]
      ,[EffectiveDate]
      ,[ExpirationDate]        
      ,[CurrentRowFlag]
      ,[DeleteRowFlag]
      ,[InsertDate]
    )
    SELECT [enterprise_id]
      ,[practice_id]
      ,[person_id]
      ,[site_id]
      ,[person_nbr]
      ,[other_id_number]
      ,[last_name]
      ,[first_name]
      ,[middle_name]
      ,[suffix]
      ,[prefix]
      ,[degree]
      ,[prior_last_name]
      ,[address_line_1]
      ,[address_line_2]
      ,[city]
      ,[state]
      ,[zip]
      ,[country]
      ,[county]
      ,[country_id]
      ,[county_id]
      ,[home_phone]
      ,[sec_address_line_1]
      ,[sec_address_line_2]
      ,[sec_city]
      ,[sec_state]
      ,[sec_zip]
      ,[sec_country_id]
      ,[sec_county_id]
      ,[sec_country]
      ,[sec_county]
      ,[sec_home_phone]
      ,[day_phone]
      ,[day_phone_ext]
      ,[alt_phone]
      ,[alt_phone_desc]
      ,[alt_phone_ext]
      ,[date_of_birth]
      ,[sex]
      ,[ssn]
      ,[marital_status]
      ,[expired_ind]
      ,[expired_date]
      ,[smoker_ind]
      ,[veteran_ind]
      ,[race_id]
      ,[language_id]
      ,[religion_id]
      ,[church_id]
      ,[race]
      ,[language]
      ,[religion]
      ,[church]
      ,[student_status]
      ,[primarycare_prov_id]
      ,[primarycare_prov_name]
      ,[image_id]
      ,[external_id]
      ,[email_address]
      ,[int_home_phone]
      ,[int_work_phone]
      ,[int_zip]
      ,[created_by]
      ,[create_timestamp]
      ,[modified_by]
      ,[modify_timestamp]
      ,[row_timestamp]
      ,[nickname]
      ,[uds_homeless_status_id]
      ,[uds_migrant_worker_status_id]
      ,[uds_language_barrier_id]
      ,[uds_primary_med_coverage_id]
      ,[note]
      ,[contact_seq]
      ,[home_phone_comment]
      ,[day_phone_comment]
      ,[alt_phone_comment]
      ,[sec_home_phone_comment]
      ,[email_address_comment]
      ,[contact_pref_id]
      ,[contact_pref_desc]
      ,[contact_alert_ind]
      ,[uds_pub_hsng_pri_care_id]
      ,[uds_school_hlth_ctr_id]
      ,[self_pay_ind]
      ,[uds_race_id]
      ,[uds_ethnicity_id]
      ,[uds_tribal_affiliation_id]
      ,[uds_blood_quantum_id]
      ,[uds_veteran_status]
      ,[uds_consent_to_treat_ind]
      ,[community_code_old]
      ,[mothers_maiden_name]
      ,[create_timestamp_tz]
      ,[modify_timestamp_tz]
      ,[uds_ihs_elig_status_id]
      ,[uds_tribal_class_id]
      ,[uds_decendancy_id]
      ,[uds_consent_to_treat_date]
      ,[community_code_id]
      ,[ethnicity]
      ,[ethnicity_id]
      ,[primary_dental_prov_id]
      ,[primary_dental_prov_name]
      ,[cell_phone]
      ,[cell_phone_comment]
      ,[address_type]
      ,[sec_address_type]
      ,[address_type_id]
      ,[sec_address_type_id]
      ,[soundex_last_name]
      ,[soundex_first_name]
      ,[prefix_id]
      ,[suffix_id]
      ,[prefix_old]
      ,[suffix_old]
      ,[cause_of_death_code]
      ,[cause_of_death]
      ,[birth_mothers_lname]
      ,[birth_mothers_fname]
      ,[birth_mothers_mname]
      ,[expired_time]
      ,[expired_time_tz]
      ,[email_ind]
      ,[phone_ind]
      ,[portal_ind]
      ,[sms_ind]
      ,[voice_ind]
      ,[optout_ind]
      ,[notific_pref_ind]
      ,[person_merge_station_id]
      ,[person_merge_flag]
      ,[risk_level]
      ,[exempt_frm_person_merge]
      ,[image_id_4frontimage]
      ,[image_id_4barcodeImage]
      ,[sexual_orientation]
      ,[preferred_pronoun]
      ,[enable_home_phone_ind]
      ,[enable_cell_phone_ind]
      ,[enable_email_address_ind]
      ,[enable_alt_phone_ind]
      ,[enable_day_phone_ind]
      ,[enable_sec_hm_phone_ind]
      ,[enable_int_phone_ind]
      ,[current_gender]
      ,[previous_first_name]
      ,[other_reason_so]
      ,[billing_addr_valid_ind]
      ,[secondary_addr_valid_ind]
      ,[per_corr_lang]
      ,[contact_seq_edi]
      ,@DateTime AS [EffectiveDate]
      ,NULL AS [ExpirationDate]
      ,1 AS [CurrentRowFlag]
      ,0 AS [DeleteRowFlag]
      ,@DateTime AS [InsertDate]
    FROM [stage].[NG_person] AS [s]
    WHERE NOT EXISTS
    (
        SELECT *
        FROM [ods].[NG_person] AS [t]
        WHERE [t].[person_id] = [s].[person_id]
              AND [t].[CurrentRowFlag] = 1
    );  

END;
﻿CREATE PROCEDURE [ods].[uspODSNG_chargesUpsert]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();

    -- Update existing records to previous version
    UPDATE [ods].[NG_charges]
    SET [CurrentRowFlag] = 0,
        [ExpirationDate] = @DateTime,
        [UpdateDate] = @DateTime
    FROM [ods].[NG_charges] [t]
        INNER JOIN [stage].[NG_charges] [s]
            ON [t].[charge_id] = [s].[charge_id]
               AND [t].[CurrentRowFlag] = 1;

    SET @DateTime = DATEADD(SS, 1, @DateTime);

    -- Insert New and modified records as current version
    INSERT INTO [ods].[NG_charges]
    ( [enterprise_id]
      ,[practice_id]
      ,[emr_uniq_id]
      ,[line_item_ctl]
      ,[charge_id]
      ,[person_id]
      ,[source_id]
      ,[source_type]
      ,[location_id]
      ,[service_item_lib_id]
      ,[service_item_id]
      ,[cob1_amt]
      ,[cob2_amt]
      ,[cob3_amt]
      ,[pat_amt]
      ,[amt]
      ,[quantity]
      ,[unit_price]
      ,[override_ind]
      ,[begin_date_of_service]
      ,[end_date_of_service]
      ,[modifier_1]
      ,[modifier_2]
      ,[modifier_3]
      ,[modifier_4]
      ,[status]
      ,[rendering_id]
      ,[midlevel_id]
      ,[cpt4_code_id]
      ,[place_of_service]
      ,[icd9cm_code_id]
      ,[icd9cm_code_id_2]
      ,[icd9cm_code_id_3]
      ,[icd9cm_code_id_4]
      ,[icd9cm_code_desc]
      ,[icd9cm_code_desc_2]
      ,[icd9cm_code_desc_3]
      ,[icd9cm_code_desc_4]
      ,[invoice_desc_1]
      ,[invoice_desc_2]
      ,[zero_bal_date]
      ,[proc_claim_cob1_ind]
      ,[proc_claim_cob2_ind]
      ,[proc_claim_cob3_ind]
      ,[pat_bal_increase_date]
      ,[closing_date]
      ,[seq_nbr]
      ,[revenue_code]
      ,[narrative]
      ,[link_id]
      ,[exception_origin]
      ,[external_id]
      ,[batch_info]
      ,[override_closing_date]
      ,[revenue_description]
      ,[value_code]
      ,[occur_code]
      ,[nyhcra_surcharge_action_ind]
      ,[sliding_fee_action_ind]
      ,[resubmission_reference_nbr]
      ,[resubmission_cob]
      ,[tooth]
      ,[surface_description]
      ,[surface]
      ,[quadrant]
      ,[form]
      ,[start_time]
      ,[stop_time]
      ,[total_time]
      ,[base_unit]
      ,[alt_code]
      ,[referring_name]
      ,[referring_id]
      ,[transfer_nonpar_patpmt_ind]
      ,[transfer_nonpar_bal_ind]
      ,[anesthesia_billing_ind]
      ,[sim_dept_id]
      ,[note]
      ,[create_timestamp]
      ,[created_by]
      ,[modify_timestamp]
      ,[modified_by]
      ,[row_timestamp]
      ,[outsource_ind]
      ,[outsource_agency_id]
      ,[outsource_date]
      ,[enc_rate_ind]
      ,[custom_dunning_msg]
      ,[statement_aging_date]
      ,[create_timestamp_tz]
      ,[modify_timestamp_tz]
      ,[batch_post_dunning_msg_id]
      ,[optik_order_id]
      ,[credit_date]
      ,[anesthesia_units]
      ,[user_defined1_amt]
      ,[user_defined2_amt]
      ,[parent_tax_link_id]
      ,[rx_on_file_ind]
      ,[national_drug_code]
      ,[NDCId]
      ,[enc_changes_old_service_date]
      ,[enc_changes_old_location_id]
      ,[behavioral_billing_ind]
      ,[user_defined1_unit_price]
      ,[user_defined2_unit_price]
      ,[user_defined1_override_ind]
      ,[user_defined2_override_ind]
      ,[snomed_concept_id]
      ,[snomed_concept_id2]
      ,[snomed_concept_id3]
      ,[snomed_concept_id4]
      ,[dental_ind]
      ,[supernumerary_ind]
      ,[surface_descriptor]
      ,[defective_ind]
      ,[not_applicable_date]
      ,[approval_date]
      ,[asa_crosswalk_lib_id]
      ,[surgical_proc_code_id]
      ,[surgical_proc_desc]
      ,[parent_mda_link_id]
      ,[medical_director_id]
      ,[modifier_units]
      ,[time_based_units]
      ,[cob1_auth_code_id]
      ,[cob1_auth_code]
      ,[cob1_ref_code_id]
      ,[cob1_ref_code]
      ,[basis_of_measure]
      ,[national_drug_units]
      ,[cob2_auth_code_id]
      ,[cob2_auth_code]
      ,[cob2_ref_code_id]
      ,[cob2_ref_code]
      ,[cob3_auth_code_id]
      ,[cob3_auth_code]
      ,[cob3_ref_code_id]
      ,[cob3_ref_code]
      ,[cob1_resub_reference_nbr]
      ,[cob2_resub_reference_nbr]
      ,[cob3_resub_reference_nbr]
      ,[NDC_eff_date]
      ,[NDC_exp_date]
      ,[NDC_description]
      ,[NDC_drug_unit_price]
      ,[teeth]
      ,[units_from_timespan1]
      ,[units_from_timespan2]
      ,[units_from_timespan3]
      ,[unit_price_override]
      ,[time_based_price_override_ind]
      ,[icd9cm_code_id_5]
      ,[icd9cm_code_id_6]
      ,[icd9cm_code_id_7]
      ,[icd9cm_code_id_8]
      ,[icd9cm_code_id_9]
      ,[icd9cm_code_id_10]
      ,[icd9cm_code_id_11]
      ,[icd9cm_code_id_12]
      ,[icd9cm_code_desc_5]
      ,[icd9cm_code_desc_6]
      ,[icd9cm_code_desc_7]
      ,[icd9cm_code_desc_8]
      ,[icd9cm_code_desc_9]
      ,[icd9cm_code_desc_10]
      ,[icd9cm_code_desc_11]
      ,[icd9cm_code_desc_12]
      ,[ordering_id]
      ,[enc_rate_orig_cob]
      ,[pos99location_id]
      ,[EffectiveDate]
      ,[ExpirationDate]        
      ,[CurrentRowFlag]
      ,[DeleteRowFlag]
      ,[InsertDate]
    )
    SELECT [enterprise_id]
      ,[practice_id]
      ,[emr_uniq_id]
      ,[line_item_ctl]
      ,[charge_id]
      ,[person_id]
      ,[source_id]
      ,[source_type]
      ,[location_id]
      ,[service_item_lib_id]
      ,[service_item_id]
      ,[cob1_amt]
      ,[cob2_amt]
      ,[cob3_amt]
      ,[pat_amt]
      ,[amt]
      ,[quantity]
      ,[unit_price]
      ,[override_ind]
      ,[begin_date_of_service]
      ,[end_date_of_service]
      ,[modifier_1]
      ,[modifier_2]
      ,[modifier_3]
      ,[modifier_4]
      ,[status]
      ,[rendering_id]
      ,[midlevel_id]
      ,[cpt4_code_id]
      ,[place_of_service]
      ,[icd9cm_code_id]
      ,[icd9cm_code_id_2]
      ,[icd9cm_code_id_3]
      ,[icd9cm_code_id_4]
      ,[icd9cm_code_desc]
      ,[icd9cm_code_desc_2]
      ,[icd9cm_code_desc_3]
      ,[icd9cm_code_desc_4]
      ,[invoice_desc_1]
      ,[invoice_desc_2]
      ,[zero_bal_date]
      ,[proc_claim_cob1_ind]
      ,[proc_claim_cob2_ind]
      ,[proc_claim_cob3_ind]
      ,[pat_bal_increase_date]
      ,[closing_date]
      ,[seq_nbr]
      ,[revenue_code]
      ,[narrative]
      ,[link_id]
      ,[exception_origin]
      ,[external_id]
      ,[batch_info]
      ,[override_closing_date]
      ,[revenue_description]
      ,[value_code]
      ,[occur_code]
      ,[nyhcra_surcharge_action_ind]
      ,[sliding_fee_action_ind]
      ,[resubmission_reference_nbr]
      ,[resubmission_cob]
      ,[tooth]
      ,[surface_description]
      ,[surface]
      ,[quadrant]
      ,[form]
      ,[start_time]
      ,[stop_time]
      ,[total_time]
      ,[base_unit]
      ,[alt_code]
      ,[referring_name]
      ,[referring_id]
      ,[transfer_nonpar_patpmt_ind]
      ,[transfer_nonpar_bal_ind]
      ,[anesthesia_billing_ind]
      ,[sim_dept_id]
      ,[note]
      ,[create_timestamp]
      ,[created_by]
      ,[modify_timestamp]
      ,[modified_by]
      ,[row_timestamp]
      ,[outsource_ind]
      ,[outsource_agency_id]
      ,[outsource_date]
      ,[enc_rate_ind]
      ,[custom_dunning_msg]
      ,[statement_aging_date]
      ,[create_timestamp_tz]
      ,[modify_timestamp_tz]
      ,[batch_post_dunning_msg_id]
      ,[optik_order_id]
      ,[credit_date]
      ,[anesthesia_units]
      ,[user_defined1_amt]
      ,[user_defined2_amt]
      ,[parent_tax_link_id]
      ,[rx_on_file_ind]
      ,[national_drug_code]
      ,[NDCId]
      ,[enc_changes_old_service_date]
      ,[enc_changes_old_location_id]
      ,[behavioral_billing_ind]
      ,[user_defined1_unit_price]
      ,[user_defined2_unit_price]
      ,[user_defined1_override_ind]
      ,[user_defined2_override_ind]
      ,[snomed_concept_id]
      ,[snomed_concept_id2]
      ,[snomed_concept_id3]
      ,[snomed_concept_id4]
      ,[dental_ind]
      ,[supernumerary_ind]
      ,[surface_descriptor]
      ,[defective_ind]
      ,[not_applicable_date]
      ,[approval_date]
      ,[asa_crosswalk_lib_id]
      ,[surgical_proc_code_id]
      ,[surgical_proc_desc]
      ,[parent_mda_link_id]
      ,[medical_director_id]
      ,[modifier_units]
      ,[time_based_units]
      ,[cob1_auth_code_id]
      ,[cob1_auth_code]
      ,[cob1_ref_code_id]
      ,[cob1_ref_code]
      ,[basis_of_measure]
      ,[national_drug_units]
      ,[cob2_auth_code_id]
      ,[cob2_auth_code]
      ,[cob2_ref_code_id]
      ,[cob2_ref_code]
      ,[cob3_auth_code_id]
      ,[cob3_auth_code]
      ,[cob3_ref_code_id]
      ,[cob3_ref_code]
      ,[cob1_resub_reference_nbr]
      ,[cob2_resub_reference_nbr]
      ,[cob3_resub_reference_nbr]
      ,[NDC_eff_date]
      ,[NDC_exp_date]
      ,[NDC_description]
      ,[NDC_drug_unit_price]
      ,[teeth]
      ,[units_from_timespan1]
      ,[units_from_timespan2]
      ,[units_from_timespan3]
      ,[unit_price_override]
      ,[time_based_price_override_ind]
      ,[icd9cm_code_id_5]
      ,[icd9cm_code_id_6]
      ,[icd9cm_code_id_7]
      ,[icd9cm_code_id_8]
      ,[icd9cm_code_id_9]
      ,[icd9cm_code_id_10]
      ,[icd9cm_code_id_11]
      ,[icd9cm_code_id_12]
      ,[icd9cm_code_desc_5]
      ,[icd9cm_code_desc_6]
      ,[icd9cm_code_desc_7]
      ,[icd9cm_code_desc_8]
      ,[icd9cm_code_desc_9]
      ,[icd9cm_code_desc_10]
      ,[icd9cm_code_desc_11]
      ,[icd9cm_code_desc_12]
      ,[ordering_id]
      ,[enc_rate_orig_cob]
      ,[pos99location_id]
      ,@DateTime AS [EffectiveDate]
      ,NULL AS [ExpirationDate]
      ,1 AS [CurrentRowFlag]
      ,0 AS [DeleteRowFlag]
      ,@DateTime AS [InsertDate]
    FROM [stage].[NG_charges] AS [s]
    WHERE NOT EXISTS
    (
        SELECT *
        FROM [ods].[NG_charges] AS [t]
        WHERE [t].[charge_id] = [s].[charge_id]
              AND [t].[CurrentRowFlag] = 1
    );  

END;
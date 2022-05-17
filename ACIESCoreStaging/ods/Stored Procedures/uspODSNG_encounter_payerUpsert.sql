CREATE PROCEDURE [ods].[uspODSNG_encounter_payerUpsert]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();

    -- Update existing records to previous version
    UPDATE [ods].[NG_encounter_payer]
    SET [CurrentRowFlag] = 0,
        [ExpirationDate] = @DateTime,
        [UpdateDate] = @DateTime
    FROM [ods].[NG_encounter_payer] [t]
        INNER JOIN [stage].[NG_encounter_payer] [s]
            ON [t].[enc_id] = [s].[enc_id]
            AND [t].[person_payer_id]=[s].[person_payer_id]
               AND [t].[CurrentRowFlag] = 1;

    SET @DateTime = DATEADD(SS, 1, @DateTime);

    -- Insert New and modified records as current version
    INSERT INTO [ods].[NG_encounter_payer]
    ( [enterprise_id]
      ,[practice_id]
      ,[person_id]
      ,[enc_id]
      ,[cob]
      ,[payer_id]
      ,[person_payer_id]
      ,[insured_person_id]
      ,[encounter_copay_amt]
      ,[ins_type]
      ,[claim_type]
      ,[notify_user_id]
      ,[verify_date]
      ,[precert_nbr]
      ,[assign_benefits_code]
      ,[release_of_info]
      ,[pro_date]
      ,[pro_procedure]
      ,[pro_state]
      ,[opt_claim_value_1]
      ,[notify_date]
      ,[verify_user_id]
      ,[gabetterhealth_nbr]
      ,[use_rem_enc_auth_ind]
      ,[auth_code_id]
      ,[created_by]
      ,[modified_by]
      ,[create_timestamp]
      ,[modify_timestamp]
      ,[row_timestamp]
      ,[copay_exempt_ind]
      ,[referral_nbr]
      ,[referral_id]
      ,[use_rem_enc_ref_ind]
      ,[pm_ind]
      ,[property_casualty_nbr]
      ,[Appl_placed_date]
      ,[Appl_rmved_date]      
      ,[EffectiveDate]
      ,[ExpirationDate]        
      ,[CurrentRowFlag]
      ,[DeleteRowFlag]
      ,[InsertDate]
    )
    SELECT [enterprise_id]
      ,[practice_id]
      ,[person_id]
      ,[enc_id]
      ,[cob]
      ,[payer_id]
      ,[person_payer_id]
      ,[insured_person_id]
      ,[encounter_copay_amt]
      ,[ins_type]
      ,[claim_type]
      ,[notify_user_id]
      ,[verify_date]
      ,[precert_nbr]
      ,[assign_benefits_code]
      ,[release_of_info]
      ,[pro_date]
      ,[pro_procedure]
      ,[pro_state]
      ,[opt_claim_value_1]
      ,[notify_date]
      ,[verify_user_id]
      ,[gabetterhealth_nbr]
      ,[use_rem_enc_auth_ind]
      ,[auth_code_id]
      ,[created_by]
      ,[modified_by]
      ,[create_timestamp]
      ,[modify_timestamp]
      ,[row_timestamp]
      ,[copay_exempt_ind]
      ,[referral_nbr]
      ,[referral_id]
      ,[use_rem_enc_ref_ind]
      ,[pm_ind]
      ,[property_casualty_nbr]
      ,[Appl_placed_date]
      ,[Appl_rmved_date]
      ,@DateTime AS [EffectiveDate]
      ,NULL AS [ExpirationDate]
      ,1 AS [CurrentRowFlag]
      ,0 AS [DeleteRowFlag]
      ,@DateTime AS [InsertDate]
    FROM [stage].[NG_encounter_payer] AS [s]
    WHERE NOT EXISTS
    (
        SELECT *
        FROM [ods].[NG_encounter_payer] AS [t]
        WHERE [t].[enc_id] = [s].[enc_id]
            AND [t].[person_payer_id]=[s].[person_payer_id]
              AND [t].[CurrentRowFlag] = 1
    );  

END;
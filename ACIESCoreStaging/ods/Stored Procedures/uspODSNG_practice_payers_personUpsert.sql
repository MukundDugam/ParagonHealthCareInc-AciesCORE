CREATE PROCEDURE [ods].[uspODSNG_practice_payers_personUpsert]
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
    FROM [ods].[NG_practice_payers_person] [t]
        INNER JOIN [stage].[NG_practice_payers_person] [s]
            ON  [t].[person_payer_id]=[s].[person_payer_id]
	           AND [t].[practice_id] = [s].[practice_id]
               AND [t].[CurrentRowFlag] = 1;

    SET @DateTime = DATEADD(SS, 1, @DateTime);

    -- Insert New and modified records as current version
    INSERT INTO [ods].[NG_practice_payers_person]
    (  [practice_id]
      ,[person_payer_id]
      ,[payer_id]
      ,[person_id]
      ,[copay_amt]
      ,[deductible]
      ,[notify_ind]
      ,[verify_ind]
      ,[precert_ind]
      ,[copay_type]
      ,[copay_percent]
      ,[create_timestamp]
      ,[created_by]
      ,[modify_timestamp]
      ,[modified_by]
      ,[row_timestamp]
      ,[referral_ind]
      ,[EffectiveDate]
      ,[ExpirationDate]        
      ,[CurrentRowFlag]
      ,[DeleteRowFlag]
      ,[InsertDate]
    )
    SELECT  [practice_id]
      ,[person_payer_id]
      ,[payer_id]
      ,[person_id]
      ,[copay_amt]
      ,[deductible]
      ,[notify_ind]
      ,[verify_ind]
      ,[precert_ind]
      ,[copay_type]
      ,[copay_percent]
      ,[create_timestamp]
      ,[created_by]
      ,[modify_timestamp]
      ,[modified_by]
      ,[row_timestamp]
      ,[referral_ind]
      ,@DateTime AS [EffectiveDate]
      ,NULL AS [ExpirationDate]
      ,1 AS [CurrentRowFlag]
      ,0 AS [DeleteRowFlag]
      ,@DateTime AS [InsertDate]
    FROM [stage].[NG_practice_payers_person] AS [s]
    WHERE NOT EXISTS
    (
        SELECT *
        FROM [ods].[NG_practice_payers_person] AS [t]
        WHERE [t].[person_payer_id]=[s].[person_payer_id]
	           AND [t].[practice_id] = [s].[practice_id]
               AND [t].[CurrentRowFlag] = 1
    );  

END;
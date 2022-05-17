CREATE PROCEDURE [ods].[uspODSNG_tran_code_mstrUpsert]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();

    -- Update existing records to previous version
    UPDATE [ods].[NG_tran_code_mstr]
    SET [CurrentRowFlag] = 0,
        [ExpirationDate] = @DateTime,
        [UpdateDate] = @DateTime
    FROM [ods].[NG_tran_code_mstr] [t]
        INNER JOIN [stage].[NG_tran_code_mstr] [s]
            ON [t].[tran_code_id] = [s].[tran_code_id]
               AND [t].[CurrentRowFlag] = 1;

    SET @DateTime = DATEADD(SS, 1, @DateTime);

    -- Insert New and modified records as current version
    INSERT INTO [ods].[NG_tran_code_mstr]
    (   [tran_code_id]
        ,[type]
        ,[source]
        ,[description]
        ,[sign_type]
        ,[allow_sign_override_ind]
        ,[delete_ind]
        ,[create_timestamp]
        ,[created_by]
        ,[modify_timestamp]
        ,[modified_by]
        ,[row_timestamp]
        ,[bad_debt_only_ind]
        ,[note]
        ,[optical_transaction_ind]
        ,[discount_ind]
        ,[not_payment_entry_ind]
        ,[in_progress_ind]
        ,[contracted_payers_ind]
        ,[non_contracted_payers_ind]
        ,[discount_app_none_ind]
        ,[EffectiveDate]
        ,[ExpirationDate]        
        ,[CurrentRowFlag]
        ,[DeleteRowFlag]
        ,[InsertDate]
    )
    SELECT [tran_code_id]
          ,[type]
          ,[source]
          ,[description]
          ,[sign_type]
          ,[allow_sign_override_ind]
          ,[delete_ind]
          ,[create_timestamp]
          ,[created_by]
          ,[modify_timestamp]
          ,[modified_by]
          ,[row_timestamp]
          ,[bad_debt_only_ind]
          ,[note]
          ,[optical_transaction_ind]
          ,[discount_ind]
          ,[not_payment_entry_ind]
          ,[in_progress_ind]
          ,[contracted_payers_ind]
          ,[non_contracted_payers_ind]
          ,[discount_app_none_ind]
          ,@DateTime AS [EffectiveDate]
          ,NULL AS [ExpirationDate]
          ,1 AS [CurrentRowFlag]
          ,0 AS [DeleteRowFlag]
          ,@DateTime AS [InsertDate]
    FROM [stage].[NG_tran_code_mstr] AS [s]
    WHERE NOT EXISTS
    (
        SELECT *
        FROM [ods].[NG_tran_code_mstr] AS [t]
        WHERE [t].[tran_code_id] = [s].[tran_code_id]
              AND [t].[CurrentRowFlag] = 1
    );  

END;
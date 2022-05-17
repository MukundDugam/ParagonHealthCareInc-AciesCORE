CREATE PROCEDURE [ods].[uspODSNG_MLTS_CategoryXP_Upsert]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();

    -- Update existing records to previous version
    UPDATE [ods].[NG_MLTS_CategoryXP_]
    SET [CurrentRowFlag] = 0,
        [ExpirationDate] = @DateTime,
        [UpdateDate] = @DateTime
    FROM [ods].[NG_MLTS_CategoryXP_] [t]
        INNER JOIN [stage].[NG_MLTS_CategoryXP_] [s]
            ON [t].[seq_no] = [s].[seq_no]
               AND [t].[CurrentRowFlag] = 1;

    SET @DateTime = DATEADD(SS, 1, @DateTime);

    -- Insert New and modified records as current version
    INSERT INTO [ods].[NG_MLTS_CategoryXP_]
    ( [seq_no]
      ,[practice_id]
      ,[created_by]
      ,[create_timestamp]
      ,[modified_by]
      ,[modify_timestamp]
      ,[create_timestamp_tz]
      ,[modify_timestamp_tz]
      ,[row_timestamp]
      ,[ActiveInd]
      ,[Category]
      ,[Acuity]
      ,[SalesLevel]
      ,[ChronicAcute]
      ,[EffectiveDate]
      ,[ExpirationDate]        
      ,[CurrentRowFlag]
      ,[DeleteRowFlag]
      ,[InsertDate]
    )
    SELECT [seq_no]
      ,[practice_id]
      ,[created_by]
      ,[create_timestamp]
      ,[modified_by]
      ,[modify_timestamp]
      ,[create_timestamp_tz]
      ,[modify_timestamp_tz]
      ,[row_timestamp]
      ,[ActiveInd]
      ,[Category]
      ,[Acuity]
      ,[SalesLevel]
      ,[ChronicAcute]
      ,@DateTime AS [EffectiveDate]
      ,NULL AS [ExpirationDate]
      ,1 AS [CurrentRowFlag]
      ,0 AS [DeleteRowFlag]
      ,@DateTime AS [InsertDate]
    FROM [stage].[NG_MLTS_CategoryXP_] AS [s]
    WHERE NOT EXISTS
    (
        SELECT *
        FROM [ods].[NG_MLTS_CategoryXP_] AS [t]
        WHERE [t].[seq_no] = [s].[seq_no]
              AND [t].[CurrentRowFlag] = 1
    );  

END;
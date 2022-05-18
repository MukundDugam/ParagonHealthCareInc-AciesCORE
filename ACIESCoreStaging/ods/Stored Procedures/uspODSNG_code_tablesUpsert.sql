CREATE PROCEDURE [ods].[uspODSNG_code_tables]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();

    -- Update existing records to previous version
    UPDATE [ods].[NG_code_tables]
    SET [CurrentRowFlag] = 0,
        [ExpirationDate] = @DateTime,
        [UpdateDate] = @DateTime
    FROM [ods].[NG_code_tables] [t]
        INNER JOIN [stage].[NG_code_tables] [s]
            ON [t].[code_type]=[s].[code_type]
	        AND [t].[code]=[s].[code]
               AND [t].[CurrentRowFlag] = 1;

    SET @DateTime = DATEADD(SS, 1, @DateTime);

    -- Insert New and modified records as current version
    INSERT INTO [ods].[NG_code_tables]
    ( [code_type]
      ,[code]
      ,[description]
      ,[delete_ind]
      ,[create_timestamp]
      ,[created_by]
      ,[modify_timestamp]
      ,[modified_by]
      ,[row_timestamp]
      ,[attribute1]
      ,[EffectiveDate]
      ,[ExpirationDate]        
      ,[CurrentRowFlag]
      ,[DeleteRowFlag]
      ,[InsertDate]
    )
    SELECT [code_type]
      ,[code]
      ,[description]
      ,[delete_ind]
      ,[create_timestamp]
      ,[created_by]
      ,[modify_timestamp]
      ,[modified_by]
      ,[row_timestamp]
      ,[attribute1]
      ,@DateTime AS [EffectiveDate]
      ,NULL AS [ExpirationDate]
      ,1 AS [CurrentRowFlag]
      ,0 AS [DeleteRowFlag]
      ,@DateTime AS [InsertDate]
    FROM [stage].[NG_code_tables] AS [s]
    WHERE NOT EXISTS
    (
        SELECT *
        FROM [ods].[NG_code_tables] AS [t]
        WHERE [t].[code_type]=[s].[code_type]
	        AND [t].[code]=[s].[code]
            AND [t].[CurrentRowFlag] = 1
    );  

END;
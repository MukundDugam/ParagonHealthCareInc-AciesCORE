CREATE PROCEDURE [ods].[uspODSNG_person_relationship]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();

    -- Update existing records to previous version
    UPDATE [ods].[NG_person_relationship]
    SET [CurrentRowFlag] = 0,
        [ExpirationDate] = @DateTime,
        [UpdateDate] = @DateTime
    FROM [ods].[NG_person_relationship] [t]
        INNER JOIN [stage].[NG_person_relationship] [s]
            ON [t].[person_id]=[s].[person_id] 
	        AND [t].[related_person_id]=[s].[related_person_id]
	        AND [t].[delete_ind]=[s].[delete_ind]
            AND [t].[CurrentRowFlag] = 1;

    SET @DateTime = DATEADD(SS, 1, @DateTime);

    -- Insert New and modified records as current version
    INSERT INTO [ods].[NG_person_relationship]
    ( [person_id]
      ,[related_person_id]
      ,[relation_code]
      ,[delete_ind]
      ,[create_timestamp]
      ,[created_by]
      ,[modified_by]
      ,[modify_timestamp]
      ,[row_timestamp]
      ,[create_timestamp_tz]
      ,[modify_timestamp_tz]
      ,[EffectiveDate]
      ,[ExpirationDate]        
      ,[CurrentRowFlag]
      ,[DeleteRowFlag]
      ,[InsertDate]
    )
    SELECT  [person_id]
      ,[related_person_id]
      ,[relation_code]
      ,[delete_ind]
      ,[create_timestamp]
      ,[created_by]
      ,[modified_by]
      ,[modify_timestamp]
      ,[row_timestamp]
      ,[create_timestamp_tz]
      ,[modify_timestamp_tz]
      ,@DateTime AS [EffectiveDate]
      ,NULL AS [ExpirationDate]
      ,1 AS [CurrentRowFlag]
      ,0 AS [DeleteRowFlag]
      ,@DateTime AS [InsertDate]
    FROM [stage].[NG_person_relationship] AS [s]
    WHERE NOT EXISTS
    (
        SELECT *
        FROM [ods].[NG_person_relationship] AS [t]
        WHERE [t].[person_id]=[s].[person_id] 
	        AND [t].[related_person_id]=[s].[related_person_id]
	        AND [t].[delete_ind]=[s].[delete_ind]
            AND [t].[CurrentRowFlag] = 1
    );  

END;
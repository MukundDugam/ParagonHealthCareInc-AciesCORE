CREATE PROCEDURE [ods].[uspODSNG_mstr_listsUpsert]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();

    -- Update existing records to previous version
    UPDATE [ods].[NG_mstr_lists]
    SET [CurrentRowFlag] = 0,
        [ExpirationDate] = @DateTime,
        [UpdateDate] = @DateTime
    FROM [ods].[NG_mstr_lists] [t]
        INNER JOIN [stage].[NG_mstr_lists] [s]
            ON [t].[mstr_list_item_id] = [s].[mstr_list_item_id] and
            [t].enterprise_id=[s].enterprise_id
               AND [t].[CurrentRowFlag] = 1;

    SET @DateTime = DATEADD(SS, 1, @DateTime);

    -- Insert New and modified records as current version
    INSERT INTO [ods].[NG_mstr_lists]
    (
        [mstr_list_type]
      ,[mstr_list_item_id]
      ,[mstr_list_item_desc]
      ,[list_order]
      ,[cache_ind]
      ,[external_id]
      ,[delete_ind]
      ,[create_timestamp]
      ,[created_by]
      ,[modify_timestamp]
      ,[modified_by]
      ,[row_timestamp]
      ,[show_in_emr_ind]
      ,[enterprise_id]
      ,[practice_id]
      ,[nxmd_ind]
      ,[EffectiveDate]
      ,[ExpirationDate]      
      ,[CurrentRowFlag]
      ,[DeleteRowFlag]
      ,[InsertDate]
    )
    SELECT 
            [mstr_list_type]
          ,[mstr_list_item_id]
          ,[mstr_list_item_desc]
          ,[list_order]
          ,[cache_ind]
          ,[external_id]
          ,[delete_ind]
          ,[create_timestamp]
          ,[created_by]
          ,[modify_timestamp]
          ,[modified_by]
          ,[row_timestamp]
          ,[show_in_emr_ind]
          ,[enterprise_id]
          ,[practice_id]
          ,[nxmd_ind]
          ,@DateTime AS [EffectiveDate]
          , NULL AS [ExpirationDate]
          , 1 AS [CurrentRowFlag]
          , 0 AS [DeleteRowFlag]
          , @DateTime AS [InsertDate]
    FROM [stage].[NG_mstr_lists] AS [s]
    WHERE NOT EXISTS
    (
        SELECT *
        FROM [ods].[NG_mstr_lists] AS [t]
        WHERE [t].[mstr_list_item_id] = [s].[mstr_list_item_id] and
            [t].enterprise_id=[s].enterprise_id
              AND [t].[CurrentRowFlag] = 1
    );  

END;
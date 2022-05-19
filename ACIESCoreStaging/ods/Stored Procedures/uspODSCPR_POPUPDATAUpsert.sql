CREATE PROCEDURE [ods].[uspODSCPR_POPUPDATAUpsert]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();

    -- Update existing records to previous version
    UPDATE [ods].[CPR_POPUPDATA]
    SET [CurrentRowFlag] = 0,
        [ExpirationDate] = @DateTime,
        [UpdateDate] = @DateTime
    FROM [ods].[CPR_POPUPDATA] [t]
        INNER JOIN [stage].[CPR_POPUPDATA] [s]
            ON [t].[CPK_POPUPDATA] = [s].[CPK_POPUPDATA]
               AND [t].[CurrentRowFlag] = 1;

    SET @DateTime = DATEADD(SS, 1, @DateTime);

    -- Insert New and modified records as current version
    INSERT INTO [ods].[CPR_POPUPDATA]
    ([CPK_POPUPDATA]
      ,[TEXT_]
      ,[CODE]
      ,[CFK_POPUPS]
      ,[POPUPNAME]
      ,[DELFLAG]
      ,[CREATEDON]
      ,[TOUCHEDBY]
      ,[TOUCHDATE]
      ,[CREATEDBY]
      ,[CHGBYHOST]
      ,[AMOUNT]
      ,[CFK_TABLE]
      ,[ITEMDATE]
      ,[EffectiveDate]
      ,[ExpirationDate]
      ,[CurrentRowFlag]
      ,[DeleteRowFlag]
      ,[InsertDate]
    )
    SELECT [CPK_POPUPDATA]
      ,[TEXT_]
      ,[CODE]
      ,[CFK_POPUPS]
      ,[POPUPNAME]
      ,[DELFLAG]
      ,[CREATEDON]
      ,[TOUCHEDBY]
      ,[TOUCHDATE]
      ,[CREATEDBY]
      ,[CHGBYHOST]
      ,[AMOUNT]
      ,[CFK_TABLE]
      ,[ITEMDATE]
      , @DateTime AS [EffectiveDate]
      , NULL AS [ExpirationDate]
      , 1 AS [CurrentRowFlag]
      , 0 AS [DeleteRowFlag]
      , @DateTime AS [InsertDate]
    FROM [stage].[CPR_POPUPDATA] AS [s]
    WHERE NOT EXISTS
    (
        SELECT *
        FROM [ods].[CPR_POPUPDATA] AS [t]
        WHERE [t].[CPK_POPUPDATA] = [s].[CPK_POPUPDATA]
              AND [t].[CurrentRowFlag] = 1
    );

END;


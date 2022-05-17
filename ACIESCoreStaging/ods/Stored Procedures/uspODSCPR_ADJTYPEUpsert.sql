CREATE PROCEDURE [ods].[uspODSCPR_ADJTYPEUpsert]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();

    -- Update existing records to previous version
    UPDATE [ods].[CPR_ADJTYPE]
    SET [CurrentRowFlag] = 0,
        [ExpirationDate] = @DateTime,
        [UpdateDate] = @DateTime
    FROM [ods].[CPR_ADJTYPE] [t]
        INNER JOIN [stage].[CPR_ADJTYPE] [s]
            ON [t].[CPK_ADJTYPE] = [s].[CPK_ADJTYPE]
               AND [t].[CurrentRowFlag] = 1;

    SET @DateTime = DATEADD(SS, 1, @DateTime);

    -- Insert New and modified records as current version
    INSERT INTO [ods].[CPR_ADJTYPE]
    (
 	    [CPK_ADJTYPE],
	    [TEXT_],
	    [CODE],
	    [GLACCT],
	    [GLDEPT],
	    [DELFLAG],
	    [TOUCHDATE],
	    [CHGBYHOST],
	    [CREATEDON],
	    [CREATEDBY], 
        [EffectiveDate],
        [ExpirationDate],
        [CurrentRowFlag],
        [DeleteRowFlag],
        [InsertDate]
    )
    SELECT 	
	    [CPK_ADJTYPE],
	    [TEXT_],
	    [CODE],
	    [GLACCT],
	    [GLDEPT],
	    [DELFLAG],
	    [TOUCHDATE],
	    [CHGBYHOST],
	    [CREATEDON],
	    [CREATEDBY],
        @DateTime AS [EffectiveDate],
        NULL AS [ExpirationDate],
        1 AS [CurrentRowFlag],
        0 AS [DeleteRowFlag],
        @DateTime AS [InsertDate]
    FROM [stage].[CPR_ADJTYPE] AS [s]
    WHERE NOT EXISTS
    (
        SELECT *
        FROM [ods].[CPR_ADJTYPE] AS [t]
        WHERE [t].[CPK_ADJTYPE] = [s].[CPK_ADJTYPE]
              AND [t].[CurrentRowFlag] = 1
    );

END;


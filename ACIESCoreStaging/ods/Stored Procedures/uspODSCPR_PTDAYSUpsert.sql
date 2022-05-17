CREATE PROCEDURE [ods].[uspODSCPR_PTDAYSUpsert]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();

    -- Update existing records to previous version
    UPDATE [ods].[CPR_PTDAYS]
    SET [CurrentRowFlag] = 0,
        [ExpirationDate] = @DateTime,
        [UpdateDate] = @DateTime
    FROM [ods].[CPR_PTDAYS] [t]
        INNER JOIN [stage].[CPR_PTDAYS] [s]
            ON [t].[CPK_PTDAYS] = [s].[CPK_PTDAYS]
               AND [t].[CurrentRowFlag] = 1;

    SET @DateTime = DATEADD(SS, 1, @DateTime);

    -- Insert New and modified records as current version
    INSERT INTO [ods].[CPR_PTDAYS]
    (
	    [CPK_PTDAYS],
	    [MRN],
	    [NEW_STAT],
	    [STAT_DATE],
	    [NOTES],
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
	    [CPK_PTDAYS],
	    [MRN],
	    [NEW_STAT],
	    [STAT_DATE],
	    [NOTES],
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
    FROM [stage].[CPR_PTDAYS] AS [s]
    WHERE NOT EXISTS
    (
        SELECT *
        FROM [ods].[CPR_PTDAYS] AS [t]
        WHERE [t].[CPK_PTDAYS] = [s].[CPK_PTDAYS]
              AND [t].[CurrentRowFlag] = 1
    );

END;


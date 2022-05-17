CREATE PROCEDURE [ods].[uspODSCPR_BILLEDDelete]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();    

    -- Update deleted records with deleted flag = 1    
    UPDATE [ods].[CPR_BILLED]
    SET [DeleteRowFlag] = 1,
        [CurrentRowFlag] = 0,
        [ExpirationDate] = ISNULL([t].[ExpirationDate], @DateTime),
        [UpdateDate] = @DateTime
    FROM [ods].[CPR_BILLED] AS [t]
        INNER JOIN [stage].[CPR_BILLED] AS [s]
            ON [t].[CPK_BILLED] = [s].[CPK_BILLED]
    WHERE [s].[DELFLAG] = 1;

END;

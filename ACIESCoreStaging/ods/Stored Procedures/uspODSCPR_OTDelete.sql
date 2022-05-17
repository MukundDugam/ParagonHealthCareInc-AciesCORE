CREATE PROCEDURE [ods].[uspODSCPR_OTDelete]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();    

    -- Update deleted records with deleted flag = 1    
    UPDATE [ods].[CPR_OT]
    SET [DeleteRowFlag] = 1,
        [CurrentRowFlag] = 0,
        [ExpirationDate] = ISNULL([t].[ExpirationDate], @DateTime),
        [UpdateDate] = @DateTime
    FROM [ods].[CPR_OT] AS [t]
        INNER JOIN [stage].[CPR_OT] AS [s]
            ON [t].[NO] = [s].[NO]
    WHERE [s].[DELFLAG] = 1;

END;

CREATE PROCEDURE [ods].[uspODSCPR_INSCOMPDelete]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();    

    -- Update deleted records with deleted flag = 1    
    UPDATE [ods].[CPR_INSCOMP]
    SET [DeleteRowFlag] = 1,
        [CurrentRowFlag] = 0,
        [ExpirationDate] = ISNULL([t].[ExpirationDate], @DateTime),
        [UpdateDate] = @DateTime
    FROM [ods].[CPR_INSCOMP] AS [t]
        INNER JOIN [stage].[CPR_INSCOMP] AS [s]
            ON [t].[NO] = [s].[NO]
    WHERE [s].[DELFLAG] = 1;

END;
CREATE PROCEDURE [ods].[uspODSCPR_SITESDelete]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();    

    -- Update deleted records with deleted flag = 1    
    UPDATE [ods].[CPR_SITES]
    SET [DeleteRowFlag] = 1,
        [CurrentRowFlag] = 0,
        [ExpirationDate] = ISNULL([t].[ExpirationDate], @DateTime),
        [UpdateDate] = @DateTime
    FROM [ods].[CPR_SITES] AS [t]
        INNER JOIN [stage].[CPR_SITES] AS [s]
            ON [t].[SITENO] = [s].[SITENO]
    WHERE [s].[DELFLAG] = 1;

END;
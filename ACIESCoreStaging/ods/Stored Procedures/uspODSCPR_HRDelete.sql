CREATE PROCEDURE [ods].[uspODSCPR_HRDelete]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();    

    -- Update deleted records with deleted flag = 1    
    UPDATE [ods].[CPR_HR]
    SET [DeleteRowFlag] = 1,
        [CurrentRowFlag] = 0,
        [ExpirationDate] = ISNULL([t].[ExpirationDate], @DateTime),
        [UpdateDate] = @DateTime
    FROM [ods].[CPR_HR] AS [t]
        INNER JOIN [stage].[CPR_HR] AS [s]
            ON [t].[MRN] = [s].[MRN]
    WHERE [s].[DELFLAG] = 1;

END;

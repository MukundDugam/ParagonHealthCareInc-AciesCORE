CREATE PROCEDURE [ods].[uspODSCPR_DOCTORSDelete]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();    

    -- Update deleted records with deleted flag = 1    
    UPDATE [ods].[CPR_DOCTORS]
    SET [DeleteRowFlag] = 1,
        [CurrentRowFlag] = 0,
        [ExpirationDate] = ISNULL([t].[ExpirationDate], @DateTime),
        [UpdateDate] = @DateTime
    FROM [ods].[CPR_DOCTORS] AS [t]
        INNER JOIN [stage].[CPR_DOCTORS] AS [s]
            ON [t].[NO] = [s].[NO]
    WHERE [s].[DELFLAG] = 1;

END;
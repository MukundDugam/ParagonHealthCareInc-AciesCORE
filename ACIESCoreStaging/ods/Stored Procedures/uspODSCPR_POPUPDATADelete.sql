CREATE PROCEDURE [ods].[uspODSCPR_POPUPDATADelete]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();    

    -- Update deleted records with deleted flag = 1    
    UPDATE [ods].[CPR_POPUPDATA]
    SET [DeleteRowFlag] = 1,
        [CurrentRowFlag] = 0,
        [ExpirationDate] = ISNULL([t].[ExpirationDate], @DateTime),
        [UpdateDate] = @DateTime
    FROM [ods].[CPR_POPUPDATA] AS [t]
        INNER JOIN [stage].[CPR_POPUPDATA] AS [s]
            ON [t].[CPK_POPUPDATA] = [s].[CPK_POPUPDATA]
    WHERE [s].[DELFLAG] = 1;


END;

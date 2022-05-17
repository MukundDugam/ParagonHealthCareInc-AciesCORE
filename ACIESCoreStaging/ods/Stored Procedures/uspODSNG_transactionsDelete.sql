CREATE PROCEDURE [ods].[uspODSNG_transactionDelete]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();    

    -- Update deleted records with deleted flag = 1    
    UPDATE [ods].[NG_transactions]
    SET [DeleteRowFlag] = 1,
        [CurrentRowFlag] = 0,
        [ExpirationDate] = ISNULL([t].[ExpirationDate], @DateTime),
        [UpdateDate] = @DateTime
    FROM [ods].[NG_transactions] AS [t]
        INNER JOIN [stage].[NG_transactions] AS [s]
            ON [t].[trans_id] = [s].[trans_id];
    --WHERE [s].[delete] = 'Y' this to be check;

END;
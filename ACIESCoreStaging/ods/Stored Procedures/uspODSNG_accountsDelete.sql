CREATE PROCEDURE [ods].[uspODSNG_accountsDelete]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();    

    -- Update deleted records with deleted flag = 1    
    UPDATE [ods].[NG_accounts]
    SET [DeleteRowFlag] = 1,
        [CurrentRowFlag] = 0,
        [ExpirationDate] = ISNULL([t].[ExpirationDate], @DateTime),
        [UpdateDate] = @DateTime
    FROM [ods].[NG_accounts] AS [t]
        INNER JOIN [stage].[NG_accounts] AS [s]
            ON [t].[acct_id] = [s].[acct_id]
            AND [t].[practice_id]=[s].[practice_id];
    --WHERE [s].[delete] = 'Y';

END;
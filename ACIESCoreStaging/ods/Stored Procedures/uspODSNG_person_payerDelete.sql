CREATE PROCEDURE [ods].[uspODSNG_person_payerDelete]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();    

    -- Update deleted records with deleted flag = 1    
    UPDATE [ods].[NG_person_payer]
    SET [DeleteRowFlag] = 1,
        [CurrentRowFlag] = 0,
        [ExpirationDate] = ISNULL([t].[ExpirationDate], @DateTime),
        [UpdateDate] = @DateTime
    FROM [ods].[NG_person_payer] AS [t]
        INNER JOIN [stage].[NG_person_payer] AS [s]
            ON [t].[person_payer_id] = [s].[person_payer_id];
    --WHERE [s].[delete] = 'Y';

END;
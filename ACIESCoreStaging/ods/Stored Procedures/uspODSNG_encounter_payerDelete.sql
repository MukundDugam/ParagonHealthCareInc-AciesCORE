CREATE PROCEDURE [ods].[uspODSNG_encounter_payerDelete]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();    

    -- Update deleted records with deleted flag = 1    
    UPDATE [ods].[NG_encounter_payer]
    SET [DeleteRowFlag] = 1,
        [CurrentRowFlag] = 0,
        [ExpirationDate] = ISNULL([t].[ExpirationDate], @DateTime),
        [UpdateDate] = @DateTime
    FROM [ods].[NG_encounter_payer] AS [t]
        INNER JOIN [stage].[NG_encounter_payer] AS [s]
            ON [t].[enc_id] = [s].[enc_id]
            AND [t].[person_payer_id]=[s].[person_payer_id]
     --WHERE [s].[delete] = 'Y';

END;
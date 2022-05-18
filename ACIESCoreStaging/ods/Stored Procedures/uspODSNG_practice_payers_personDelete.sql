CREATE PROCEDURE [ods].[uspODSNG_practice_payers_personDelete]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();    

    -- Update deleted records with deleted flag = 1    
    UPDATE [ods].[NG_practice_payers_person]
    SET [DeleteRowFlag] = 1,
        [CurrentRowFlag] = 0,
        [ExpirationDate] = ISNULL([t].[ExpirationDate], @DateTime),
        [UpdateDate] = @DateTime
    FROM [ods].[NG_practice_payers_person] AS [t]
        INNER JOIN [stage].[NG_practice_payers_person] AS [s]
            ON [t].[person_payer_id]=[s].[person_payer_id]
	        AND [t].[practice_id] = [s].[practice_id];

    --WHERE [s].[delete] = 'Y';

END;
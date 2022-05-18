CREATE PROCEDURE [ods].[uspODSNG_patientDelete]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();    

    -- Update deleted records with deleted flag = 1    
    UPDATE [ods].[NG_patient]
    SET [DeleteRowFlag] = 1,
        [CurrentRowFlag] = 0,
        [ExpirationDate] = ISNULL([t].[ExpirationDate], @DateTime),
        [UpdateDate] = @DateTime
    FROM [ods].[NG_patient] AS [t]
        INNER JOIN [stage].[NG_patient] AS [s]
            ON [t].[person_id] = [s].[person_id]
            AND [t].[practice_id]=[s].[practice_id];
    --WHERE [s].[delete] = 'Y';

END;
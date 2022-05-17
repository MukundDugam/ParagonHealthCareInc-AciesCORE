CREATE PROCEDURE [ods].[uspODSNG_patient_encounterDelete]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();    

    -- Update deleted records with deleted flag = 1    
    UPDATE [ods].[NG_patient_encounter]
    SET [DeleteRowFlag] = 1,
        [CurrentRowFlag] = 0,
        [ExpirationDate] = ISNULL([t].[ExpirationDate], @DateTime),
        [UpdateDate] = @DateTime
    FROM [ods].[NG_patient_encounter] AS [t]
        INNER JOIN [stage].[NG_patient_encounter] AS [s]
            ON [t].[enc_id] = [s].[enc_id];
   -- WHERE [s].[delete] = 'Y' this to be check;

END;
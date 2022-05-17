CREATE PROCEDURE [ods].[uspODSNG_chargesDelete]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();    

    -- Update deleted records with deleted flag = 1    
    UPDATE [ods].[NG_charges]
    SET [DeleteRowFlag] = 1,
        [CurrentRowFlag] = 0,
        [ExpirationDate] = ISNULL([t].[ExpirationDate], @DateTime),
        [UpdateDate] = @DateTime
    FROM [ods].[NG_charges] AS [t]
        INNER JOIN [stage].[NG_charges] AS [s]
            ON [t].[charge_id] = [s].[charge_id];
   -- WHERE [s].[delete] = 'Y' this to be check;

END;
CREATE PROCEDURE [ods].[uspODSNG_location_mstrDelete]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();    

    -- Update deleted records with deleted flag = 1    
    UPDATE [ods].[NG_location_mstr]
    SET [DeleteRowFlag] = 1,
        [CurrentRowFlag] = 0,
        [ExpirationDate] = ISNULL([t].[ExpirationDate], @DateTime),
        [UpdateDate] = @DateTime
    FROM [ods].[NG_location_mstr] AS [t]
        INNER JOIN [stage].[NG_location_mstr] AS [s]
            ON [t].[location_id] = [s].[location_id]
    WHERE [s].[delete_ind] = 'Y';

END;
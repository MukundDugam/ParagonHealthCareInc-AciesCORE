CREATE PROCEDURE [ods].[uspODSNG_MLTS_CategoryXP_Delete]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();    

    -- Update deleted records with deleted flag = 1    
    UPDATE [ods].[NG_MLTS_CategoryXP_]
    SET [DeleteRowFlag] = 1,
        [CurrentRowFlag] = 0,
        [ExpirationDate] = ISNULL([t].[ExpirationDate], @DateTime),
        [UpdateDate] = @DateTime
    FROM [ods].[NG_MLTS_CategoryXP_] AS [t]
        INNER JOIN [stage].[NG_MLTS_CategoryXP_] AS [s]
            ON [t].[seq_no] = [s].[seq_no];
    --WHERE [s].[delete] = 'Y';

END;
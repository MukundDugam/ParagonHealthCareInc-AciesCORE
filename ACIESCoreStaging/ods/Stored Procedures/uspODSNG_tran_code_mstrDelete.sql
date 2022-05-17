CREATE PROCEDURE [ods].[uspODSNG_tran_code_mstrDelete]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();    

    -- Update deleted records with deleted flag = 1    
    UPDATE [ods].[NG_tran_code_mstr]
    SET [DeleteRowFlag] = 1,
        [CurrentRowFlag] = 0,
        [ExpirationDate] = ISNULL([t].[ExpirationDate], @DateTime),
        [UpdateDate] = @DateTime
    FROM [ods].[NG_tran_code_mstr] AS [t]
        INNER JOIN [stage].[NG_tran_code_mstr] AS [s]
            ON [t].[tran_code_id] = [s].[tran_code_id]
    WHERE [s].[delete_ind] = 'Y';

END;
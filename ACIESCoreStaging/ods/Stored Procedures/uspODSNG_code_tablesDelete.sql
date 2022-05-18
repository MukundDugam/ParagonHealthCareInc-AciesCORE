CREATE PROCEDURE [ods].[uspODSNG_code_tablesDelete]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();    

    -- Update deleted records with deleted flag = 1    
    UPDATE [ods].[NG_code_tables]
    SET [DeleteRowFlag] = 1,
        [CurrentRowFlag] = 0,
        [ExpirationDate] = ISNULL([t].[ExpirationDate], @DateTime),
        [UpdateDate] = @DateTime
    FROM [ods].[NG_code_tables] AS [t]
        INNER JOIN [stage].[NG_code_tables] AS [s]
            ON [t].[code_type] =[s].[code_type]
            AND [t].[code]=[s].[code]
    WHERE [s].[delete_ind] = 'Y';

END;
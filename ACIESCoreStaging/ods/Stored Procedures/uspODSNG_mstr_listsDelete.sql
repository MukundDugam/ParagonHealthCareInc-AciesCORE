CREATE PROCEDURE [ods].[uspODSNG_mstr_listsDelete]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();    

    -- Update deleted records with deleted flag = 1    
    UPDATE [ods].[NG_mstr_lists]
    SET [DeleteRowFlag] = 1,
        [CurrentRowFlag] = 0,
        [ExpirationDate] = ISNULL([t].[ExpirationDate], @DateTime),
        [UpdateDate] = @DateTime
    FROM [ods].[NG_mstr_lists] AS [t]
        INNER JOIN [stage].[NG_mstr_lists] AS [s]
            ON [t].[mstr_list_item_id] = [s].[mstr_list_item_id] and
            [t].[enterprise_id]=[s].[enterprise_id]
    WHERE [s].[delete_ind] = 'Y';

END;
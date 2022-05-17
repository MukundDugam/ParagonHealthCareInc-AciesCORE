CREATE PROCEDURE [ods].[uspODSCPR_PATINSDelete]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();    

    -- Update deleted records with deleted flag = 1    
    UPDATE [ods].[CPR_PATINS]
    SET [DeleteRowFlag] = 1,
        [CurrentRowFlag] = 0,
        [ExpirationDate] = ISNULL([t].[ExpirationDate], @DateTime),
        [UpdateDate] = @DateTime
    FROM [ods].[CPR_PATINS] AS [t]
        INNER JOIN [stage].[CPR_PATINS] AS [s]
            ON [t].[CPK_PATINS] = [s].[CPK_PATINS]
    WHERE [s].[DELFLAG] = 1;

END;

CREATE PROCEDURE [ods].[uspODSCPR_PTDAYSDelete]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();    

    -- Update deleted records with deleted flag = 1    
    UPDATE [ods].[CPR_PTDAYS]
    SET [DeleteRowFlag] = 1,
        [CurrentRowFlag] = 0,
        [ExpirationDate] = ISNULL([t].[ExpirationDate], @DateTime),
        [UpdateDate] = @DateTime
    FROM [ods].[CPR_PTDAYS] AS [t]
        INNER JOIN [stage].[CPR_PTDAYS] AS [s]
            ON [t].[CPK_PTDAYS] = [s].[CPK_PTDAYS]
    WHERE [s].[DELFLAG] = 1;

END;

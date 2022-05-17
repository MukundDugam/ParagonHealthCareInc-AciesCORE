CREATE PROCEDURE [ods].[uspODSCPR_ADJTYPEDelete]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();    

    -- Update deleted records with deleted flag = 1    
    UPDATE [ods].[CPR_ADJTYPE]
    SET [DeleteRowFlag] = 1,
        [CurrentRowFlag] = 0,
        [ExpirationDate] = ISNULL([t].[ExpirationDate], @DateTime),
        [UpdateDate] = @DateTime
    FROM [ods].[CPR_ADJTYPE] AS [t]
        INNER JOIN [stage].[CPR_ADJTYPE] AS [s]
            ON [t].[CPK_ADJTYPE] = [s].[CPK_ADJTYPE]
    WHERE [s].[DELFLAG] = 1;


END;

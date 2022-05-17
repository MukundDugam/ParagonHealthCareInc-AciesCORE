CREATE PROCEDURE [ods].[uspODSCPR_TICKCIDelete]
AS
BEGIN
    SET NOCOUNT ON
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();    

    -- Update deleted records with deleted flag = 1    
    UPDATE [ods].[CPR_TICKCI]
    SET [DeleteRowFlag] = 1,
        [CurrentRowFlag] = 0,
        [ExpirationDate] = ISNULL([t].[ExpirationDate], @DateTime),
        [UpdateDate] = @DateTime
    FROM [ods].[CPR_TICKCI] AS [t]
        INNER JOIN [stage].[CPR_TICKCI] AS [s]
            ON [t].[TICKNO]  = [s].[TICKNO]
    WHERE [s].[DELFLAG] = 1;

END;

CREATE PROCEDURE [ods].[uspODSNG_personDelete]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();    

    -- Update deleted records with deleted flag = 1    
    UPDATE [ods].[NG_person]
    SET [DeleteRowFlag] = 1,
        [CurrentRowFlag] = 0,
        [ExpirationDate] = ISNULL([t].[ExpirationDate], @DateTime),
        [UpdateDate] = @DateTime
    FROM [ods].[NG_person] AS [t]
        INNER JOIN [stage].[NG_person] AS [s]
            ON [t].[person_id] = [s].[person_id]
  --  WHERE [s].[delete] = 'Y';

END;
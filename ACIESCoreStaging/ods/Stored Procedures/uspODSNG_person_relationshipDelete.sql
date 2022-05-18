CREATE PROCEDURE [ods].[uspODSNG_person_relationshipDelete]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();    

    -- Update deleted records with deleted flag = 1    
    UPDATE [ods].[NG_person_relationship]
    SET [DeleteRowFlag] = 1,
        [CurrentRowFlag] = 0,
        [ExpirationDate] = ISNULL([t].[ExpirationDate], @DateTime),
        [UpdateDate] = @DateTime
    FROM [ods].[NG_person_relationship] AS [t]
        INNER JOIN [stage].[NG_person_relationship] AS [s]
            ON [t].[person_id] =[s].[person_id] 
	           AND [t].[related_person_id]=[s].[related_person_id] 
    WHERE [s].[delete_ind] = 'Y';

END;
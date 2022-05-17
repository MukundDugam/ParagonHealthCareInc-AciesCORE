CREATE PROCEDURE [ods].[uspODSCPR_DOCTORSUpsert]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();

    -- Update existing records to previous version
    UPDATE [ods].[CPR_DOCTORS]
    SET [CurrentRowFlag] = 0,
        [ExpirationDate] = @DateTime,
        [UpdateDate] = @DateTime
    FROM [ods].[CPR_DOCTORS] [t]
        INNER JOIN [stage].[CPR_DOCTORS] [s]
            ON [t].[NO] = [s].[NO]
               AND [t].[CurrentRowFlag] = 1;

    SET @DateTime = DATEADD(SS, 1, @DateTime);

    -- Insert New and modified records as current version
    INSERT INTO [ods].[CPR_DOCTORS]
    (
        [NO],
        [PH_LAST],
        [PH_FIRST],
        [PH_SPEC],
        [PH_ORG],
        [PH_ADDRESS],
        [PH_ADDR2],
        [PH_CITY],
        [PH_STATE],
        [PH_ZIP],
        [PH_PHONE],
        [PH_PHONEXT],
        [PH_FAX],
        [PH_PAGER],
        [PH_EMAIL],
        [PH_UPIN],
        [PH_MCD],
        [PH_DEA],
        [PH_LIC],
        [PH_LASTLIC],
        [PH_NEXTLIC],
        [PH_LASTINI],
        [PH_NEXTINI],
        [PH_DPS],
        [PH_MCDKS],
        [PH_MCR],
        [SITENO],
        [PH_PRIV1],
        [PH_CONT],
        [NOTES],
        [REFCLASS],
        [GEOLOC],
        [SREP_NO],
        [SREP_CODE],
        [PH_BCBS],
        [DELFLAG],
        [TOUCHDATE],
        [CHGBYHOST],
        [CREATEDON],
        [CREATEDBY],
        [PH_RRMCRID],
        [CONVKEY],
        [PROFDESIG],
        [PH_NPI],
        [TAXONOMY],
        [WEBACCESS],
        [INACTIVE],
        [INSCRYBE],
        [CMNDELIVERY],
        [ph_caracc],
        [pecos],
        [pecosexclude],
        [hcid],
        [cfk_central_contact],
        [oralcode],
        [caprelsaauth],
        [ph_nadean],
        [EffectiveDate],
        [ExpirationDate],
        [CurrentRowFlag],
        [DeleteRowFlag],
        [InsertDate]
    )
    SELECT [NO],
           [PH_LAST],
           [PH_FIRST],
           [PH_SPEC],
           [PH_ORG],
           [PH_ADDRESS],
           [PH_ADDR2],
           [PH_CITY],
           [PH_STATE],
           [PH_ZIP],
           [PH_PHONE],
           [PH_PHONEXT],
           [PH_FAX],
           [PH_PAGER],
           [PH_EMAIL],
           [PH_UPIN],
           [PH_MCD],
           [PH_DEA],
           [PH_LIC],
           [PH_LASTLIC],
           [PH_NEXTLIC],
           [PH_LASTINI],
           [PH_NEXTINI],
           [PH_DPS],
           [PH_MCDKS],
           [PH_MCR],
           [SITENO],
           [PH_PRIV1],
           [PH_CONT],
           [NOTES],
           [REFCLASS],
           [GEOLOC],
           [SREP_NO],
           [SREP_CODE],
           [PH_BCBS],
           [DELFLAG],
           [TOUCHDATE],
           [CHGBYHOST],
           [CREATEDON],
           [CREATEDBY],
           [PH_RRMCRID],
           [CONVKEY],
           [PROFDESIG],
           [PH_NPI],
           [TAXONOMY],
           [WEBACCESS],
           [INACTIVE],
           [INSCRYBE],
           [CMNDELIVERY],
           [ph_caracc],
           [pecos],
           [pecosexclude],
           [hcid],
           [cfk_central_contact],
           [oralcode],
           [caprelsaauth],
           [ph_nadean],
           @DateTime AS [EffectiveDate],
           NULL AS [ExpirationDate],
           1 AS [CurrentRowFlag],
           0 AS [DeleteRowFlag],
           @DateTime AS [InsertDate]
    FROM [stage].[CPR_DOCTORS] AS [s]
    WHERE NOT EXISTS
    (
        SELECT *
        FROM [ods].[CPR_DOCTORS] AS [t]
        WHERE [t].[NO] = [s].[NO]
              AND [t].[CurrentRowFlag] = 1
    );

END;
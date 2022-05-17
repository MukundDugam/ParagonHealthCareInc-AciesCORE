CREATE PROCEDURE [ods].[uspODSCPR_SITESUpsert]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();

    -- Update existing records to previous version
    UPDATE [ods].[CPR_SITES]
    SET [CurrentRowFlag] = 0,
        [ExpirationDate] = @DateTime,
        [UpdateDate] = @DateTime
    FROM [ods].[CPR_SITES] [t]
        INNER JOIN [stage].[CPR_SITES] [s]
            ON [t].[SITENO] = [s].[SITENO]
               AND [t].[CurrentRowFlag] = 1;

    SET @DateTime = DATEADD(SS, 1, @DateTime);

    -- Insert New and modified records as current version
    INSERT INTO [ods].[CPR_SITES]
    (
  		[SITENO],
		[SITENAME],
		[SEL],
		[SPWENC],
		[MAXRXNO],
		[ORIGRXNO],
		[CPMAXRXNO],
		[DELFLAG],
		[TOUCHDATE],
		[CHGBYHOST],
		[CREATEDON],
		[CREATEDBY],
		[FAXPATH],
		[HMEFAXPATH],
		[SHP_PROVIDERID],
		[SCANPATH],
		[HHLAUSER],
		[HHLAPASS],
		[HHLALOC],
		[HHLADATE],
		[sprxfaxpath],
		[cfk_logins_msd],
		[surescriptsid],
		[unc_faxpath],
		[unc_hmefaxpath],
		[unc_sprxfaxpath],
		[unc_scanpath],
		[cfk_logins_payware],
        [EffectiveDate],
        [ExpirationDate],
        [CurrentRowFlag],
        [DeleteRowFlag],
        [InsertDate]
    )
    SELECT 	[SITENO],
		[SITENAME],
		[SEL],
		[SPWENC],
		[MAXRXNO],
		[ORIGRXNO],
		[CPMAXRXNO],
		[DELFLAG],
		[TOUCHDATE],
		[CHGBYHOST],
		[CREATEDON],
		[CREATEDBY],
		[FAXPATH],
		[HMEFAXPATH],
		[SHP_PROVIDERID],
		[SCANPATH],
		[HHLAUSER],
		[HHLAPASS],
		[HHLALOC],
		[HHLADATE],
		[sprxfaxpath],
		[cfk_logins_msd],
		[surescriptsid],
		[unc_faxpath],
		[unc_hmefaxpath],
		[unc_sprxfaxpath],
		[unc_scanpath],
		[cfk_logins_payware],
        @DateTime AS [EffectiveDate],
        NULL AS [ExpirationDate],
        1 AS [CurrentRowFlag],
        0 AS [DeleteRowFlag],
        @DateTime AS [InsertDate]
    FROM [stage].[CPR_SITES] AS [s]
    WHERE NOT EXISTS
    (
        SELECT *
        FROM [ods].[CPR_SITES] AS [t]
        WHERE [t].[SITENO] = [s].[SITENO]
              AND [t].[CurrentRowFlag] = 1
    );

END;

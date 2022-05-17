CREATE PROCEDURE [ods].[uspODSCPR_PATINSUpsert]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();

    -- Update existing records to previous version
    UPDATE [ods].[CPR_PATINS]
    SET [CurrentRowFlag] = 0,
        [ExpirationDate] = @DateTime,
        [UpdateDate] = @DateTime
    FROM [ods].[CPR_PATINS] [t]
        INNER JOIN [stage].[CPR_PATINS] [s]
            ON [t].[CPK_PATINS] = [s].[CPK_PATINS]
               AND [t].[CurrentRowFlag] = 1;

    SET @DateTime = DATEADD(SS, 1, @DateTime);

    -- Insert New and modified records as current version
    INSERT INTO [ods].[CPR_PATINS]
    (
		[CPK_PATINS],
		[MRN],
		[INSNO],
		[RANK],
		[STATUS],
		[INSURANCE],
		[PAYOR],
		[START],
		[STOP],
		[SHOWST],
		[POLICY],
		[GROUP_NUM],
		[POLICY_OW],
		[INSCONTAC],
		[INSCPHONE],
		[EMPLOYER],
		[OTHERINS],
		[DELFLAG],
		[TOUCHDATE],
		[CHGBYHOST],
		[CREATEDON] ,
		[CREATEDBY],
		[PLANID],
		[CFK_INSCOMP_NEXT] ,
		[CFK_PATINS_NEXT],
		[PCODE],
		[DOIDATE],
		[ONSETDATE],
		[PARTDFACILITY],
		[POLICY_FLAG],
		[PATIENTCONVKEY],
		[INSCOMPCONVKEY],
		[BILLASDENIAL],
		[MSPTYPE],
		[POLICYOWNERMIDDLENAME],
		[COUPONINFOREQUIRED],
        [EffectiveDate],
        [ExpirationDate],
        [CurrentRowFlag],
        [DeleteRowFlag],
        [InsertDate]
    )
    SELECT 	
		[CPK_PATINS],
		[MRN],
		[INSNO],
		[RANK],
		[STATUS],
		[INSURANCE],
		[PAYOR],
		[START],
		[STOP],
		[SHOWST],
		[POLICY],
		[GROUP_NUM],
		[POLICY_OW],
		[INSCONTAC],
		[INSCPHONE],
		[EMPLOYER],
		[OTHERINS],
		[DELFLAG],
		[TOUCHDATE],
		[CHGBYHOST],
		[CREATEDON] ,
		[CREATEDBY],
		[PLANID],
		[CFK_INSCOMP_NEXT] ,
		[CFK_PATINS_NEXT],
		[PCODE],
		[DOIDATE],
		[ONSETDATE],
		[PARTDFACILITY],
		[POLICY_FLAG],
		[PATIENTCONVKEY],
		[INSCOMPCONVKEY],
		[BILLASDENIAL],
		[MSPTYPE],
		[POLICYOWNERMIDDLENAME],
		[COUPONINFOREQUIRED],
        @DateTime AS [EffectiveDate],
        NULL AS [ExpirationDate],
        1 AS [CurrentRowFlag],
        0 AS [DeleteRowFlag],
        @DateTime AS [InsertDate]
    FROM [stage].[CPR_PATINS] AS [s]
    WHERE NOT EXISTS
    (
        SELECT *
        FROM [ods].[CPR_PATINS] AS [t]
        WHERE [t].[CPK_PATINS] = [s].[CPK_PATINS]
              AND [t].[CurrentRowFlag] = 1
    );

END;


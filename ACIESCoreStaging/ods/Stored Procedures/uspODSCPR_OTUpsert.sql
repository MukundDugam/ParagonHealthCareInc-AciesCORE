CREATE PROCEDURE [ods].[uspODSCPR_OTUpsert]
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @DateTime DATETIME = GETDATE();

    -- Update existing records to previous version
    UPDATE [ods].[CPR_OT]
    SET [CurrentRowFlag] = 0,
        [ExpirationDate] = @DateTime,
        [UpdateDate] = @DateTime
    FROM [ods].[CPR_OT] [t]
        INNER JOIN [stage].[CPR_OT] [s]
            ON [t].[NO] = [s].[NO]
               AND [t].[CurrentRowFlag] = 1;

    SET @DateTime = DATEADD(SS, 1, @DateTime);

    -- Insert New and modified records as current version
    INSERT INTO [ods].[CPR_OT]
    (
		[NO]
      ,[MRN]
      ,[RANK]
      ,[STATUS]
      ,[DESCRIP]
      ,[ORDERED]
      ,[START]
      ,[STOP]
      ,[SHOWST]
      ,[DISCHARGE]
      ,[INVNO]
      ,[ITEMNAME]
      ,[STRENGTH]
      ,[STRENGTHU]
      ,[DDI]
      ,[ROUTE]
      ,[FREQ]
      ,[DURAT]
      ,[COMMENTS]
      ,[CLASS]
      ,[RXTYPE]
      ,[RXFORMAT]
      ,[THERAPY]
      ,[DRUG]
      ,[COMPLEX]
      ,[INSNUM]
      ,[INSNO]
      ,[SCREEN]
      ,[PRIMARYFLG]
      ,[INUSE]
      ,[RPHNAME]
      ,[ACCEPTED]
      ,[BILLNO]
      ,[LISTID]
      ,[TICKINFONO]
      ,[ZREFOTNO]
      ,[STAT]
      ,[RECSUPPLY]
      ,[BATCH]
      ,[COMPCODE]
      ,[PI_NO]
      ,[DELFLAG]
      ,[TOUCHDATE]
      ,[CHGBYHOST]
      ,[CREATEDON]
      ,[CREATEDBY]
      ,[PERDIEMNO]
      ,[SHP_DELIVERYSYSTEM]
      ,[SHP_DELIVERYSYSTEMTYPEOTHER]
      ,[SHP_DELSYSBRAND]
      ,[SHP_ENTERALDEVICE]
      ,[SHP_INCLUDEDRUGINOUTCOMES]
      ,[PH_NO]
      ,[LPM]
      ,[ABG]
      ,[PO2]
      ,[O2SAT]
      ,[TESTDATE]
      ,[TESTLOCATION]
      ,[HCPC]
      ,[DXDESC]
      ,[DXCODE]
      ,[DOCKEY]
      ,[DOCTABLE]
      ,[REQAUTH]
      ,[CFK_INSVERI]
      ,[MEDICAREREQDOC]
      ,[INFUSEFOR]
      ,[FREQTYPE]
      ,[CONT_OR_INT]
      ,[THERACLASS]
      ,[OTPUMP]
      ,[SPECIALTY]
      ,[LASTCOPAY]
      ,[DXDESC2]
      ,[DXCODE2]
      ,[DXDESC3]
      ,[DXCODE3]
      ,[DXDESC4]
      ,[DXCODE4]
      ,[REFERRAL]
      ,[CFK_OT_PARENT]
      ,[CFK_REFSOURC]
      ,[CFK_POPUPDATA_ENTSTATUS]
      ,[CFK_PNNAMES_ENTSTATUS]
      ,[ENTSTATUSCHANGED]
      ,[LASTTICKNO]
      ,[CFK_SALESREP]
      ,[REPEATORDER]
      ,[SITENO]
      ,[FACTORVARIANCE]
      ,[DOCOVERRIDETYPE]
      ,[AUTHOVERRIDETYPE]
      ,[CFK_POPUPDATA_ENTSTATUS_LASTEVENT]
      ,[CFK_OTTEMPLATES]
      ,[CFK_INSCOMP_SECONDARYPAYOR]
      ,[CFK_PATINS_SECONDARYPAYOR]
      ,[BILLFORDENIAL]
      ,[QUICKFILL]
      ,[CFK_POPUPDATA_ENTTEAMS]
      ,[CFK_ACCESS]
      ,[AUTHORIZEDQUANTITY]
      ,[REMAININGAUTHORIZEDQUANTITY]
      ,  [EffectiveDate]
      ,  [ExpirationDate]
      ,  [CurrentRowFlag]
      ,  [DeleteRowFlag]
      ,  [InsertDate]
    )
    SELECT 	
		[NO]
      ,[MRN]
      ,[RANK]
      ,[STATUS]
      ,[DESCRIP]
      ,[ORDERED]
      ,[START]
      ,[STOP]
      ,[SHOWST]
      ,[DISCHARGE]
      ,[INVNO]
      ,[ITEMNAME]
      ,[STRENGTH]
      ,[STRENGTHU]
      ,[DDI]
      ,[ROUTE]
      ,[FREQ]
      ,[DURAT]
      ,[COMMENTS]
      ,[CLASS]
      ,[RXTYPE]
      ,[RXFORMAT]
      ,[THERAPY]
      ,[DRUG]
      ,[COMPLEX]
      ,[INSNUM]
      ,[INSNO]
      ,[SCREEN]
      ,[PRIMARYFLG]
      ,[INUSE]
      ,[RPHNAME]
      ,[ACCEPTED]
      ,[BILLNO]
      ,[LISTID]
      ,[TICKINFONO]
      ,[ZREFOTNO]
      ,[STAT]
      ,[RECSUPPLY]
      ,[BATCH]
      ,[COMPCODE]
      ,[PI_NO]
      ,[DELFLAG]
      ,[TOUCHDATE]
      ,[CHGBYHOST]
      ,[CREATEDON]
      ,[CREATEDBY]
      ,[PERDIEMNO]
      ,[SHP_DELIVERYSYSTEM]
      ,[SHP_DELIVERYSYSTEMTYPEOTHER]
      ,[SHP_DELSYSBRAND]
      ,[SHP_ENTERALDEVICE]
      ,[SHP_INCLUDEDRUGINOUTCOMES]
      ,[PH_NO]
      ,[LPM]
      ,[ABG]
      ,[PO2]
      ,[O2SAT]
      ,[TESTDATE]
      ,[TESTLOCATION]
      ,[HCPC]
      ,[DXDESC]
      ,[DXCODE]
      ,[DOCKEY]
      ,[DOCTABLE]
      ,[REQAUTH]
      ,[CFK_INSVERI]
      ,[MEDICAREREQDOC]
      ,[INFUSEFOR]
      ,[FREQTYPE]
      ,[CONT_OR_INT]
      ,[THERACLASS]
      ,[OTPUMP]
      ,[SPECIALTY]
      ,[LASTCOPAY]
      ,[DXDESC2]
      ,[DXCODE2]
      ,[DXDESC3]
      ,[DXCODE3]
      ,[DXDESC4]
      ,[DXCODE4]
      ,[REFERRAL]
      ,[CFK_OT_PARENT]
      ,[CFK_REFSOURC]
      ,[CFK_POPUPDATA_ENTSTATUS]
      ,[CFK_PNNAMES_ENTSTATUS]
      ,[ENTSTATUSCHANGED]
      ,[LASTTICKNO]
      ,[CFK_SALESREP]
      ,[REPEATORDER]
      ,[SITENO]
      ,[FACTORVARIANCE]
      ,[DOCOVERRIDETYPE]
      ,[AUTHOVERRIDETYPE]
      ,[CFK_POPUPDATA_ENTSTATUS_LASTEVENT]
      ,[CFK_OTTEMPLATES]
      ,[CFK_INSCOMP_SECONDARYPAYOR]
      ,[CFK_PATINS_SECONDARYPAYOR]
      ,[BILLFORDENIAL]
      ,[QUICKFILL]
      ,[CFK_POPUPDATA_ENTTEAMS]
      ,[CFK_ACCESS]
      ,[AUTHORIZEDQUANTITY]
      ,[REMAININGAUTHORIZEDQUANTITY]
      , @DateTime AS [EffectiveDate]
      ,  NULL AS [ExpirationDate]
      ,  1 AS [CurrentRowFlag]
      ,  0 AS [DeleteRowFlag]
      ,  @DateTime AS [InsertDate]
    FROM [stage].[CPR_OT] AS [s]
    WHERE NOT EXISTS
    (
        SELECT *
        FROM [ods].[CPR_OT] AS [t]
        WHERE [t].[NO] = [s].[NO]
              AND [t].[CurrentRowFlag] = 1
    );

END;


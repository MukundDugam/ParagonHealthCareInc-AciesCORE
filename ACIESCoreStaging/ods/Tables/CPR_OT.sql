
CREATE TABLE [ods].[CPR_OT](
	[RecordID] [INT] IDENTITY(1, 1) NOT NULL,
	[NO] [int] NOT NULL,
	[MRN] [varchar](6) NULL,
	[RANK] [numeric](8, 1) NULL,
	[STATUS] [varchar](10) NULL,
	[DESCRIP] [varchar](60) NULL,
	[ORDERED] [datetime] NULL,
	[START] [datetime] NULL,
	[STOP] [datetime] NULL,
	[SHOWST] [datetime] NULL,
	[DISCHARGE] [datetime] NULL,
	[INVNO] [int] NULL,
	[ITEMNAME] [varchar](35) NULL,
	[STRENGTH] [varchar](15) NULL,
	[STRENGTHU] [varchar](10) NULL,
	[DDI] [int] NULL,
	[ROUTE] [varchar](6) NULL,
	[FREQ] [varchar](20) NULL,
	[DURAT] [varchar](12) NULL,
	[COMMENTS] [varchar](60) NULL,
	[CLASS] [varchar](3) NULL,
	[RXTYPE] [varchar](8) NULL,
	[RXFORMAT] [int] NULL,
	[THERAPY] [int] NULL,
	[DRUG] [int] NULL,
	[COMPLEX] [int] NULL,
	[INSNUM] [varchar](1) NULL,
	[INSNO] [int] NULL,
	[SCREEN] [varchar](1) NULL,
	[PRIMARYFLG] [varchar](1) NULL,
	[INUSE] [varchar](3) NULL,
	[RPHNAME] [varchar](40) NULL,
	[ACCEPTED] [varchar](1) NULL,
	[BILLNO] [int] NULL,
	[LISTID] [varchar](50) NULL,
	[TICKINFONO] [int] NULL,
	[ZREFOTNO] [int] NULL,
	[STAT] [int] NULL,
	[RECSUPPLY] [int] NULL,
	[BATCH] [varchar](10) NULL,
	[COMPCODE] [varchar](15) NULL,
	[PI_NO] [int] NULL,
	[DELFLAG] [int] NOT NULL,
	[TOUCHDATE] [datetime] NULL,
	[CHGBYHOST] [varchar](100) NULL,
	[CREATEDON] [datetime] NULL,
	[CREATEDBY] [varchar](100) NULL,
	[PERDIEMNO] [int] NULL,
	[SHP_DELIVERYSYSTEM] [varchar](50) NULL,
	[SHP_DELIVERYSYSTEMTYPEOTHER] [varchar](100) NULL,
	[SHP_DELSYSBRAND] [varchar](50) NULL,
	[SHP_ENTERALDEVICE] [varchar](50) NULL,
	[SHP_INCLUDEDRUGINOUTCOMES] [int] NULL,
	[PH_NO] [int] NULL,
	[LPM] [varchar](3) NULL,
	[ABG] [varchar](3) NULL,
	[PO2] [numeric](4, 1) NULL,
	[O2SAT] [varchar](3) NULL,
	[TESTDATE] [datetime] NULL,
	[TESTLOCATION] [varchar](33) NULL,
	[HCPC] [varchar](5) NULL,
	[DXDESC] [varchar](120) NULL,
	[DXCODE] [varchar](9) NULL,
	[DOCKEY] [int] NULL,
	[DOCTABLE] [varchar](50) NULL,
	[REQAUTH] [int] NULL,
	[CFK_INSVERI] [int] NULL,
	[MEDICAREREQDOC] [int] NULL,
	[INFUSEFOR] [numeric](15, 4) NULL,
	[FREQTYPE] [varchar](10) NULL,
	[CONT_OR_INT] [varchar](10) NULL,
	[THERACLASS] [varchar](200) NULL,
	[OTPUMP] [varchar](30) NULL,
	[SPECIALTY] [bit] NULL,
	[LASTCOPAY] [numeric](15, 4) NULL,
	[DXDESC2] [varchar](120) NULL,
	[DXCODE2] [varchar](9) NULL,
	[DXDESC3] [varchar](120) NULL,
	[DXCODE3] [varchar](9) NULL,
	[DXDESC4] [varchar](120) NULL,
	[DXCODE4] [varchar](9) NULL,
	[REFERRAL] [varchar](70) NULL,
	[CFK_OT_PARENT] [int] NULL,
	[CFK_REFSOURC] [int] NULL,
	[CFK_POPUPDATA_ENTSTATUS] [int] NULL,
	[CFK_PNNAMES_ENTSTATUS] [int] NULL,
	[ENTSTATUSCHANGED] [datetime] NULL,
	[LASTTICKNO] [int] NULL,
	[CFK_SALESREP] [int] NULL,
	[REPEATORDER] [bit] NULL,
	[SITENO] [int] NULL,
	[FACTORVARIANCE] [int] NULL,
	[DOCOVERRIDETYPE] [int] NULL,
	[AUTHOVERRIDETYPE] [int] NULL,
	[CFK_POPUPDATA_ENTSTATUS_LASTEVENT] [int] NULL,
	[CFK_OTTEMPLATES] [int] NULL,
	[CFK_INSCOMP_SECONDARYPAYOR] [int] NULL,
	[CFK_PATINS_SECONDARYPAYOR] [int] NULL,
	[BILLFORDENIAL] [bit] NULL,
	[QUICKFILL] [bit] NULL,
	[CFK_POPUPDATA_ENTTEAMS] [int] NULL,
	[CFK_ACCESS] [int] NULL,
	[AUTHORIZEDQUANTITY] [int] NULL,
	[REMAININGAUTHORIZEDQUANTITY] [int] NULL,
	[EffectiveDate] [DATETIME] NULL,
    [ExpirationDate] [DATETIME] NULL,    
    [CurrentRowFlag] [BIT] NOT NULL,
    [DeleteRowFlag] [BIT] NOT NULL,
    [InsertDate] [DATETIME] NULL,
    [UpdateDate] [DATETIME] NULL,
    CONSTRAINT [PKods.CPR_OT.RecordID]
        PRIMARY KEY CLUSTERED ([RecordID] ASC)
) ON [PRIMARY]
GO
ALTER TABLE [ods].[CPR_OT]
ADD CONSTRAINT [ods.CPR_OTEffectiveDate]
    DEFAULT (GETDATE()) FOR [EffectiveDate]
GO
ALTER TABLE [ods].[CPR_OT]
ADD CONSTRAINT [ods.CPR_OTDeleteRowFlag]
    DEFAULT ((0)) FOR [DeleteRowFlag]
GO
ALTER TABLE [ods].[CPR_OT]
ADD CONSTRAINT [ods.CPR_OTInsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]
GO

CREATE TABLE [ods].[CPR_BILLED](
	[RecordID] [INT] IDENTITY(1, 1) NOT NULL,
	[CPK_BILLED] [int] NOT NULL,
	[MRN] [varchar](6) NULL,
	[BILLNO] [int] NULL,
	[BILLTXT] [varchar](6) NULL,
	[BILLTYPE] [varchar](4) NULL,
	[DATEBILLED] [datetime] NULL,
	[FROM_] [datetime] NULL,
	[TO_] [datetime] NULL,
	[PAYOR] [varchar](35) NULL,
	[CHARGE] [numeric](15, 2) NULL,
	[ALLOWED] [numeric](15, 2) NULL,
	[PAYREC] [numeric](15, 2) NULL,
	[ADJUSTAMT] [numeric](15, 2) NULL,
	[ADJDATE] [datetime] NULL,
	[ADJTYPE] [varchar](5) NULL,
	[DESCRIPT] [varchar](3) NULL,
	[CHECKNO] [varchar](50) NULL,
	[CHECKDATE] [datetime] NULL,
	[DEPOSITED] [datetime] NULL,
	[BALANCE] [numeric](15, 4) NULL,
	[OBALANCE] [numeric](15, 4) NOT NULL,
	[TOTPAYMENT] [numeric](15, 4) NULL,
	[TOTADJ] [numeric](15, 4) NULL,
	[COST] [numeric](15, 4) NULL,
	[INVOICETYP] [varchar](1) NULL,
	[TEXTTYPE] [varchar](1) NULL,
	[REQUIRECMN] [varchar](1) NULL,
	[CMNTYPE] [int] NULL,
	[CERTONFILE] [varchar](1) NULL,
	[CPRCMNNO] [int] NULL,
	[PRINTYN] [varchar](1) NULL,
	[SENTYN] [varchar](1) NULL,
	[PID] [varchar](8) NULL,
	[LASTSENT] [datetime] NULL,
	[TAX] [numeric](15, 4) NULL,
	[LAST_NAME] [varchar](25) NULL,
	[FIRST_NAME] [varchar](25) NULL,
	[BATCHPAY] [numeric](15, 4) NULL,
	[RESUB] [varchar](1) NULL,
	[REVCODE] [varchar](8) NULL,
	[MC2COMP] [varchar](15) NULL,
	[NURSING] [varchar](1) NULL,
	[PAYTYPE] [varchar](15) NULL,
	[ZERO] [int] NULL,
	[YESPOST] [varchar](1) NULL,
	[SORTFLD] [varchar](45) NULL,
	[COLLNOTE] [varchar](70) NULL,
	[REMARK] [varchar](103) NULL,
	[CLOSENUM] [int] NULL,
	[SCRIPTEXT] [varchar](10) NULL,
	[LINE9] [varchar](39) NULL,
	[RXDATE] [datetime] NULL,
	[HOSPITAL] [varchar](5) NULL,
	[HOSPSITE] [int] NULL,
	[CLAIMPAID] [numeric](15, 4) NULL,
	[PAMC] [varchar](12) NULL,
	[IVRT] [varchar](2) NULL,
	[MD] [varchar](30) NULL,
	[IDNUMD] [varchar](15) NULL,
	[RXREF] [varchar](3) NULL,
	[RXDDATE] [datetime] NULL,
	[RXPDATE] [datetime] NULL,
	[MMAFORMID] [int] NULL,
	[MMAFORMFOR] [int] NULL,
	[ZEROOUT] [varchar](20) NULL,
	[INSNO] [int] NULL,
	[PH_NO] [int] NULL,
	[BATCHPRINT] [int] NULL,
	[RESPONSIBL] [int] NULL,
	[TXCREATED] [int] NULL,
	[TRANSMIT] [int] NULL,
	[UC_NO] [int] NULL,
	[BATCHNO] [int] NULL,
	[PI_NO] [int] NULL,
	[DELFLAG] [int] NOT NULL,
	[TOUCHDATE] [datetime] NULL,
	[CHGBYHOST] [varchar](100) NULL,
	[CREATEDON] [datetime] NULL,
	[CREATEDBY] [varchar](100) NULL,
	[ONHOLDMSG] [varchar](254) NULL,
	[POS] [int] NULL,
	[PMTTYPE] [varchar](30) NULL,
	[CARDTYPE] [varchar](30) NULL,
	[DENIALEXP] [int] NULL,
	[CFK_RTBSTAT] [int] NULL,
	[CFK_CLIENT] [int] NULL,
	[CFK_REFSOURC] [int] NULL,
	[BILLASDENIAL] [bit] NULL,
	[CFK_POSTERMID] [int] NULL,
	[CROSSEDOVER] [bit] NULL,
	[CFK_RECRENT] [int] NULL,
	[CFK_RENTALS] [int] NULL,
	[cfk_labels] [int] NULL,
	[rtpbatchnum] [int] NULL,
	[orig_billno] [int] NULL,
	[cfk_pnnames_status] [int] NULL,
	[EffectiveDate] [DATETIME] NULL,
    [ExpirationDate] [DATETIME] NULL,    
    [CurrentRowFlag] [BIT] NOT NULL,
    [DeleteRowFlag] [BIT] NOT NULL,
    [InsertDate] [DATETIME] NULL,
    [UpdateDate] [DATETIME] NULL,
    CONSTRAINT [PKods.CPR_BILLED.RecordID]
        PRIMARY KEY CLUSTERED ([RecordID] ASC)
) ON [PRIMARY]
GO
ALTER TABLE [ods].[CPR_BILLED]
ADD CONSTRAINT [ods.CPR_BILLEDEffectiveDate]
    DEFAULT (GETDATE()) FOR [EffectiveDate]
GO
ALTER TABLE [ods].[CPR_BILLED]
ADD CONSTRAINT [ods.CPR_BILLEDDeleteRowFlag]
    DEFAULT ((0)) FOR [DeleteRowFlag]
GO
ALTER TABLE [ods].[CPR_BILLED]
ADD CONSTRAINT [ods.CPR_BILLEDInsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]
GO

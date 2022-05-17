CREATE TABLE [ods].[CPR_SITES](
	[RecordID] [INT] IDENTITY(1, 1) NOT NULL,
	[SITENO] [int] NOT NULL,
	[SITENAME] [varchar](30) NULL,
	[SEL] [varchar](1) NULL,
	[SPWENC] [varchar](10) NULL,
	[MAXRXNO] [int] NULL,
	[ORIGRXNO] [int] NULL,
	[CPMAXRXNO] [int] NULL,
	[DELFLAG] [int] NOT NULL,
	[TOUCHDATE] [datetime] NULL,
	[CHGBYHOST] [varchar](100) NULL,
	[CREATEDON] [datetime] NULL,
	[CREATEDBY] [varchar](100) NULL,
	[FAXPATH] [varchar](100) NULL,
	[HMEFAXPATH] [varchar](100) NULL,
	[SHP_PROVIDERID] [varchar](10) NULL,
	[SCANPATH] [varchar](100) NULL,
	[HHLAUSER] [varchar](10) NULL,
	[HHLAPASS] [varchar](10) NULL,
	[HHLALOC] [varchar](4) NULL,
	[HHLADATE] [datetime] NULL,
	[sprxfaxpath] [varchar](100) NULL,
	[cfk_logins_msd] [int] NULL,
	[surescriptsid] [varchar](50) NULL,
	[unc_faxpath] [varchar](100) NULL,
	[unc_hmefaxpath] [varchar](100) NULL,
	[unc_sprxfaxpath] [varchar](100) NULL,
	[unc_scanpath] [varchar](100) NULL,
	[cfk_logins_payware] [int] NULL,
	[EffectiveDate] [DATETIME] NULL,
    [ExpirationDate] [DATETIME] NULL,    
    [CurrentRowFlag] [BIT] NOT NULL,
    [DeleteRowFlag] [BIT] NOT NULL,
    [InsertDate] [DATETIME] NULL,
    [UpdateDate] [DATETIME] NULL,
    CONSTRAINT [PKods.CPR_SITES.RecordID]
        PRIMARY KEY CLUSTERED ([RecordID] ASC)
) ON [PRIMARY]
GO
ALTER TABLE [ods].[CPR_SITES]
ADD CONSTRAINT [ods.CPR_SITESEffectiveDate]
    DEFAULT (GETDATE()) FOR [EffectiveDate]
GO
ALTER TABLE [ods].[CPR_SITES]
ADD CONSTRAINT [ods.CPR_SITESDeleteRowFlag]
    DEFAULT ((0)) FOR [DeleteRowFlag]
GO
ALTER TABLE [ods].[CPR_SITES]
ADD CONSTRAINT [ods.CPR_SITESInsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]
GO

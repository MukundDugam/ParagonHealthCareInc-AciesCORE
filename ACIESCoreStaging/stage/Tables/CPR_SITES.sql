CREATE TABLE [stage].[CPR_SITES](
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
	[InsertDate] DATETIME,
 CONSTRAINT [CN__SITES_SITENO] PRIMARY KEY CLUSTERED 
(
	[SITENO] ASC
)
)
GO
ALTER TABLE [stage].[CPR_SITES]
ADD CONSTRAINT [stage.CPR_SITESInsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]

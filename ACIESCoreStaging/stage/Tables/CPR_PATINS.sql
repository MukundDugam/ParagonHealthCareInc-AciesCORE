CREATE TABLE [stage].[CPR_PATINS](
	[CPK_PATINS] [int] not null,
	[MRN] [varchar](6) NULL,
	[INSNO] [int] NULL,
	[RANK] [numeric](8, 1) NULL,
	[STATUS] [varchar](10) NULL,
	[INSURANCE] [varchar](35) NULL,
	[PAYOR] [varchar](15) NULL,
	[START] [datetime] NULL,
	[STOP] [datetime] NULL,
	[SHOWST] [datetime] NULL,
	[POLICY] [varchar](28) NULL,
	[GROUP_NUM] [varchar](25) NULL,
	[POLICY_OW] [varchar](52) NULL,
	[INSCONTAC] [varchar](20) NULL,
	[INSCPHONE] [varchar](12) NULL,
	[EMPLOYER] [varchar](27) NULL,
	[OTHERINS] [int] NULL,
	[DELFLAG] [int] NOT NULL,
	[TOUCHDATE] [datetime] NULL,
	[CHGBYHOST] [varchar](100) NULL,
	[CREATEDON] [datetime] NULL,
	[CREATEDBY] [varchar](100) NULL,
	[PLANID] [varchar](30) NULL,
	[CFK_INSCOMP_NEXT] [int] NULL,
	[CFK_PATINS_NEXT] [int] NULL,
	[PCODE] [varchar](3) NULL,
	[DOIDATE] [datetime] NULL,
	[ONSETDATE] [datetime] NULL,
	[PARTDFACILITY] [bit] NULL,
	[POLICY_FLAG] [bit] NULL,
	[PATIENTCONVKEY] [varchar](40) NULL,
	[INSCOMPCONVKEY] [varchar](40) NULL,
	[BILLASDENIAL] [bit] NULL,
	[MSPTYPE] [varchar](2) NULL,
	[POLICYOWNERMIDDLENAME] [varchar](25) NULL,
	[COUPONINFOREQUIRED] [bit] NULL,
	[InsertDate] DATETIME,
 CONSTRAINT [CN__PATINS_CPK_PATINS] PRIMARY KEY CLUSTERED 
(
	[CPK_PATINS] ASC
)
)
GO
ALTER TABLE [stage].[CPR_PATINS]
ADD CONSTRAINT [stage.CPR_PATINSInsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]

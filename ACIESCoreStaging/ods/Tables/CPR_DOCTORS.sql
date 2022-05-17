CREATE TABLE [ods].[CPR_DOCTORS](
	[RecordID] [INT] IDENTITY(1, 1) NOT NULL,
	[NO] [int] NOT NULL,
	[PH_LAST] [varchar](20) NULL,
	[PH_FIRST] [varchar](20) NULL,
	[PH_SPEC] [varchar](20) NULL,
	[PH_ORG] [varchar](40) NULL,
	[PH_ADDRESS] [varchar](40) NULL,
	[PH_ADDR2] [varchar](40) NULL,
	[PH_CITY] [varchar](20) NULL,
	[PH_STATE] [varchar](2) NULL,
	[PH_ZIP] [varchar](10) NULL,
	[PH_PHONE] [varchar](12) NULL,
	[PH_PHONEXT] [varchar](5) NULL,
	[PH_FAX] [varchar](12) NULL,
	[PH_PAGER] [varchar](12) NULL,
	[PH_EMAIL] [varchar](50) NULL,
	[PH_UPIN] [varchar](15) NULL,
	[PH_MCD] [varchar](15) NULL,
	[PH_DEA] [varchar](13) NULL,
	[PH_LIC] [varchar](15) NULL,
	[PH_LASTLIC] [datetime] NULL,
	[PH_NEXTLIC] [datetime] NULL,
	[PH_LASTINI] [varchar](3) NULL,
	[PH_NEXTINI] [varchar](3) NULL,
	[PH_DPS] [varchar](12) NULL,
	[PH_MCDKS] [varchar](15) NULL,
	[PH_MCR] [varchar](15) NULL,
	[SITENO] [int] NULL,
	[PH_PRIV1] [varchar](15) NULL,
	[PH_CONT] [varchar](40) NULL,
	[NOTES] [varchar](max) NULL,
	[REFCLASS] [varchar](1) NULL,
	[GEOLOC] [varchar](1) NULL,
	[SREP_NO] [int] NULL,
	[SREP_CODE] [varchar](3) NULL,
	[PH_BCBS] [varchar](15) NULL,
	[DELFLAG] [int] NOT NULL,
	[TOUCHDATE] [datetime] NULL,
	[CHGBYHOST] [varchar](100) NULL,
	[CREATEDON] [datetime] NULL,
	[CREATEDBY] [varchar](100) NULL,
	[PH_RRMCRID] [varchar](30) NULL,
	[CONVKEY] [varchar](40) NULL,
	[PROFDESIG] [varchar](4) NULL,
	[PH_NPI] [varchar](80) NULL,
	[TAXONOMY] [varchar](30) NULL,
	[WEBACCESS] [bit] NULL,
	[INACTIVE] [bit] NULL,
	[INSCRYBE] [bit] NULL,
	[CMNDELIVERY] [int] NULL,
	[ph_caracc] [varchar](50) NULL,
	[pecos] [bit] NULL,
	[pecosexclude] [bit] NULL,
	[hcid] [varchar](10) NULL,
	[cfk_central_contact] [int] NULL,
	[oralcode] [varchar](10) NULL,
	[caprelsaauth] [varchar](10) NULL,
	[ph_nadean] [varchar](9) NULL,
	[EffectiveDate] [DATETIME] NULL,
    [ExpirationDate] [DATETIME] NULL,    
    [CurrentRowFlag] [BIT] NOT NULL,
    [DeleteRowFlag] [BIT] NOT NULL,
    [InsertDate] [DATETIME] NULL,
    [UpdateDate] [DATETIME] NULL,
    CONSTRAINT [PKods.CPR_DOCTORS.RecordID]
        PRIMARY KEY CLUSTERED ([RecordID] ASC)
) ON [PRIMARY]
GO
ALTER TABLE [ods].[CPR_DOCTORS]
ADD CONSTRAINT [ods.CPR_DOCTORSEffectiveDate]
    DEFAULT (GETDATE()) FOR [EffectiveDate]
GO
ALTER TABLE [ods].[CPR_DOCTORS]
ADD CONSTRAINT [ods.CPR_DOCTORSDeleteRowFlag]
    DEFAULT ((0)) FOR [DeleteRowFlag]
GO
ALTER TABLE [ods].[CPR_DOCTORS]
ADD CONSTRAINT [ods.CPR_DOCTORSInsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]
GO
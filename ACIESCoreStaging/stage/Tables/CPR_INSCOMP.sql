﻿CREATE TABLE [stage].[CPR_INSCOMP](
	[NO] [int]  NOT NULL,
	[CONTACT] [varchar](20) NULL,
	[ORG] [varchar](35) NULL,
	[ID] [varchar](12) NULL,
	[PAYOR] [varchar](15) NULL,
	[ADDRESS] [varchar](30) NULL,
	[ADDR2] [varchar](30) NULL,
	[PHONE] [varchar](12) NULL,
	[FAX] [varchar](12) NULL,
	[CITY] [varchar](20) NULL,
	[ST] [varchar](2) NULL,
	[ZIP] [varchar](10) NULL,
	[SBCONTACT] [varchar](20) NULL,
	[SBORG] [varchar](35) NULL,
	[SBADDRESS] [varchar](55) NULL,
	[SBCITY] [varchar](20) NULL,
	[SBST] [varchar](2) NULL,
	[SBZIP] [varchar](10) NULL,
	[PROVIDER] [varchar](15) NULL,
	[NEICPID] [varchar](15) NULL,
	[NETID] [varchar](25) NULL,
	[NEEDFAAT] [varchar](1) NULL,
	[NEEDNDC] [varchar](1) NULL,
	[PHARMNO] [varchar](15) NULL,
	[PCN] [varchar](10) NULL,
	[BINNO] [varchar](6) NULL,
	[NCPDPVER] [varchar](2) NULL,
	[MDFIELD] [varchar](1) NULL,
	[DEFCMPDCD] [varchar](1) NULL,
	[DEFPAMC] [varchar](12) NULL,
	[PTINFO] [varchar](1) NULL,
	[EMPINFO] [varchar](1) NULL,
	[INVOICETYP] [varchar](1) NULL,
	[TEXTTYPE] [varchar](1) NULL,
	[HCPCUNITS] [varchar](1) NULL,
	[YEAR4DIG] [varchar](1) NULL,
	[DOLLARSYM] [varchar](1) NULL,
	[PGTOT] [varchar](1) NULL,
	[SHOPAY2ND] [varchar](1) NULL,
	[NOTES] [varchar](max) NULL,
	[MATRIXYN] [varchar](10) NULL,
	[COLUMNK] [varchar](1) NULL,
	[ICD9TEXT] [varchar](1) NULL,
	[MRNORPID] [varchar](1) NULL,
	[SOCDATE] [varchar](1) NULL,
	[USETYPE] [varchar](2) NULL,
	[PLSERV] [varchar](2) NULL,
	[ENVOYSPLIT] [varchar](1) NULL,
	[REQAUTH] [varchar](1) NULL,
	[DEFDFEE] [numeric](7, 2) NULL,
	[BILLMETH] [varchar](20) NULL,
	[KILLDOT] [varchar](1) NULL,
	[SITENO] [int] NULL,
	[UPDTSP] [varchar](1) NULL,
	[UPDTEP] [varchar](1) NULL,
	[NEVSTAT] [varchar](1) NULL,
	[INACTIVE] [int] NULL,
	[ADDR30_1] [varchar](1) NULL,
	[NEEDEAAT] [varchar](1) NULL,
	[ALLOWEDS] [varchar](1) NULL,
	[SPECIAL] [varchar](1) NULL,
	[UBSPECCODE] [varchar](1) NULL,
	[DOCIDNUM] [varchar](1) NULL,
	[HCFA2LIN] [varchar](1) NULL,
	[EIN] [varchar](15) NULL,
	[TXTIMAGE] [varchar](1) NULL,
	[WRAP24D] [varchar](1) NULL,
	[GROUP33] [varchar](15) NULL,
	[RENDERID] [varchar](15) NULL,
	[NURSETIME] [varchar](1) NULL,
	[CONTRACT] [int] NULL,
	[CONTRACTNO] [int] NULL,
	[CLMINQUIRY] [varchar](1) NULL,
	[DRUGMETH] [varchar](10) NULL,
	[CLEARTYPE] [varchar](1) NULL,
	[PDTYPE] [varchar](10) NULL,
	[CERTID] [varchar](30) NULL,
	[DEFCOLLECT] [int] NULL,
	[COPYNDC] [varchar](1) NULL,
	[CALCGROSS] [varchar](1) NULL,
	[SPIDQUAL] [varchar](2) NULL,
	[OVERALL] [varchar](10) NULL,
	[GROUP_] [varchar](10) NULL,
	[TXPST] [varchar](1) NULL,
	[PIDQUAL] [varchar](2) NULL,
	[PCPIDQUAL] [varchar](2) NULL,
	[CALCING] [varchar](1) NULL,
	[RENDPROVID] [varchar](80) NULL,
	[PROVIDTYPE] [varchar](2) NULL,
	[TAXONOMY] [varchar](30) NULL,
	[SECONDID] [varchar](30) NULL,
	[SECIDTYPE] [varchar](3) NULL,
	[SENDZEROS] [varchar](1) NULL,
	[DEFPOPSID] [varchar](2) NULL,
	[DEFIVPSID] [varchar](2) NULL,
	[SUMCOST] [varchar](1) NULL,
	[INDTYPE] [varchar](2) NULL,
	[SUMINGR] [varchar](1) NULL,
	[NOCMPD] [varchar](1) NULL,
	[UNIQUERX] [varchar](1) NULL,
	[PROIDQUAL] [varchar](2) NULL,
	[USEEMPLPCN] [varchar](1) NULL,
	[DELFLAG] [int] NOT NULL,
	[TOUCHDATE] [datetime] NULL,
	[CHGBYHOST] [varchar](100) NULL,
	[CREATEDON] [datetime] NULL,
	[CREATEDBY] [varchar](100) NULL,
	[NOHCFAINV] [varchar](1) NULL,
	[INDTYP] [varchar](2) NULL,
	[ORDPROVTYP] [varchar](2) NULL,
	[REFERINGMD] [varchar](1) NULL,
	[BILLPROVID] [varchar](30) NULL,
	[BLPROVTYP] [varchar](2) NULL,
	[IMPORTDIAG] [varchar](1) NULL,
	[NOSSN] [int] NULL,
	[NAICNO] [varchar](80) NULL,
	[EBILLGOOD] [varchar](1) NULL,
	[USEDAILYPRICE] [varchar](1) NULL,
	[USEMCRMODS] [varchar](1) NULL,
	[CREATEFOLLOWUP] [int] NULL,
	[HCPCBASEDSP] [varchar](1) NULL,
	[RRMCR] [int] NULL,
	[AUTOSPLITDT] [varchar](1) NULL,
	[CONVKEY] [varchar](40) NULL,
	[SERVICECODE] [varchar](2) NULL,
	[AUTHREQUIREMENT] [varchar](1) NULL,
	[COLLECTOR] [int] NULL,
	[SPAN2M] [int] NULL,
	[COLLAPSEIT] [int] NULL,
	[DEFCUSTLOC] [varchar](2) NULL,
	[USECONTRACTINFO] [int] NULL,
	[USENDC] [int] NULL,
	[USENARRDESC] [int] NULL,
	[BOX33BQUALIFIER] [varchar](4) NULL,
	[USE24J] [int] NULL,
	[BOX24IQUALIFIER] [varchar](2) NULL,
	[CMNREQUIRED] [bit] NULL,
	[UPDATEALLSP] [bit] NULL,
	[UPDATEALLEP] [bit] NULL,
	[BILLASINDIVIDUAL] [int] NULL,
	[PAYEEID] [varchar](30) NULL,
	[PULLB1FROMCLIENT] [bit] NULL,
	[USEGRTNPI] [bit] NULL,
	[USEDOCNPI] [bit] NULL,
	[USENDCUNITS] [bit] NULL,
	[SENDNDCUNITQUAL] [bit] NULL,
	[OCNA] [varchar](30) NULL,
	[CLAIMOFFICEID] [varchar](30) NULL,
	[REVGROUP] [bit] NULL,
	[REVCARDHOLDER] [bit] NULL,
	[SEND2010BBN] [bit] NULL,
	[DEFRXORIGIN] [varchar](1) NULL,
	[AUTOPOPEV] [bit] NULL,
	[DEFPATYPE] [varchar](1) NULL,
	[TIMELYFILING] [varchar](10) NULL,
	[USENDCQUAL] [bit] NULL,
	[PERCENTCOV] [numeric](15, 4) NULL,
	[SUPPLEMENTARY] [bit] NULL,
	[SENDAMTON2ND] [bit] NULL,
	[SENDPLANID] [bit] NULL,
	[MATRIXTYPE] [int] NULL,
	[MCRSPECMULT] [numeric](15, 4) NULL,
	[MCREXPMULT] [numeric](15, 4) NULL,
	[MCRMATRIXST] [varchar](2) NULL,
	[EOBINDICATOR] [bit] NULL,
	[EXPORTCHARGES] [bit] NULL,
	[EXPORTADJCODE] [varchar](15) NULL,
	[PAYER340B] [bit] NULL,
	[EXCLUDEREFG5] [bit] NULL,
	[EXCLUDEREFFY] [bit] NULL,
	[USEMCALFORMATTING] [bit] NULL,
	[MCALSENDMODIFIER] [bit] NULL,
	[MCALSENDUPN] [bit] NULL,
	[COMBINEDEL] [bit] NULL,
	[SPANRECRENT] [bit] NULL,
	[NODECICD9] [bit] NULL,
	[MEDICALITEMIZED] [bit] NULL,
	[PROFITMARGIN] [numeric](15, 4) NULL,
	[SENDSTARTONLY] [bit] NULL,
	[INITIALCLAIM] [bit] NULL,
	[BILLARREARS] [bit] NULL,
	[TYPECODE] [varchar](2) NULL,
	[ORGSIGNATURE] [bit] NULL,
	[AUTOTRANSFER] [bit] NULL,
	[TRANSFERTHRESHOLD] [numeric](15, 4) NULL,
	[TRANSFERADJCODE] [varchar](50) NULL,
	[SEND2010AAPER] [bit] NULL,
	[SENDEMPLOYER2010BA] [bit] NULL,
	[SEND2300K3] [bit] NULL,
	[REMOVEDASHCLM01] [bit] NULL,
	[MULTIUSENOTBILLABLE] [bit] NULL,
	[AUTOMOVESPRX] [bit] NULL,
	[OTHERCOVCODE] [varchar](2) NULL,
	[COBSENDCOPAY] [bit] NULL,
	[ADDCHARGE] [bit] NULL,
	[REMOVED9DU] [bit] NULL,
	[USEUNITPRICE] [bit] NULL,
	[CHECKCO35] [bit] NULL,
	[DUSECONDARY] [int] NULL,
	[D9SECONDARY] [int] NULL,
	[DEFBOX32] [int] NULL,
	[AUTOSPLITPERDIEMS] [bit] NULL,
	[BILLPROVIDFROMCLIENT] [bit] NULL,
	[E9SENDPHARMACIST] [bit] NULL,
	[NPI] [varchar](80) NULL,
	[ALLUPPERCASE] [bit] NULL,
	[CFK_ADJCODES_LIFEMAX] [int] NULL,
	[BLANKPERSONCODE] [bit] NULL,
	[SENDDUFORDQ] [bit] NULL,
	[SENDEMAILINHN] [bit] NULL,
	[SERVICETYPE] [numeric](2, 0) NULL,
	[SENDF5INDX] [bit] NULL,
	[CREATEREJECTIONCOB] [bit] NULL,
	[CBAPAYOR] [bit] NULL,
	[DOCNONBILL] [bit] NOT NULL,
	[SENDREFEA] [bit] NULL,
	[FORCE4010] [bit] NULL,
	[SPLITBYAUTH] [bit] NULL,
	[ENABLEBENEFIT] [bit] NULL,
	[CLAIMBYCALENDARMONTH] [bit] NULL,
	[REPORTTYPE] [varchar](2) NULL,
	[TRANSCODE] [varchar](2) NULL,
	[ASSESSTAX] [bit] NULL,
	[TAX_FIXEDRATE] [bit] NULL,
	[ASSESSTAX_RENTALS] [bit] NULL,
	[CFK_CENTRAL_CONTACT] [int] NULL,
	[SENDPRESCRIBERFIRSTNAME] [bit] NULL,
	[SENDNP] [bit] NULL,
	[DEFAULTPRCOBENTRY] [varchar](15) NULL,
	[EXCLUDE2420EPHYSICIAN] [bit] NULL,
	[DEFAULTPLACERESIDENCE] [varchar](2) NULL,
	[POPPRIMARYPAIDAMOUNTDISABLED] [bit] NULL,
	[SENDHPID2010BB] [bit] NULL,
	[SENDPIDREF] [bit] NULL,
	[HPID] [varchar](25) NULL,
	[SECONDARYPLANTYPE] [int] NULL,
	[ALWAYSBILLASDENIAL] [bit] NULL,
	[FORCEICD9] [bit] NULL,
	[CMS1500_ICD10_BOX30] [bit] NULL,
	[CMS1500_PRINTBOX17QUAL] [bit] NULL,
	[CMS1500_USE_OLD_1500] [bit] NULL,
	[CMS1500_BOX17AQUAL] [varchar](3) NULL,
	[CMS1500_PRINTDECIMAL_DIAGCODE] [bit] NULL,
	[CFK_PERDIEMTEMPLATEHEADER] [int] NULL,
	[SENDUNITOFMEASURE] [bit] NULL,
	[IGNOREMISSINGDIAGNOSIS] [bit] NULL,
	[CLAIMSUBMISSIONFEEADJCODE] [varchar](5) NULL,
	[CLAIMSUBMISSIONFEEQUALIFIER] [varchar](5) NULL,
	[defaultsalestaxbasis] [varchar](2) NULL,
	[billdiscardquantity] [bit] NULL,
	[authbydosefrequency] [bit] NULL,
	[alwaysautotransfer] [bit] NULL,
	[couponinforequired] [bit] NULL,
	[InsertDate] DATETIME,
 CONSTRAINT [CN__INSCOMP_NO] PRIMARY KEY CLUSTERED 
(
	[NO] ASC
)
)
GO
ALTER TABLE [stage].[CPR_INSCOMP]
ADD CONSTRAINT [stage.CPR_INSCOMPInsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]

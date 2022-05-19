
CREATE TABLE [ods].[CPR_POPUPDATA](
	[RecordID] [INT] IDENTITY(1, 1) NOT NULL,
	[CPK_POPUPDATA] [int] NOT NULL,
	[TEXT_] [varchar](125) NULL,
	[CODE] [varchar](100) NULL,
	[CFK_POPUPS] [int] NULL,
	[POPUPNAME] [varchar](20) NULL,
	[DELFLAG] [int] NOT NULL,
	[CREATEDON] [datetime] NULL,
	[TOUCHEDBY] [varchar](200) NULL,
	[TOUCHDATE] [datetime] NULL,
	[CREATEDBY] [varchar](100) NULL,
	[CHGBYHOST] [varchar](100) NULL,
	[AMOUNT] [numeric](15, 4) NULL,
	[CFK_TABLE] [int] NULL,
	[ITEMDATE] [datetime] NULL,
	[EffectiveDate] [DATETIME] NULL,
    [ExpirationDate] [DATETIME] NULL,    
    [CurrentRowFlag] [BIT] NOT NULL,
    [DeleteRowFlag] [BIT] NOT NULL,
    [InsertDate] [DATETIME] NULL,
    [UpdateDate] [DATETIME] NULL,
    CONSTRAINT [PKods.CPR_POPUPDATA.RecordID]
        PRIMARY KEY CLUSTERED ([RecordID] ASC)
) ON [PRIMARY]
GO
ALTER TABLE [ods].[CPR_POPUPDATA]
ADD CONSTRAINT [ods.CPR_POPUPDATAEffectiveDate]
    DEFAULT (GETDATE()) FOR [EffectiveDate]
GO
ALTER TABLE [ods].[CPR_POPUPDATA]
ADD CONSTRAINT [ods.CPR_POPUPDATADeleteRowFlag]
    DEFAULT ((0)) FOR [DeleteRowFlag]
GO
ALTER TABLE [ods].[CPR_POPUPDATA]
ADD CONSTRAINT [ods.CPR_POPUPDATAInsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]
GO

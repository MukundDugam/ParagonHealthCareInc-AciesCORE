CREATE TABLE [ods].[NG_PIVC_Orders_]
(
	[RecordID]	[INT] IDENTITY(1, 1) NOT NULL,
	[enterprise_id] [char](5) NOT NULL,
	[practice_id] [char](4) NOT NULL,
	[person_id] [uniqueidentifier] NOT NULL,
	[seq_no] [uniqueidentifier] NOT NULL,
	[created_by] [int] NOT NULL,
	[create_timestamp] [datetime] NOT NULL,
	[modified_by] [int] NOT NULL,
	[modify_timestamp] [datetime] NOT NULL,
	[create_timestamp_tz] [smallint] NULL,
	[modify_timestamp_tz] [smallint] NULL,
	[row_timestamp] [varchar](50) NOT NULL,
	[Benefits_Status] [varchar](100) NULL,
	[Diagnosis1_Code] [varchar](10) NULL,
	[Diagnosis1_Desciption] [varchar](255) NULL,
	[Diagnosis2_Code] [varchar](10) NULL,
	[Diagnosis2_Desciption] [varchar](255) NULL,
	[Diagnosis3_Code] [varchar](10) NULL,
	[Diagnosis3_Desciption] [varchar](255) NULL,
	[Expiration_Date] [varchar](10) NULL,
	[Expiration_Dose] [int] NULL,
	[Expire_Mode] [int] NULL,
	[Med_Provided] [varchar](4) NULL,
	[Med1_InitialDose] [decimal](16, 2) NULL,
	[Med1_InitialDose_Units] [varchar](25) NULL,
	[Med1_OtherDose] [decimal](16, 2) NULL,
	[Med1_OtherDose_Units] [varchar](25) NULL,
	[Med1_SecondDose] [decimal](16, 2) NULL,
	[Med1_SecondDose_Units] [varchar](25) NULL,
	[Med2_InitialDose] [decimal](16, 2) NULL,
	[Med2_InitialDose_Units] [varchar](25) NULL,
	[Med2_OtherDose] [decimal](16, 2) NULL,
	[Med2_OtherDose_Units] [varchar](25) NULL,
	[Med2_SecondDose] [decimal](16, 2) NULL,
	[Med2_SecondDose_Units] [varchar](25) NULL,
	[Med3_InitialDose] [decimal](16, 2) NULL,
	[Med3_InitialDose_Units] [varchar](25) NULL,
	[Med3_OtherDose] [decimal](16, 2) NULL,
	[Med3_OtherDose_Units] [varchar](25) NULL,
	[Med3_SecondDose] [decimal](16, 2) NULL,
	[Med3_SecondDose_Units] [varchar](25) NULL,
	[Med4_InitialDose] [decimal](16, 2) NULL,
	[Med4_InitialDose_Units] [varchar](25) NULL,
	[Med4_OtherDose] [decimal](16, 2) NULL,
	[Med4_OtherDose_Units] [varchar](25) NULL,
	[Med4_SecondDose] [decimal](16, 2) NULL,
	[Med4_SecondDose_Units] [varchar](25) NULL,
	[Med5_InitialDose] [decimal](16, 2) NULL,
	[Med5_InitialDose_Units] [varchar](25) NULL,
	[Med5_OtherDose] [decimal](16, 2) NULL,
	[Med5_OtherDose_Units] [varchar](25) NULL,
	[Med5_SecondDose] [decimal](16, 2) NULL,
	[Med5_SecondDose_Units] [varchar](25) NULL,
	[Med6_InitialDose] [decimal](16, 2) NULL,
	[Med6_InitialDose_Units] [varchar](25) NULL,
	[Med6_OtherDose] [decimal](16, 2) NULL,
	[Med6_OtherDose_Units] [varchar](25) NULL,
	[Med6_SecondDose] [decimal](16, 2) NULL,
	[Med6_SecondDose_Units] [varchar](25) NULL,
	[Med7_InitialDose] [decimal](16, 2) NULL,
	[Med7_InitialDose_Units] [varchar](25) NULL,
	[Med7_OtherDose] [decimal](16, 2) NULL,
	[Med7_OtherDose_Units] [varchar](25) NULL,
	[Med7_SecondDose] [decimal](16, 2) NULL,
	[Med7_SecondDose_Units] [varchar](25) NULL,
	[Med8_InitialDose] [decimal](16, 2) NULL,
	[Med8_InitialDose_Units] [varchar](25) NULL,
	[Med8_OtherDose] [decimal](16, 2) NULL,
	[Med8_OtherDose_Units] [varchar](25) NULL,
	[Med8_SecondDose] [decimal](16, 2) NULL,
	[Med8_SecondDose_Units] [varchar](25) NULL,
	[Medication1] [varchar](100) NULL,
	[Medication2] [varchar](100) NULL,
	[Medication3] [varchar](100) NULL,
	[Medication4] [varchar](100) NULL,
	[Medication5] [varchar](100) NULL,
	[Medication6] [varchar](100) NULL,
	[Medication7] [varchar](100) NULL,
	[Medication8] [varchar](100) NULL,
	[MP_UpdatedBy] [varchar](100) NULL,
	[MP_UpdatedOn] [varchar](25) NULL,
	[Notes] [varchar](500) NULL,
	[Order_Date] [varchar](10) NULL,
	[Order_Status] [varchar](10) NULL,
	[Order_Type] [varchar](30) NULL,
	[Ordering_Provider_id] [varchar](36) NULL,
	[Ordering_Provider_Name] [varchar](75) NULL,
	[OrderType_Event_id] [varchar](36) NULL,
	[Patient_Wt_kg] [decimal](16, 2) NULL,
	[Patient_Wt_lbs] [int] NULL,
	[PreMed1] [varchar](100) NULL,
	[PreMed1_Dose] [decimal](16, 2) NULL,
	[PreMed1_Units] [varchar](10) NULL,
	[PreMed2] [varchar](100) NULL,
	[PreMed2_Dose] [decimal](16, 2) NULL,
	[PreMed2_Units] [varchar](10) NULL,
	[PreMed3] [varchar](100) NULL,
	[PreMed3_Dose] [decimal](16, 2) NULL,
	[PreMed3_Units] [varchar](10) NULL,
	[Status_UpdatedBy] [varchar](100) NULL,
	[Status_UpdatedOn] [varchar](25) NULL,
	[Patient_Ht_cm] [decimal](16, 2) NULL,
	[Patient_Ht_In] [int] NULL,
	[Auth_Code] [varchar](50) NULL,
	[Auth_Expiration_Date] [varchar](10) NULL,
	[Auth_Required] [varchar](5) NULL,
	[Service_Location] [varchar](40) NULL,
	[Non_Billable] [varchar](3) NULL,
	[CAS] [int] NULL,
	[Document_id] [varchar](36) NULL,
	[Frequency] [varchar](30) NULL,
	[NextDoseDue] [varchar](10) NULL,
	[Original_Orderid] [varchar](36) NULL,
	[PreMed4] [varchar](100) NULL,
	[PreMed4_Dose] [decimal](16, 2) NULL,
	[PreMed4_Units] [varchar](10) NULL,
	[Reason] [varchar](50) NULL,
	[Therapy_Started] [varchar](1) NULL,
	[MedProvided_Type] [varchar](25) NULL,
	[EffectiveDate] [DATETIME] NULL,
    [ExpirationDate] [DATETIME] NULL,    
    [CurrentRowFlag] [BIT] NOT NULL,
    [DeleteRowFlag] [BIT] NOT NULL,
    [InsertDate] [DATETIME] NULL,
    [UpdateDate] [DATETIME] NULL,
    CONSTRAINT [PKods.NG_PIVC_Orders_.RecordID]
        PRIMARY KEY CLUSTERED ([RecordID] ASC)
) ON [PRIMARY]
GO
ALTER TABLE [ods].[NG_PIVC_Orders_]
ADD CONSTRAINT [ods.NG_PIVC_Orders_EffectiveDate]
    DEFAULT (GETDATE()) FOR [EffectiveDate]
GO
ALTER TABLE [ods].[NG_PIVC_Orders_]
ADD CONSTRAINT [ods.NG_PIVC_Orders_DeleteRowFlag]
    DEFAULT ((0)) FOR [DeleteRowFlag]
GO
ALTER TABLE [ods].[NG_PIVC_Orders_]
ADD CONSTRAINT [ods.NG_PIVC_Orders_InsertDate]
    DEFAULT (GETDATE()) FOR [InsertDate]
GO
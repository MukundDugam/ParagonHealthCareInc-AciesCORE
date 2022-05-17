﻿CREATE PROCEDURE [ods].[uspODSCPR_ADJTYPEMaxDateSelect]
(@MaxDate DATETIME OUTPUT)
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    SELECT @MaxDate = ISNULL(MAX(CAST([TOUCHDATE] AS DATETIME)), '2017-01-01')
    FROM [ods].[CPR_ADJTYPE];
END;

﻿CREATE PROCEDURE [ods].[uspODSNG_provider_mstrMaxDateSelect]
(@MaxDate DATETIME OUTPUT)
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    SELECT @MaxDate = ISNULL(MAX(CAST([modify_timestamp] AS DATETIME)), '2017-01-01')
    FROM [ods].[NG_provider_mstr];
END;
﻿CREATE PROCEDURE [ods].[uspODSNG_MLTS_CategoryXP_MaxDateSelect]
(@MaxDate DATETIME OUTPUT)
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    SELECT @MaxDate = ISNULL(MAX(CAST([modify_timestamp] AS DATETIME)), '2017-01-01')
    FROM [ods].[NG_MLTS_CategoryXP_];
END;
CREATE PROCEDURE [stage].[uspStagingTableCheck]
(
    @TableName AS VARCHAR(100),
    @Countinue    CHAR(1) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    DECLARE @SQL NVARCHAR(1000) = '',
			@Count	INT;

    SET @SQL = 'SELECT @Count = COUNT(*) FROM [stage].[' + @TableName + ']';	
    EXEC sys.sp_executesql @SQL, N'@Count INT OUT', @Count OUT	

	IF @Count > 0
		SET @Countinue = 'N'
	ELSE 
		SET @Countinue = 'Y'

END;
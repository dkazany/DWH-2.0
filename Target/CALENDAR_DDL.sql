USE DWH
GO

BEGIN TRY
	DROP TABLE [dbo].[CALENDAR]
END TRY

BEGIN CATCH
	/*No Action*/
END CATCH

/**********************************************************************************/

CREATE TABLE	[dbo].[CALENDAR]
	(	ID DATE primary key, 
		DAY_OF_MONTH INT, -- Field will hold day number of Month
		DAY_NAME_EN NVARCHAR(9), -- Contains name of the day, Sunday, Monday 
		DAY_NAME_RU NVARCHAR(16), -- Contains name of the day, Sunday, Monday 
		DAY_NAME_AZ NVARCHAR(20), -- Contains name of the day, Sunday, Monday 
		DAY_OF_WEEK INT,-- First Day Monday=1 and Sunday=7
		DAY_OF_WEEK_IN_MONTH INT, --1st Monday or 2nd Monday in Month
		DAY_OF_WEEK_IN_YEAR INT,
		DAY_OF_QUARTER INT,
		DAY_OF_YEAR INT,
		WEEK_OF_MONTH INT,-- Week Number of Month 
		WEEK_OF_QUARTER INT, --Week Number of the Quarter
		WEEK_OF_YEAR INT ,--Week Number of the Year
		MONTH_NO INT, --Number of the Month 1 to 12
		MONTH_NAME_EN NVARCHAR(9),--January, February etc
		MONTH_NAME_RU NVARCHAR(16),--January, February etc
		MONTH_NAME_AZ NVARCHAR(16),--January, February etc
		MONTH_OF_QUARTER INT,-- Month Number belongs to Quarter
		QUARTER_NO INT,
		YEAR INT,-- Year value of Date stored in Row
		FIRST_DAY_OF_MONTH DATE,
		LAST_DAY_OF_MONTH DATE,
		FIRST_DAY_OF_QUARTER DATE,
		LAST_DAY_OF_QUARTER DATE,
		FIRST_DAY_OF_YEAR DATE,
		LAST_DAY_OF_YEAR DATE,
		IS_HOLIDAY BIT,-- Flag 1=National Holiday, 0-No National Holiday
		IS_WEEKDAY BIT,-- 0=Week End ,1=Week Day
	)
GO


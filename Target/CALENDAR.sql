@StartDate DATETIME= '01/01/2013'; --Starting value of Date Range
DECLARE @EndDate DATETIME= '31/12/2025'; --End Value of Date Range

SET LANGUAGE British;
TRUNCATE TABLE dbo.CALENDAR;

--Temporary Variables To Hold the Values During Processing of Each Date of Year
DECLARE @DayOfWeekInMonth INT, @DayOfWeekInYear INT, @DayOfQuarter INT, @WeekOfMonth INT, @CurrentYear INT, @CurrentMonth INT, @CurrentQuarter INT;

/*Table Data type to store the day of week count for the month and year*/

DECLARE @DayOfWeek TABLE
(DOW          INT,
 MonthCount   INT,
 QuarterCount INT,
 YearCount    INT
);
INSERT INTO @DayOfWeek
VALUES
(1,
 0,
 0,
 0
);
INSERT INTO @DayOfWeek
VALUES
(2,
 0,
 0,
 0
);
INSERT INTO @DayOfWeek
VALUES
(3,
 0,
 0,
 0
);
INSERT INTO @DayOfWeek
VALUES
(4,
 0,
 0,
 0
);
INSERT INTO @DayOfWeek
VALUES
(5,
 0,
 0,
 0
);
INSERT INTO @DayOfWeek
VALUES
(6,
 0,
 0,
 0
);
INSERT INTO @DayOfWeek
VALUES
(7,
 0,
 0,
 0
);

--Extract and assign various parts of Values from Current Date to Variable

DECLARE @CurrentDate AS DATETIME= @StartDate;
SET @CurrentMonth = DATEPART(MM, @CurrentDate);
SET @CurrentYear = DATEPART(YY, @CurrentDate);
SET @CurrentQuarter = DATEPART(QQ, @CurrentDate);

/********************************************************************************************/

--Proceed only if Start Date(Current date ) is less than End date you specified above

WHILE @CurrentDate < @EndDate
    BEGIN
 
        /*Begin day of week logic*/

/*Check for Change in Month of the Current date if Month changed then 
          Change variable value*/

        IF @CurrentMonth != DATEPART(MM, @CurrentDate)
            BEGIN
                UPDATE @DayOfWeek
                  SET
                      MonthCount = 0;
                SET @CurrentMonth = DATEPART(MM, @CurrentDate);
            END;

        /* Check for Change in Quarter of the Current date if Quarter changed then change 
         Variable value*/

        IF @CurrentQuarter != DATEPART(QQ, @CurrentDate)
            BEGIN
                UPDATE @DayOfWeek
                  SET
                      QuarterCount = 0;
                SET @CurrentQuarter = DATEPART(QQ, @CurrentDate);
            END;
       
        /* Check for Change in Year of the Current date if Year changed then change 
         Variable value*/


        IF @CurrentYear != DATEPART(YY, @CurrentDate)
            BEGIN
                UPDATE @DayOfWeek
                  SET
                      YearCount = 0;
                SET @CurrentYear = DATEPART(YY, @CurrentDate);
            END;
	
        -- Set values in table data type created above from variables 

        UPDATE @DayOfWeek
          SET
              MonthCount = MonthCount + 1,
              QuarterCount = QuarterCount + 1,
              YearCount = YearCount + 1
        WHERE DOW = DATEPART(DW, @CurrentDate);
        SELECT @DayOfWeekInMonth = MonthCount,
               @DayOfQuarter = QuarterCount,
               @DayOfWeekInYear = YearCount
        FROM @DayOfWeek
        WHERE DOW = DATEPART(DW, @CurrentDate);
	
        /*End day of week logic*/

        /* Populate Your Dimension Table with values*/

        INSERT INTO dbo.CALENDAR
               SELECT @CurrentDate AS ID,
                      DATEPART(DD, @CurrentDate) AS DAY_OF_MONTH,
                      DATENAME(DW, @CurrentDate) AS DAY_NAME_EN,
                      NULL AS DAY_NAME_RU,
                      NULL AS DAY_NAME_AZ,
                      DATEPART(DW, @CurrentDate) AS DAY_OF_WEEK,
                      @DayOfWeekInMonth AS DAY_OF_WEEK_IN_MONTH,
                      @DayOfWeekInYear AS DAY_OF_WEEK_IN_YEAR,
                      @DayOfQuarter AS DAY_OF_QUARTER,
                      DATEPART(DY, @CurrentDate) AS DAY_OF_YEAR,
                      DATEPART(WW, @CurrentDate)+1-DATEPART(WW, CONVERT( VARCHAR, DATEPART(MM, @CurrentDate))+'/1/'+CONVERT(VARCHAR, DATEPART(YY, @CurrentDate))) AS WEEK_OF_MONTH,
                      (DATEDIFF(DD, DATEADD(QQ, DATEDIFF(QQ, 0, @CurrentDate), 0), @CurrentDate) / 7) + 1 AS WEEK_OF_QUARTER,
                      DATEPART(WW, @CurrentDate) AS WEEK_OF_YEAR,
                      DATEPART(MM, @CurrentDate) AS MONTH_NO,
                      DATENAME(MM, @CurrentDate) AS MONTH_NAME_EN,
                      NULL AS MONTH_NAME_RU,
                      NULL AS MONTH_NAME_AZ,
                      CASE
                          WHEN DATEPART(MM, @CurrentDate) IN(1, 4, 7, 10)
                          THEN 1
                          WHEN DATEPART(MM, @CurrentDate) IN(2, 5, 8, 11)
                          THEN 2
                          WHEN DATEPART(MM, @CurrentDate) IN(3, 6, 9, 12)
                          THEN 3
                      END AS MONTH_OF_QUARTER,
                      DATEPART(QQ, @CurrentDate) AS QUARTER_NO,
                      DATEPART(YEAR, @CurrentDate) AS [YEAR],
                      CONVERT(  DATETIME, CONVERT(DATE, DATEADD(DD, -(DATEPART(DD, @CurrentDate) - 1), @CurrentDate))) AS FIRST_DAY_OF_MONTH,
                      CONVERT(  DATETIME, CONVERT(DATE, DATEADD(DD, -(DATEPART(DD, (DATEADD(MM, 1, @CurrentDate)))), DATEADD(MM, 1, @CurrentDate)))) AS LAST_DAY_OF_MONTH,
                      DATEADD(QQ, DATEDIFF(QQ, 0, @CurrentDate), 0) AS FIRST_DAY_OF_QUARTER,
                      DATEADD(QQ, DATEDIFF(QQ, -1, @CurrentDate), -1) AS LAST_DAY_OF_QUARTER,
                      CONVERT(  DATETIME, '01/01/'+CONVERT(VARCHAR, DATEPART(YY, @CurrentDate))) AS FIRST_DAY_OF_YEAR,
                      CONVERT(  DATETIME, '31/12/'+CONVERT(VARCHAR, DATEPART(YY, @CurrentDate))) AS LAST_DAY_OF_YEAR,
                      0 AS IS_HOLIDAY,
                      CASE DATEPART(DW, @CurrentDate)
                          WHEN 1
                          THEN 1
                          WHEN 2
                          THEN 1
                          WHEN 3
                          THEN 1
                          WHEN 4
                          THEN 1
                          WHEN 5
                          THEN 1
                          WHEN 6
                          THEN 0
                          WHEN 7
                          THEN 0
                      END AS IS_WEEKDAY;
        SET @CurrentDate = DATEADD(DD, 1, @CurrentDate);
    END;
UPDATE [dbo].CALENDAR
  SET
      IS_HOLIDAY = 1
WHERE ID IN
(
    SELECT HOLIDAY_DATE
    FROM STG.dbo.CB_CAL_HOLIDAYS
);
SET LANGUAGE Russian;
UPDATE [dbo].CALENDAR
  SET
      DAY_NAME_RU = DATENAME(DW, ID),
      MONTH_NAME_RU = DATENAME(MM, ID);
UPDATE [dbo].CALENDAR
  SET
      DAY_NAME_AZ = CASE
                        WHEN DAY_OF_WEEK = 1
                        THEN N'Bazar ertəsi'
                        WHEN DAY_OF_WEEK = 2
                        THEN N'Çərşənbə axşamı'
                        WHEN DAY_OF_WEEK = 3
                        THEN N'Çərşənbə'
                        WHEN DAY_OF_WEEK = 4
                        THEN N'Cümə axşamı'
                        WHEN DAY_OF_WEEK = 5
                        THEN N'Cümə'
                        WHEN DAY_OF_WEEK = 6
                        THEN N'Şənbə'
                        WHEN DAY_OF_WEEK = 7
                        THEN N'Bazar'
                    END;
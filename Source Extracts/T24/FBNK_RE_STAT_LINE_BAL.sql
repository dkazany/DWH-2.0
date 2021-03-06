SELECT 
RECID AS LINE_CCY_DATE,
PARSENAME (REPLACE (RECID,'-','.'),4) AS REPORT_NAME,
PARSENAME (REPLACE (RECID,'-','.'),3) AS LINE_NAME,
PARSENAME (REPLACE (RECID,'-','.'),2) AS CURRENCY,
PARSENAME (REPLACE (RECID,'*','.'),1) AS BRANCH_ID,
CASE WHEN PATINDEX ('%CL*%', RECID) > 0 THEN 1 ELSE 0 END AS ISCL,
CAST (LEFT (PARSENAME (REPLACE (LEFT (RECID, CHARINDEX ('*', RECID)-1), '-','.'),1),8) AS DATE) AS VALUE_DATE,
XMLRECORD.value('(/row/c1/text())[1]', 'decimal (19,2)') AS OPEN_BAL,
XMLRECORD.value('(/row/c2/text())[1]', 'decimal (19,2)') AS OPEN_BAL_LCL,
XMLRECORD.value('(/row/c3/text())[1]', 'decimal (19,2)') AS CR_MVMT,
XMLRECORD.value('(/row/c4/text())[1]', 'decimal (19,2)') AS CR_MVMT_LCL,
XMLRECORD.value('(/row/c5/text())[1]', 'decimal (19,2)') AS DR_MVMT,
XMLRECORD.value('(/row/c6/text())[1]', 'decimal (19,2)') AS DR_MVMT_LCL,
XMLRECORD.value('(/row/c5/text())[1]', 'decimal (19,2)') AS CLOSING_BAL,
XMLRECORD.value('(/row/c6/text())[1]', 'decimal (19,2)') AS CLOSING_BAL_LCL,
XMLRECORD.value('(/row/c12/text())[1]', 'decimal (19,2)') AS CR_MVMT_YTD,
XMLRECORD.value('(/row/c13/text())[1]', 'decimal (19,2)') AS CR_MVMT_MTH,
XMLRECORD.value('(/row/c14/text())[1]', 'decimal (19,2)') AS CR_MVMT_YTD_LCL,
XMLRECORD.value('(/row/c15/text())[1]', 'decimal (19,2)') AS CR_MVMT_MTH_LCL,
XMLRECORD.value('(/row/c16/text())[1]', 'decimal (19,2)') AS DR_MVMT_YTD,
XMLRECORD.value('(/row/c17/text())[1]', 'decimal (19,2)') AS DR_MVMT_MTH,
XMLRECORD.value('(/row/c18/text())[1]', 'decimal (19,2)') AS DR_MVMT_YTD_LCL,
XMLRECORD.value('(/row/c19/text())[1]', 'decimal (19,2)') AS DR_MVMT_MTH_LCL
FROM FBNK_RE_STAT_LINE_BAL
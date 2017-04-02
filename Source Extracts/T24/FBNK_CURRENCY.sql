SELECT
XMLRECORD.value('(/row/@id)[1]', 'nvarchar(3)') AS CURRENCY_CODE,
XMLRECORD.value('(/row/c1)[1]', 'nvarchar(3)') AS CURRENCY_RANK,
XMLRECORD.value('(/row/c2)[1]', 'int') AS NUM_CURR_CODE,
XMLRECORD.value('(/row/c30[@m="3"])[1]', 'nvarchar(35)') AS LMB_DESC_AZERI,
CAST (COALESCE (NULLIF(XMLRECORD.value('(/row/c14)[1]', 'nvarchar(16)'),''), '1') AS DECIMAL (10,4)) AS MID_REVAL_RATE,
XMLRECORD.value('(/row/c57)[1]', 'nvarchar(10)') AS RECORD_STATUS,
XMLRECORD.value('(/row/c58)[1]', 'int') AS CURR_NO,
CAST(SUBSTRING(XMLRECORD.value('(/row/c60/text())[1]', 'nvarchar(35)'), 1, 6) AS DATE) AS LAST_UPD_DATE
FROM FBNK_CURRENCY
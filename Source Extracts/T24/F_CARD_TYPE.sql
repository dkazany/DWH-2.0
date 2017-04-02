SELECT 
XMLRECORD.value('(/row/@id)[1]', 'nvarchar(6)') AS CARD_TYPE,
XMLRECORD.value('(/row/c1)[1]', 'nvarchar(65)') AS DESCRIPTION,
XMLRECORD.value('(/row/c10)[1]', 'nvarchar(10)') AS LMB_DR_CR_CARD,
XMLRECORD.value('(/row/c10[@m="2"])[1]', 'nvarchar(10)') AS CARD_TYPE_CODE,
XMLRECORD.value('(/row/c10[@m="3"])[1]', 'nvarchar(10)') AS LMB_CARD_DAILY_LIMIT,
XMLRECORD.value('(/row/c11)[1]', 'nvarchar(10)') AS RECORD_STATUS,
XMLRECORD.value('(/row/c12)[1]', 'int') AS CURR_NO,
CAST(SUBSTRING(XMLRECORD.value('(/row/c14/text())[1]', 'nvarchar(35)'), 1, 6) AS DATE) AS LAST_UPD_DATE
FROM
F_CARD_TYPE
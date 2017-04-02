SELECT
XMLRECORD.value('(/row/@id)[1]', 'nvarchar(35)') AS LMB_GEN_PROD_ID,
XMLRECORD.value('(/row/c1)[1]', 'nvarchar(65)') AS DESCRIPTION,
XMLRECORD.value('(/row/c2)[1]', 'nvarchar(8)') AS TYPE,
XMLRECORD.value('(/row/c16)[1]', 'nvarchar(10)') AS RECORD_STATUS,
XMLRECORD.value('(/row/c17)[1]', 'int') AS CURR_NO,
CAST(SUBSTRING(XMLRECORD.value('(/row/c19/text())[1]', 'nvarchar(35)'), 1, 6) AS DATE) AS LAST_UPD_DATE
FROM
F_LMB_GENERIC_PRODUCT
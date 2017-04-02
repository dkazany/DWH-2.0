SELECT
XMLRECORD.value('(/row/@id)[1]', 'nvarchar(35)') AS LMB_GEN_SUB_ID,
XMLRECORD.value('(/row/c1)[1]', 'nvarchar(65)') AS DESCRIPTION,
XMLRECORD.value('(/row/c2)[1]', 'nvarchar(35)') AS PRODUCT,
XMLRECORD.value('(/row/c7)[1]', 'nvarchar(35)') AS CATEGORY,
XMLRECORD.value('(/row/c8)[1]', 'nvarchar(35)') AS LIMIT_REFERENCE,
XMLRECORD.value('(/row/c89)[1]', 'nvarchar(35)') AS PRODUCT_CODE,
XMLRECORD.value('(/row/c152)[1]', 'nvarchar(10)') AS RECORD_STATUS,
XMLRECORD.value('(/row/c153)[1]', 'int') AS CURR_NO,
CAST(SUBSTRING(XMLRECORD.value('(/row/c155/text())[1]', 'nvarchar(35)'), 1, 6) AS DATE) AS LAST_UPD_DATE
FROM
F_LMB_GEN006
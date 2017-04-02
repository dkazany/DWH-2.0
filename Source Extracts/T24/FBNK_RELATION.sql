SELECT 
XMLRECORD.value('(/row/@id)[1]', 'nvarchar(3)') AS RELATION_CODE,
XMLRECORD.value('(/row/c1)[1]', 'nvarchar(65)') AS DESCRIPTION,
XMLRECORD.value('(/row/c2)[1]', 'nvarchar(35)') AS REVERSE_RELATION,
XMLRECORD.value('(/row/c3)[1]', 'nvarchar(65)') AS REVERSE_REL_DESC,
XMLRECORD.value('(/row/c4)[1]', 'nvarchar(10)') AS RECORD_STATUS,
XMLRECORD.value('(/row/c5)[1]', 'int') AS CURR_NO,
CAST(SUBSTRING(XMLRECORD.value('(/row/c7/text())[1]', 'nvarchar(35)'), 1, 6) AS DATE) AS LAST_UPD_DATE
FROM
FBNK_RELATION
SELECT
XMLRECORD.value('(/row/@id)[1]', 'nvarchar(10)') AS ZONE_ID,
XMLRECORD.value('(/row/c1)[1]', 'nvarchar(65)') AS DESCR,
XMLRECORD.value('(/row/c2)[1]', 'nvarchar(65)') AS LVL,
XMLRECORD.value('(/row/c3)[1]', 'nvarchar(10)') AS PARENT,
XMLRECORD.value('(/row/c8)[1]', 'nvarchar(10)') AS RECORD_STATUS,
XMLRECORD.value('(/row/c9)[1]', 'int') AS CURR_NO,
CAST(SUBSTRING(XMLRECORD.value('(/row/c11/text())[1]', 'nvarchar(35)'), 1, 6) AS DATE) AS LAST_UPD_DATE
FROM
F_LMB_ZONES
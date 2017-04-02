SELECT
XMLRECORD.value('(/row/@id)[1]', 'nvarchar(6)') AS CATEGORY_CODE,
XMLRECORD.value('(/row/c1)[1]', 'nvarchar(65)') AS DESCRIPTION,
XMLRECORD.value('(/row/c2)[1]', 'nvarchar(35)') AS SHORT_NAME,
XMLRECORD.value('(/row/c3)[1]', 'nvarchar(35)') AS SYSTEM_IND,
XMLRECORD.value('(/row/c19)[1]', 'nvarchar(10)') AS RECORD_STATUS,
XMLRECORD.value('(/row/c20)[1]', 'int') AS CURR_NO,
CAST(SUBSTRING(XMLRECORD.value('(/row/c22/text())[1]', 'nvarchar(35)'), 1, 6) AS DATE) AS LAST_UPD_DATE
FROM
F_CATEGORY
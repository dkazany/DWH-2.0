SELECT XMLRECORD.value('(/row/@id)[1]', 'nvarchar(35)') AS INDUSTRY_CODE,
XMLRECORD.value('(/row/c1/text())[1]', 'nvarchar(35)') AS DESCRIPTION,
XMLRECORD.value('(/row/c9/text())[1]', 'int') AS CURR_NO,
CAST(SUBSTRING(XMLRECORD.value('(/row/c11/text())[1]', 'varchar(35)'), 1, 6) AS DATE) AS LAST_UPD_DATE
FROM
FBNK_INDUSTRY
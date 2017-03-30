SELECT XMLRECORD.value('(/row/@id)[1]', 'int') AS CUSTOMER_STATUS,
XMLRECORD.value('(/row/c1)[1]', 'nvarchar(35)') AS DESCRIPTION,
XMLRECORD.value('(/row/c2)[1]', 'nvarchar(35)') AS SHORT_NAME,
XMLRECORD.value('(/row/c4/text())[1]', 'int') AS CURR_NO,
CAST(SUBSTRING(XMLRECORD.value('(/row/c6/text())[1]', 'varchar(35)'), 1, 6) AS DATE) AS LAST_UPD_DATE
FROM FBNK_CUSTOMER_STATUS
SELECT XMLRECORD.value('(/row/@id)[1]', 'int') AS SECTOR_TYPE,
XMLRECORD.value('(/row/c1/text())[1]', 'varchar(35)') AS DESCRIPTION,
XMLRECORD.value('(/row/c10/text())[1]', 'int') AS CURR_NO,
CAST(SUBSTRING(XMLRECORD.value('(/row/c12/text())[1]', 'varchar(35)'), 1, 6) AS DATE) AS LAST_UPD_DATE
FROM
FBNK_SECTOR
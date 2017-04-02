SELECT
XMLRECORD.value('(/row/@id)[1]', 'nvarchar(10)') AS HOLIDAY_CODE,
SUBSTRING(XMLRECORD.value('(/row/@id)[1]', 'nvarchar(10)'), LEN(XMLRECORD.value('(/row/@id)[1]', 'nvarchar(10)')) - 3, 4) AS HYEAR,
XMLRECORD.value('(/row/c1)[1]', 'nvarchar(35)') AS JANUARY,
XMLRECORD.value('(/row/c2)[1]', 'nvarchar(35)') AS FEBRUARY,
XMLRECORD.value('(/row/c3)[1]', 'nvarchar(35)') AS MARCH,
XMLRECORD.value('(/row/c4)[1]', 'nvarchar(35)') AS APRIL,
XMLRECORD.value('(/row/c5)[1]', 'nvarchar(35)') AS MAY,
XMLRECORD.value('(/row/c6)[1]', 'nvarchar(35)') AS JUNE,
XMLRECORD.value('(/row/c7)[1]', 'nvarchar(35)') AS JULY,
XMLRECORD.value('(/row/c8)[1]', 'nvarchar(35)') AS AUGUST,
XMLRECORD.value('(/row/c9)[1]', 'nvarchar(35)') AS SEPTEMBER,
XMLRECORD.value('(/row/c10)[1]', 'nvarchar(35)') AS OCTOBER,
XMLRECORD.value('(/row/c11)[1]', 'nvarchar(35)') AS NOVEMBER,
XMLRECORD.value('(/row/c12)[1]', 'nvarchar(35)') AS DECEMBER,
XMLRECORD.value('(/row/c38)[1]', 'nvarchar(10)') AS RECORD_STATUS,
XMLRECORD.value('(/row/c39)[1]', 'int') AS CURR_NO,
CAST(SUBSTRING(XMLRECORD.value('(/row/c41/text())[1]', 'nvarchar(35)'), 1, 6) AS DATE) AS LAST_UPD_DATE
FROM F_HOLIDAY
WHERE RECID LIKE 'AZ%'
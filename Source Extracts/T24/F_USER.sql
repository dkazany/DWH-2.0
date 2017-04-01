SELECT
XMLRECORD.value('(/row/@id)[1]', 'nvarchar(16)') AS USERID,
XMLRECORD.value('(/row/c1)[1]', 'nvarchar(35)') AS USERNAME,
XMLRECORD.value('(/row/c2)[1]', 'nvarchar(35)') AS LOGON_NAME
FROM F_USER
SELECT XMLRECORD.value('(/row/@id)[1]', 'nvarchar(15)') AS REP_NAME_LINE_NO,
       XMLRECORD.value('(/row/c1/text())[1]', 'nvarchar(15)') AS TYPE,
	   XMLRECORD.value('(/row/c2/text())[1]', 'nvarchar(35)') AS LINE_DESC,
	   XMLRECORD.value('(/row/c2/text())[2]', 'nvarchar(35)') AS LINE_DESC_2,
	   XMLRECORD.value('(/row/c89)[1]', 'nvarchar(10)') AS RECORD_STATUS,
       XMLRECORD.value('(/row/c90)[1]', 'int') AS CURR_NO,
	   CAST(SUBSTRING(XMLRECORD.value('(/row/c92/text())[1]', 'nvarchar(35)'), 1, 6) AS DATE) AS LAST_UPD_DATE
	   FROM F_RE_STAT_REP_LINE
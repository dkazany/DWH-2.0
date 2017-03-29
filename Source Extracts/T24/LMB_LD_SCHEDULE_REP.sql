SELECT XMLRECORD.value('(/row/@id)[1]', 'varchar(35)') AS LD_SCHEDULE_ID,
       REP_RES_DATE.x.value('(./text())[1]', 'date') AS REP_RES_DATE,
(
    SELECT REP_OUTST_PR.x.value('(./text())[1]', 'decimal (24,2)')
    FROM F_LMB_LD_SCHEDULE x
         CROSS APPLY [XMLRECORD].nodes('//row/c10') AS REP_OUTST_PR(x)
    WHERE COALESCE(REP_RES_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(REP_OUTST_PR.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS REP_OUTST_PR,
(
    SELECT REP_OVERDUE_DAYS.x.value('(./text())[1]', 'int')
    FROM F_LMB_LD_SCHEDULE x
         CROSS APPLY [XMLRECORD].nodes('//row/c11') AS REP_OVERDUE_DAYS(x)
    WHERE COALESCE(REP_RES_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(REP_OVERDUE_DAYS.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS REP_OVERDUE_DAYS,
(
    SELECT REP_RES_SUBS.x.value('(./text())[1]', 'int')
    FROM F_LMB_LD_SCHEDULE x
         CROSS APPLY [XMLRECORD].nodes('//row/c34') AS REP_RES_SUBS(x)
    WHERE COALESCE(REP_RES_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(REP_RES_SUBS.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS REP_RES_SUBS
FROM F_LMB_LD_SCHEDULE a
     CROSS APPLY [XMLRECORD].nodes('//row/c9') AS REP_RES_DATE(x);
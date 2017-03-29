SELECT XMLRECORD.value('(/row/@id)[1]', 'varchar(35)') AS LD_SCHEDULE_ID,
       SCH_DATE.x.value('(./text())[1]', 'date') AS RES_DATE,
(
    SELECT CAST(REPLACE(PRINCIPAL.x.value('(./text())[1]', 'varchar(35)'), ',', '') AS DECIMAL(24, 2))
    FROM F_LMB_LD_SCHEDULE x
         CROSS APPLY [XMLRECORD].nodes('//row/c6') AS PRINCIPAL(x)
    WHERE COALESCE(SCH_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(PRINCIPAL.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS RES_PRINCIPAL,
(
    SELECT CAST(REPLACE(INTEREST.x.value('(./text())[1]', 'varchar(35)'), ',', '') AS DECIMAL(24, 2))
    FROM F_LMB_LD_SCHEDULE x
         CROSS APPLY [XMLRECORD].nodes('//row/c7') AS INTEREST(x)
    WHERE COALESCE(SCH_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(INTEREST.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS RES_INTEREST,
(
    SELECT CAST(REPLACE(CHARGES.x.value('(./text())[1]', 'varchar(35)'), ',', '') AS DECIMAL(24, 2))
    FROM F_LMB_LD_SCHEDULE x
         CROSS APPLY [XMLRECORD].nodes('//row/c8') AS CHARGES(x)
    WHERE COALESCE(SCH_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(CHARGES.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS RES_CHARGES
FROM F_LMB_LD_SCHEDULE a
     CROSS APPLY [XMLRECORD].nodes('//row/c5') AS SCH_DATE(x);
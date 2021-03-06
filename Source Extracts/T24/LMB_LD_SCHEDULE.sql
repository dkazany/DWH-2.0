SELECT XMLRECORD.value('(/row/@id)[1]', 'nvarchar(35)') AS LD_SCHEDULE_ID,
       SCH_DATE.x.value('(./text())[1]', 'date') AS SCH_DATE,
(
    SELECT CAST(REPLACE(PRINCIPAL.x.value('(./text())[1]', 'nvarchar(35)'), ',', '') AS DECIMAL(24, 2))
    FROM F_LMB_LD_SCHEDULE x
         CROSS APPLY [XMLRECORD].nodes('//row/c2') AS PRINCIPAL(x)
    WHERE COALESCE(SCH_DATE.x.value('./@m', 'nvarchar(5)'), '1') = COALESCE(PRINCIPAL.x.value('./@m', 'nvarchar(5)'), '1')
AND x.RECID = a.RECID
) AS PRINCIPAL,
(
    SELECT CAST(REPLACE(INTEREST.x.value('(./text())[1]', 'nvarchar(35)'), ',', '') AS DECIMAL(24, 2))
    FROM F_LMB_LD_SCHEDULE x
         CROSS APPLY [XMLRECORD].nodes('//row/c3') AS INTEREST(x)
    WHERE COALESCE(SCH_DATE.x.value('./@m', 'nvarchar(5)'), '1') = COALESCE(INTEREST.x.value('./@m', 'nvarchar(5)'), '1')
AND x.RECID = a.RECID
) AS INTEREST,
(
    SELECT CAST(REPLACE(CHARGES.x.value('(./text())[1]', 'nvarchar(35)'), ',', '') AS DECIMAL(24, 2))
    FROM F_LMB_LD_SCHEDULE x
         CROSS APPLY [XMLRECORD].nodes('//row/c4') AS CHARGES(x)
    WHERE COALESCE(SCH_DATE.x.value('./@m', 'nvarchar(5)'), '1') = COALESCE(CHARGES.x.value('./@m', 'nvarchar(5)'), '1')
AND x.RECID = a.RECID
) AS CHARGES
FROM F_LMB_LD_SCHEDULE a
     CROSS APPLY [XMLRECORD].nodes('//row/c1') AS SCH_DATE(x);
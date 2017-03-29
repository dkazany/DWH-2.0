SELECT XMLRECORD.value('(/row/@id)[1]', 'varchar(35)') AS LD_ID,
       PAYM_DATE.x.value('(.)', 'varchar(35)') AS PAYM_DATE,
(
    SELECT PAYM_TYPE.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_REPAYHIST x
         CROSS APPLY [XMLRECORD].nodes('//row/c1') AS PAYM_TYPE(x)
    WHERE COALESCE(PAYM_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(PAYM_TYPE.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS PAYM_TYPE,
(
    SELECT PRINCIPAL.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_REPAYHIST x
         CROSS APPLY [XMLRECORD].nodes('//row/c3') AS PRINCIPAL(x)
    WHERE COALESCE(PAYM_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(PRINCIPAL.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS PRINCIPAL,
(
    SELECT INTEREST.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_REPAYHIST x
         CROSS APPLY [XMLRECORD].nodes('//row/c4') AS INTEREST(x)
    WHERE COALESCE(PAYM_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(INTEREST.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS INTEREST,
(
    SELECT PENALTY.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_REPAYHIST x
         CROSS APPLY [XMLRECORD].nodes('//row/c5') AS PENALTY(x)
    WHERE COALESCE(PAYM_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(PENALTY.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS PENALTY,
(
    SELECT CHARGES.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_REPAYHIST x
         CROSS APPLY [XMLRECORD].nodes('//row/c6') AS CHARGES(x)
    WHERE COALESCE(PAYM_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(CHARGES.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS CHARGES,
(
    SELECT OVR_AMT.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_REPAYHIST x
         CROSS APPLY [XMLRECORD].nodes('//row/c7') AS OVR_AMT(x)
    WHERE COALESCE(PAYM_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(OVR_AMT.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS OVR_AMT,
(
    SELECT TR_DATE.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_REPAYHIST x
         CROSS APPLY [XMLRECORD].nodes('//row/c8') AS TR_DATE(x)
    WHERE COALESCE(PAYM_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(TR_DATE.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS TR_DATE,
(
    SELECT OUTS_PR.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_REPAYHIST x
         CROSS APPLY [XMLRECORD].nodes('//row/c9') AS OUTS_PR(x)
    WHERE COALESCE(PAYM_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(OUTS_PR.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS OUTS_PR
FROM F_LMB_LD_REPAYHIST a
     CROSS APPLY [XMLRECORD].nodes('//row/c2') AS PAYM_DATE(x);
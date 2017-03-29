SELECT XMLRECORD.value('(/row/@id)[1]', 'varchar(35)') AS LD_ID,
       V_DATE.x.value('(./text())[1]', 'varchar(35)') AS V_DATE,
--(
--SELECT LINE_NO.x.value('(./text())[1]', 'int')
--FROM F_LMB_LD_PAYM_PLAN x
--CROSS APPLY [XMLRECORD].nodes('//row/c1') AS LINE_NO(x)
--WHERE COALESCE(LINE_NO.x.value('./@m', 'varchar(5)'), '1') = COALESCE(LINE_NO.x.value('./@m', 'varchar(5)'), '1')
--AND x.RECID = a.RECID
--) AS LINE_NO,
(
    SELECT E_DATE.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_PAYM_PLAN x
         CROSS APPLY [XMLRECORD].nodes('//row/c3') AS E_DATE(x)
    WHERE COALESCE(V_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(E_DATE.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS E_DATE,
(
    SELECT OVD.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_PAYM_PLAN x
         CROSS APPLY [XMLRECORD].nodes('//row/c4') AS OVD(x)
    WHERE COALESCE(V_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(OVD.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS OVD,
(
    SELECT PRIN_PLAN.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_PAYM_PLAN x
         CROSS APPLY [XMLRECORD].nodes('//row/c5') AS PRIN_PLAN(x)
    WHERE COALESCE(V_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(PRIN_PLAN.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS PRIN_PLAN,
(
    SELECT PRIN_PAID.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_PAYM_PLAN x
         CROSS APPLY [XMLRECORD].nodes('//row/c6') AS PRIN_PAID(x)
    WHERE COALESCE(V_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(PRIN_PAID.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS PRIN_PAID,
(
    SELECT INT_PLAN.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_PAYM_PLAN x
         CROSS APPLY [XMLRECORD].nodes('//row/c7') AS INT_PLAN(x)
    WHERE COALESCE(V_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(INT_PLAN.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS INT_PLAN,
(
    SELECT INT_PAID.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_PAYM_PLAN x
         CROSS APPLY [XMLRECORD].nodes('//row/c8') AS INT_PAID(x)
    WHERE COALESCE(V_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(INT_PAID.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS INT_PAID,
(
    SELECT PEN_PLAN.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_PAYM_PLAN x
         CROSS APPLY [XMLRECORD].nodes('//row/c9') AS PEN_PLAN(x)
    WHERE COALESCE(V_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(PEN_PLAN.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS PEN_PLAN,
(
    SELECT PEN_PAID.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_PAYM_PLAN x
         CROSS APPLY [XMLRECORD].nodes('//row/c10') AS PEN_PAID(x)
    WHERE COALESCE(V_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(PEN_PAID.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS PEN_PAID,
(
    SELECT EXP_PLAN.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_PAYM_PLAN x
         CROSS APPLY [XMLRECORD].nodes('//row/c11') AS EXP_PLAN(x)
    WHERE COALESCE(V_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(EXP_PLAN.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS EXP_PLAN,
(
    SELECT EXP_PAID.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_PAYM_PLAN x
         CROSS APPLY [XMLRECORD].nodes('//row/c12') AS EXP_PAID(x)
    WHERE COALESCE(V_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(EXP_PAID.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS EXP_PAID,
(
    SELECT PER_PLAN.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_PAYM_PLAN x
         CROSS APPLY [XMLRECORD].nodes('//row/c13') AS PER_PLAN(x)
    WHERE COALESCE(V_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(PER_PLAN.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS PER_PLAN,
(
    SELECT PER_PAID.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_PAYM_PLAN x
         CROSS APPLY [XMLRECORD].nodes('//row/c14') AS PER_PAID(x)
    WHERE COALESCE(V_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(PER_PAID.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS PER_PAID,
(
    SELECT FER_PLAN.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_PAYM_PLAN x
         CROSS APPLY [XMLRECORD].nodes('//row/c15') AS FER_PLAN(x)
    WHERE COALESCE(V_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(FER_PLAN.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS FER_PLAN,
(
    SELECT FER_PAID.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_PAYM_PLAN x
         CROSS APPLY [XMLRECORD].nodes('//row/c16') AS FER_PAID(x)
    WHERE COALESCE(V_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(FER_PAID.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS FER_PAID,
(
    SELECT TRIN_PLAN.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_PAYM_PLAN x
         CROSS APPLY [XMLRECORD].nodes('//row/c17') AS TRIN_PLAN(x)
    WHERE COALESCE(V_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(TRIN_PLAN.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS TRIN_PLAN,
(
    SELECT TRIN_PAID.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_PAYM_PLAN x
         CROSS APPLY [XMLRECORD].nodes('//row/c18') AS TRIN_PAID(x)
    WHERE COALESCE(V_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(TRIN_PAID.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS TRIN_PAID,
(
    SELECT OV_AMT_PAID.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_PAYM_PLAN x
         CROSS APPLY [XMLRECORD].nodes('//row/c19') AS OV_AMT_PAID(x)
    WHERE COALESCE(V_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(OV_AMT_PAID.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS OV_AMT_PAID,
(
    SELECT AMT_TOBE_PAID.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_PAYM_PLAN x
         CROSS APPLY [XMLRECORD].nodes('//row/c20') AS AMT_TOBE_PAID(x)
    WHERE COALESCE(V_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(AMT_TOBE_PAID.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS AMT_TOBE_PAID,
(
    SELECT PR_OUTS.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_PAYM_PLAN x
         CROSS APPLY [XMLRECORD].nodes('//row/c21') AS PR_OUTS(x)
    WHERE COALESCE(V_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(PR_OUTS.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS PR_OUTS,
(
    SELECT MAT_INT_PAID.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_PAYM_PLAN x
         CROSS APPLY [XMLRECORD].nodes('//row/c24') AS MAT_INT_PAID(x)
    WHERE COALESCE(V_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(MAT_INT_PAID.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS MAT_INT_PAID,
(
    SELECT MAT_PEN_PAID.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_PAYM_PLAN x
         CROSS APPLY [XMLRECORD].nodes('//row/c25') AS MAT_PEN_PAID(x)
    WHERE COALESCE(V_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(MAT_PEN_PAID.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS MAT_PEN_PAID,
(
    SELECT MAT_TOT_OUTS.x.value('(./text())[1]', 'varchar(35)')
    FROM F_LMB_LD_PAYM_PLAN x
         CROSS APPLY [XMLRECORD].nodes('//row/c28') AS MAT_TOT_OUTS(x)
    WHERE COALESCE(V_DATE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(MAT_TOT_OUTS.x.value('./@m', 'varchar(5)'), '1')
AND x.RECID = a.RECID
) AS MAT_TOT_OUTS
FROM F_LMB_LD_PAYM_PLAN a
     CROSS APPLY [XMLRECORD].nodes('//row/c2') AS V_DATE(x);
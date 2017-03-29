SELECT XMLRECORD.value('(/row/@id)[1]', 'varchar(35)') AS CONTRACT_NUMBER,
       TOT_OVRDUE_TYPE.x.value('(./text())[1]', 'varchar(35)') AS TOT_OVRDUE_TYPE,
       TOT_OD_TYPE_AMT.x.value('(./text())[1]', 'decimal(24,2)') AS TOT_OD_TYPE_AMT,
       XMLRECORD.value('(/row/c107/text())[1]', 'int') AS RECNO,
       CAST(SUBSTRING(XMLRECORD.value('(/row/c109/text())[1]', 'varchar(35)'), 1, 6) AS DATE) AS LAST_UPD_DATE
FROM FBNK_PD_PAYMENT_DUE a
     CROSS APPLY [XMLRECORD].nodes('//row/c21') AS TOT_OVRDUE_TYPE(x) CROSS APPLY [XMLRECORD].nodes('//row/c22') AS TOT_OD_TYPE_AMT(x)
WHERE COALESCE(TOT_OVRDUE_TYPE.x.value('./@m', 'varchar(5)'), '1') = COALESCE(TOT_OD_TYPE_AMT.x.value('./@m', 'varchar(5)'), '1');
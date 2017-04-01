SELECT XMLRECORD.value('(/row/@id)[1]', 'nvarchar(35)') AS CUSTOMER_CODE,
       LEGAL_ID.x.value('(./text())[1]', 'nvarchar(35)') AS LEGAL_ID,
	   ISNULL(LEGAL_ID.x.value('./@m','int'),1) AS ID_ROW_NUM,
(
    SELECT LEGAL_DOC_NAME.x.value('(./text())[1]', 'nvarchar(35)')
    FROM FBNK_CUSTOMER x
         CROSS APPLY [XMLRECORD].nodes('/row/c35') AS LEGAL_DOC_NAME(x)
    WHERE COALESCE(LEGAL_ID.x.value('./@m', 'nvarchar(5)'), '1') = COALESCE(LEGAL_DOC_NAME.x.value('./@m', 'nvarchar(5)'), '1')
AND x.RECID = a.RECID
) AS LEGAL_DOC_NAME,
(
    SELECT LEGAL_HOLDER_NAME.x.value('(./text())[1]', 'nvarchar(65)')
    FROM FBNK_CUSTOMER x
         CROSS APPLY [XMLRECORD].nodes('/row/c36') AS LEGAL_HOLDER_NAME(x)
    WHERE COALESCE(LEGAL_ID.x.value('./@m', 'nvarchar(5)'), '1') = COALESCE(LEGAL_HOLDER_NAME.x.value('./@m', 'nvarchar(5)'), '1')
AND x.RECID = a.RECID
) AS LEGAL_HOLDER_NAME,
(
    SELECT LEGAL_ISS_AUTH.x.value('(./text())[1]', 'nvarchar(35)')
    FROM FBNK_CUSTOMER x
         CROSS APPLY [XMLRECORD].nodes('/row/c37') AS LEGAL_ISS_AUTH(x)
    WHERE COALESCE(LEGAL_ID.x.value('./@m', 'nvarchar(5)'), '1') = COALESCE(LEGAL_ISS_AUTH.x.value('./@m', 'nvarchar(5)'), '1')
AND x.RECID = a.RECID
) AS LEGAL_ISS_AUTH,
(
    SELECT LEGAL_ISS_DATE.x.value('(./text())[1]', 'date')
    FROM FBNK_CUSTOMER x
         CROSS APPLY [XMLRECORD].nodes('/row/c38') AS LEGAL_ISS_DATE(x)
    WHERE COALESCE(LEGAL_ID.x.value('./@m', 'nvarchar(5)'), '1') = COALESCE(LEGAL_ISS_DATE.x.value('./@m', 'nvarchar(5)'), '1')
AND x.RECID = a.RECID
) AS LEGAL_ISS_DATE,
(
    SELECT LEGAL_EXP_DATE.x.value('(./text())[1]', 'date')
    FROM FBNK_CUSTOMER x
         CROSS APPLY [XMLRECORD].nodes('/row/c39') AS LEGAL_EXP_DATE(x)
    WHERE COALESCE(LEGAL_ID.x.value('./@m', 'nvarchar(5)'), '1') = COALESCE(LEGAL_EXP_DATE.x.value('./@m', 'nvarchar(5)'), '1')
AND x.RECID = a.RECID
) AS LEGAL_EXP_DATE,
XMLRECORD.value('(/row/c181/text())[1]', 'int') AS CURR_NO,
CAST(SUBSTRING(XMLRECORD.value('(/row/c183/text())[1]', 'nvarchar(35)'), 1, 6) AS DATE) AS LAST_UPD_DATE
FROM FBNK_CUSTOMER a
     CROSS APPLY [XMLRECORD].nodes('//row/c34') AS LEGAL_ID(x)
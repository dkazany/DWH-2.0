SELECT 
XMLRECORD.value('(/row/@id)[1]', 'nvarchar(10)') AS CUSTOMER_CODE,
ISNULL(RELATION.x.value('(./@s)[1]', 'int'),1) AS RELATION_ROW_NUM,
RELATION.x.value('(./text())[1]', 'nvarchar(6)') AS RELATION_CODE,
(
    SELECT REL_CUSTOMER_CODE.x.value('(./text())[1]', 'nvarchar(10)')
    FROM FBNK_CUSTOMER x
         CROSS APPLY [XMLRECORD].nodes('/row/c178[@m="274"]') AS REL_CUSTOMER_CODE(x)
    WHERE COALESCE(RELATION.x.value('./@s', 'nvarchar(5)'), '1') = COALESCE(REL_CUSTOMER_CODE.x.value('./@s', 'nvarchar(5)'), '1')
AND x.RECID = a.RECID
) AS REL_CUSTOMER_CODE,
(
    SELECT REL_REV_CODE.x.value('(./text())[1]', 'nvarchar(6)')
    FROM FBNK_CUSTOMER x
         CROSS APPLY [XMLRECORD].nodes('/row/c178[@m="275"]') AS REL_REV_CODE(x)
    WHERE COALESCE(RELATION.x.value('./@s', 'nvarchar(5)'), '1') = COALESCE(REL_REV_CODE.x.value('./@s', 'nvarchar(5)'), '1')
AND x.RECID = a.RECID
) AS REL_REV_CODE,
(
    SELECT REL_SIGN_ID.x.value('(./text())[1]', 'nvarchar(35)')
    FROM FBNK_CUSTOMER x
         CROSS APPLY [XMLRECORD].nodes('/row/c178[@m="276"]') AS REL_SIGN_ID(x)
    WHERE COALESCE(RELATION.x.value('./@s', 'nvarchar(5)'), '1') = COALESCE(REL_SIGN_ID.x.value('./@s', 'nvarchar(5)'), '1')
AND x.RECID = a.RECID
) AS REL_SIGN_ID,
(
    SELECT REL_NOTES.x.value('(./text())[1]', 'nvarchar(65)')
    FROM FBNK_CUSTOMER x
         CROSS APPLY [XMLRECORD].nodes('/row/c178[@m="277"]') AS REL_NOTES(x)
    WHERE COALESCE(RELATION.x.value('./@s', 'nvarchar(5)'), '1') = COALESCE(REL_NOTES.x.value('./@s', 'nvarchar(5)'), '1')
AND x.RECID = a.RECID
) AS REL_NOTES,
(
    SELECT SIGNATORY.x.value('(./text())[1]', 'nvarchar(35)')
    FROM FBNK_CUSTOMER x
         CROSS APPLY [XMLRECORD].nodes('/row/c178[@m="279"]') AS SIGNATORY(x)
    WHERE COALESCE(RELATION.x.value('./@s', 'nvarchar(5)'), '1') = COALESCE(SIGNATORY.x.value('./@s', 'nvarchar(5)'), '1')
AND x.RECID = a.RECID
) AS SIGNATORY,
XMLRECORD.value('(/row/c181/text())[1]', 'int') AS CURR_NO,
CAST(SUBSTRING(XMLRECORD.value('(/row/c183/text())[1]', 'nvarchar(35)'), 1, 6) AS DATE) AS LAST_UPD_DATE
FROM FBNK_CUSTOMER a
CROSS APPLY [XMLRECORD].nodes('/row/c178[@m="273"]') AS RELATION(x)
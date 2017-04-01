SELECT 
XMLRECORD.value('(/row/@id)[1]', 'nvarchar(10)') AS CUSTOMER_CODE,
ISNULL(CONTACT_NAME.x.value('(./@s)[1]', 'int'),1) AS CONTACT_ROW_NUM,
CONTACT_NAME.x.value('(./text())[1]', 'nvarchar(35)') AS CONTACT_NAME,
(
    SELECT CONTACT_POSITION.x.value('(./text())[1]', 'nvarchar(35)')
    FROM FBNK_CUSTOMER x
         CROSS APPLY [XMLRECORD].nodes('/row/c178[@m="100"]') AS CONTACT_POSITION(x)
    WHERE COALESCE(CONTACT_NAME.x.value('./@s', 'nvarchar(5)'), '1') = COALESCE(CONTACT_POSITION.x.value('./@s', 'nvarchar(5)'), '1')
AND x.RECID = a.RECID
) AS CONTACT_POSITION,
(
    SELECT CONTACT_WORK_TEL.x.value('(./text())[1]', 'nvarchar(35)')
    FROM FBNK_CUSTOMER x
         CROSS APPLY [XMLRECORD].nodes('/row/c178[@m="101"]') AS CONTACT_WORK_TEL(x)
    WHERE COALESCE(CONTACT_NAME.x.value('./@s', 'nvarchar(5)'), '1') = COALESCE(CONTACT_WORK_TEL.x.value('./@s', 'nvarchar(5)'), '1')
AND x.RECID = a.RECID
) AS CONTACT_WORK_TEL,
(
    SELECT CONTACT_HOME_TEL.x.value('(./text())[1]', 'nvarchar(35)')
    FROM FBNK_CUSTOMER x
         CROSS APPLY [XMLRECORD].nodes('/row/c178[@m="102"]') AS CONTACT_HOME_TEL(x)
    WHERE COALESCE(CONTACT_NAME.x.value('./@s', 'nvarchar(5)'), '1') = COALESCE(CONTACT_HOME_TEL.x.value('./@s', 'nvarchar(5)'), '1')
AND x.RECID = a.RECID
) AS CONTACT_HOME_TEL,
(
    SELECT CONTACT_MOBILE_TEL.x.value('(./text())[1]', 'nvarchar(35)')
    FROM FBNK_CUSTOMER x
         CROSS APPLY [XMLRECORD].nodes('/row/c178[@m="103"]') AS CONTACT_MOBILE_TEL(x)
    WHERE COALESCE(CONTACT_NAME.x.value('./@s', 'nvarchar(5)'), '1') = COALESCE(CONTACT_MOBILE_TEL.x.value('./@s', 'nvarchar(5)'), '1')
AND x.RECID = a.RECID
) AS CONTACT_MOBILE_TEL,
XMLRECORD.value('(/row/c181/text())[1]', 'int') AS CURR_NO,
CAST(SUBSTRING(XMLRECORD.value('(/row/c183/text())[1]', 'nvarchar(35)'), 1, 6) AS DATE) AS LAST_UPD_DATE
FROM FBNK_CUSTOMER a
CROSS APPLY [XMLRECORD].nodes('/row/c178[@m="99"]') AS CONTACT_NAME(x)
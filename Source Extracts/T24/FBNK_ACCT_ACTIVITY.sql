SELECT 
SUBSTRING(RECID, 1, (CHARINDEX('-', RECID, 0)-1)) AS ACCOUNT_NO,
CONVERT( DATE, SUBSTRING(RECID, (CHARINDEX('-', RECID, 0)+1), 6)+BASEREC.x.value('(.)', 'nvarchar(5)')) AS VALUE_DATE,
(
SELECT REC.x.value('(./text())[1]', 'decimal (19,2)')
FROM [FBNK_ACCT_ACTIVITY] x
CROSS APPLY [XMLRECORD].nodes('//row/c2') AS REC(x)
WHERE COALESCE(REC.x.value('./@m', 'nvarchar(5)'), '1') = COALESCE(BASEREC.x.value('./@m', 'nvarchar(5)'), '1')
AND x.RECID = a.RECID
) AS TURNOVER_CREDIT,
(
SELECT REC.x.value('(./text())[1]', 'decimal (19,2)')
FROM [FBNK_ACCT_ACTIVITY] x
CROSS APPLY [XMLRECORD].nodes('//row/c3') AS REC(x)
WHERE COALESCE(BASEREC.x.value('./@m', 'nvarchar(5)'), '1') = COALESCE(REC.x.value('./@m', 'nvarchar(5)'), '1')
AND x.RECID = a.RECID
) AS TURNOVER_DEBIT,
(
SELECT REC.x.value('(./text())[1]', 'decimal (19,2)')
FROM [FBNK_ACCT_ACTIVITY] x
CROSS APPLY [XMLRECORD].nodes('//row/c4') AS REC(x)
WHERE COALESCE(BASEREC.x.value('./@m', 'nvarchar(5)'), '1') = COALESCE(REC.x.value('./@m', 'nvarchar(5)'), '1')
AND x.RECID = a.RECID
) AS BALANCE
FROM [FBNK_ACCT_ACTIVITY] a
CROSS APPLY [XMLRECORD].nodes('//row/c1') AS BASEREC(x);
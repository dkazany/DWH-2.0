SELECT XMLRECORD.value('(/row/@id)[1]', 'int') AS TRANSACTION_CODE,
XMLRECORD.value('(/row/c1/text())[1]', 'nvarchar(65)') AS NARRATIVE,
XMLRECORD.value('(/row/c5/text())[1]', 'nvarchar(65)') AS DEBIT_CREDIT_IND,
XMLRECORD.value('(/row/c34/text())[1]', 'nvarchar(35)') AS RECORD_STATUS,
XMLRECORD.value('(/row/c35/text())[1]', 'int') AS CURR_NO
FROM FBNK_TRANSACTION
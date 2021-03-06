SELECT XMLRECORD.value('(/row/@id)[1]', 'nvarchar(35)') AS CONTRACT_NO,
       XMLRECORD.value('(/row/c1/text())[1]', 'nvarchar(35)') AS CUSTOMER_ID,
       XMLRECORD.value('(/row/c2/text())[1]', 'nvarchar(35)') AS CURRENCY,
       XMLRECORD.value('(/row/c4/text())[1]', 'decimal(24,2)') AS AMOUNT,
       XMLRECORD.value('(/row/c6/text())[1]', 'date') AS VALUE_DATE,
       XMLRECORD.value('(/row/c7/text())[1]', 'date') AS FIN_MAT_DATE,
       XMLRECORD.value('(/row/c7/text())[1]', 'nvarchar(35)') AS LIMIT_REFERENCE,
       XMLRECORD.value('(/row/c11/text())[1]', 'nvarchar(35)') AS CATEGORY,
       XMLRECORD.value('(/row/c13/text())[1]', 'nvarchar(35)') AS INT_RATE_TYPE,
       XMLRECORD.value('(/row/c14/text())[1]', 'nvarchar(35)') AS INT_RATE_BASE,
       XMLRECORD.value('(/row/c15/text())[1]', 'nvarchar(35)') AS INT_PAYMT_METHOD,
       XMLRECORD.value('(/row/c16/text())[1]', 'decimal(24,2)') AS INTEREST_RATE,
       XMLRECORD.value('(/row/c44/text())[1]', 'nvarchar(35)') AS LIQUIDATION_MODE,
       XMLRECORD.value('(/row/c45/text())[1]', 'nvarchar(35)') AS OVERDUE_STATUS,
       XMLRECORD.value('(/row/c72/text())[1]', 'nvarchar(35)') AS INT_LIQ_ACCT,
       XMLRECORD.value('(/row/c84/text())[1]', 'date') AS AGREEMENT_DATE,
       XMLRECORD.value('(/row/c90/text())[1]', 'nvarchar(35)') AS STATUS,
       XMLRECORD.value('(/row/c104/text())[1]', 'decimal(24,2)') AS DRAWDOWN_NET_AMT,
       XMLRECORD.value('(/row/c167[@m="64"]/text())[1]', 'nvarchar(35)') AS APPLICATION_ID,
       XMLRECORD.value('(/row/c167[@m="88"]/text())[1]', 'nvarchar(35)') AS LMB_SD_FREQ,
       XMLRECORD.value('(/row/c167[@m="89"]/text())[1]', 'nvarchar(35)') AS LMB_SD_INST_NO,
       XMLRECORD.value('(/row/c245/text())[1]', 'nvarchar(35)') AS RECORD_STATUS,
       XMLRECORD.value('(/row/c246/text())[1]', 'int') AS CURR_NO,
       XMLRECORD.value('(/row/c247/text())[1]', 'nvarchar(65)') AS INPUTTER,
       CAST(SUBSTRING(XMLRECORD.value('(/row/c248/text())[1]', 'nvarchar(35)'), 1, 6) AS DATE) AS LAST_UPD_DATE,
       XMLRECORD.value('(/row/c249/text())[1]', 'nvarchar(65)') AS AUTHORISER,
       XMLRECORD.value('(/row/c250/text())[1]', 'nvarchar(65)') AS CO_CODE,
       XMLRECORD.value('(/row/c250/text())[1]', 'nvarchar(65)') AS DEPT_CODE
FROM FBNK_LD_L000;
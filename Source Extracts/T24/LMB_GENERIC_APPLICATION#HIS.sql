SELECT LEFT(XMLRECORD.value('(/row/@id)[1]', 'varchar(35)'), CHARINDEX(';', XMLRECORD.value('(/row/@id)[1]', 'varchar(35)'))-1) AS LMB_GEN_APP_ID,
       XMLRECORD.value('(/row/c7/text())[1]', 'date') AS DISBURSEMENT_DATE,
       XMLRECORD.value('(/row/c8/text())[1]', 'varchar(35)') AS ACCOUNT_OFFICER,
       XMLRECORD.value('(/row/c9/text())[1]', 'varchar(35)') AS STATUS,
       XMLRECORD.value('(/row/c10/text())[1]', 'varchar(35)') AS SUB_STATUS,
       XMLRECORD.value('(/row/c11/text())[1]', 'int') AS REJECTION_REASON,
       XMLRECORD.value('(/row/c12/text())[1]', 'int') AS POSTPONE_REASON,
       XMLRECORD.value('(/row/c15/text())[1]', 'decimal(24,2)') AS AMOUNT_APPLIED,
       XMLRECORD.value('(/row/c16/text())[1]', 'decimal(24,2)') AS AMOUNT_APPROVED,
       XMLRECORD.value('(/row/c17/text())[1]', 'date') AS REGISTRATION_DATE,
       XMLRECORD.value('(/row/c18/text())[1]', 'date') AS APPLICATION_DATE,
       XMLRECORD.value('(/row/c19/text())[1]', 'date') AS APPROVED_DATE,
       XMLRECORD.value('(/row/c20/text())[1]', 'decimal(24,2)') AS INTEREST_RATE,
       XMLRECORD.value('(/row/c21/text())[1]', 'varchar(35)') AS INTEREST_BASIS,
       XMLRECORD.value('(/row/c22/text())[1]', 'int') AS TERM_IN_MONTHS,
       XMLRECORD.value('(/row/c36/text())[1]', 'varchar(35)') AS DISBURSE_ACCOUNT,
       XMLRECORD.value('(/row/c37/text())[1]', 'varchar(35)') AS REPAY_ACCOUNT,
       XMLRECORD.value('(/row/c38/text())[1]', 'int') AS LMB_SUB_INDUSTRY,
       XMLRECORD.value('(/row/c40/text())[1]', 'varchar(35)') AS CARD_TYPE,
       XMLRECORD.value('(/row/c43/text())[1]', 'varchar(35)') AS SCH_TYPE,
       XMLRECORD.value('(/row/c44/text())[1]', 'int') AS SCH_NO_OF_INST,
       XMLRECORD.value('(/row/c45/text())[1]', 'date') AS SCH_VAL_DATE,
       XMLRECORD.value('(/row/c46/text())[1]', 'date') AS SCH_START_DATE,
       XMLRECORD.value('(/row/c47/text())[1]', 'date') AS SCH_MAT_DATE,
       XMLRECORD.value('(/row/c342/text())[1]', 'varchar(35)') AS RECORD_STATUS,
       XMLRECORD.value('(/row/c343/text())[1]', 'int') AS CURR_NO,
       XMLRECORD.value('(/row/c344/text())[1]', 'varchar(65)') AS INPUTTER,
       CAST(SUBSTRING(XMLRECORD.value('(/row/c345/text())[1]', 'varchar(35)'), 1, 6) AS DATE) AS LAST_UPD_DATE,
       XMLRECORD.value('(/row/c346/text())[1]', 'varchar(65)') AS AUTHORISER
FROM FBNK_LMB_008;
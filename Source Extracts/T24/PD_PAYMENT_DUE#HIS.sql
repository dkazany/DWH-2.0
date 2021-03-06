SELECT LEFT(XMLRECORD.value('(/row/@id)[1]', 'varchar(35)'), CHARINDEX(';', XMLRECORD.value('(/row/@id)[1]', 'varchar(35)'))-1) AS CONTRACT_NUMBER,
       XMLRECORD.value('(/row/c19)[1]', 'decimal (24,2)') AS TOTAL_OVERDUE_AMOUNT,
       XMLRECORD.value('(/row/c27)[1]', 'decimal (24,2)') AS OUTSTANDING_AMT,
       XMLRECORD.value('(/row/c74[@m="31"]/text())[1]', 'date') AS LMB_WOF_DATE,
       XMLRECORD.value('(/row/c74[@m="2"]/text())[1]', 'varchar(35)') AS LEGAL_ACTION_FLAG,
       XMLRECORD.value('(/row/c74[@m="4"]/text())[1]', 'date') AS LMB_PD_DUE_DATE,
       XMLRECORD.value('(/row/c74[@m="5"]/text())[1]', 'date') AS LMB_EFFECT_DATE,
       XMLRECORD.value('(/row/c74[@m="6"]/text())[1]', 'varchar (35)') AS LMB_NO_DAYS,
       XMLRECORD.value('(/row/c74[@m="9"]/text())[1]', 'decimal (24,2)') AS LMB_PDFEE_OUTS,
       XMLRECORD.value('(/row/c74[@m="10"]/text())[1]', 'decimal (24,2)') AS LMB_PDFEE_PAID,
       XMLRECORD.value('(/row/c74[@m="14"]/text())[1]', 'int') AS LMB_INT_NO_DAYS,
       XMLRECORD.value('(/row/c74[@m="17"]/text())[1]', 'decimal (24,2)') AS LMB_INT_OUTS,
       XMLRECORD.value('(/row/c74[@m="18"]/text())[1]', 'decimal (24,2)') AS LMB_INT_PAID,
       XMLRECORD.value('(/row/c74[@m="20"]/text())[1]', 'decimal (24,2)') AS LMB_TOT_OUTS,
       XMLRECORD.value('(/row/c74[@m="21"]/text())[1]', 'decimal (24,2)') AS LMB_TOTPEN_OUTS,
       XMLRECORD.value('(/row/c74[@m="28"]/text())[1]', 'decimal (24,2)') AS LMB_WOF_OUTS,
       XMLRECORD.value('(/row/c74[@m="29"]/text())[1]', 'decimal (24,2)') AS LMB_WOF_PAID,
       XMLRECORD.value('(/row/c74[@m="33"]/text())[1]', 'int') AS LMB_ACCUM_DAYS,
       XMLRECORD.value('(/row/c74[@m="40"]/text())[1]', 'date') AS LMB_LD_VAL_DATE,
       XMLRECORD.value('(/row/c74[@m="41"]/text())[1]', 'date') AS LMB_LD_MAT_DATE,
       XMLRECORD.value('(/row/c74[@m="42"]/text())[1]', 'int') AS LMB_CAL_DAYS,
       XMLRECORD.value('(/row/c74[@m="43"]/text())[1]', 'int') AS LMB_PEN_DAYS,
       XMLRECORD.value('(/row/c107/text())[1]', 'int') AS RECNO,
       XMLRECORD.value('(/row/c108/text())[1]', 'varchar(65)') AS INPUTTER,
       CAST(SUBSTRING(XMLRECORD.value('(/row/c109/text())[1]', 'varchar(35)'), 1, 6) AS DATE) AS LAST_UPD_DATE,
       XMLRECORD.value('(/row/c110/text())[1]', 'varchar(65)') AS AUTHORISER
FROM FBNK_PD_PAYMENT_DUE#HIS;
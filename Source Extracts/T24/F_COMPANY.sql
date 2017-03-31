SELECT 
XMLRECORD.value('(/row/@id)[1]', 'nvarchar(35)') AS COMPANY_CODE,
XMLRECORD.value('(/row/c1/text())[1]', 'nvarchar(35)') AS COMPANY_NAME,
XMLRECORD.value('(/row/c2/text())[1]', 'nvarchar(35)') AS NAME_ADDRESS,
XMLRECORD.value('(/row/c39[@m="2"]/text())[1]', 'nvarchar(65)') AS BRANCH_LICENSE_NUMBER,
XMLRECORD.value('(/row/c39[@m="3"]/text())[1]', 'nvarchar(35)') AS BANK_TAX_ID,
XMLRECORD.value('(/row/c39[@m="4"]/text())[1]', 'nvarchar(65)') AS BRANCH_NAME_AZ,
XMLRECORD.value('(/row/c39[@m="5"]/text())[1]', 'nvarchar(65)') AS BRANCH_ADDRESS,
XMLRECORD.value('(/row/c39[@m="6"]/text())[1]', 'nvarchar(65)') AS BRANCH_PHONE,
XMLRECORD.value('(/row/c39[@m="7"]/text())[1]', 'nvarchar(65)') AS BRANCH_CITY,
XMLRECORD.value('(/row/c39[@m="9"]/text())[1]', 'nvarchar(35)') AS LMB_BANK_SORT_CODE,
XMLRECORD.value('(/row/c39[@m="10"]/text())[1]', 'nvarchar(35)') AS LMB_ZONES,
XMLRECORD.value('(/row/c77/text())[1]', 'nvarchar(35)') AS RECORD_STATUS,
XMLRECORD.value('(/row/c78/text())[1]', 'int') AS CURR_NO,
XMLRECORD.value('(/row/c79/text())[1]', 'nvarchar(35)') AS INPUTTER,
CAST(SUBSTRING(XMLRECORD.value('(/row/c80/text())[1]', 'nvarchar(35)'), 1, 6) AS DATE) AS LAST_UPD_DATE
FROM F_COMPANY
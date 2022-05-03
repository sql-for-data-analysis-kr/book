-- 테이블을 생성합니다.
DROP table if exists retail_sales;
CREATE table retail_sales
(
sales_month date
,naics_code varchar
,kind_of_business varchar
,reason_for_null varchar
,sales decimal
)
;

-- CSV 파일에서 데이터를 읽어 테이블에 채워넣습니다. 
COPY retail_sales 
FROM 'C:\sql_data\us_retail_sales.csv' -- 본인이 다운로드 한 CSV 파일의 경로로 수정하세요
DELIMITER ','
CSV HEADER
;

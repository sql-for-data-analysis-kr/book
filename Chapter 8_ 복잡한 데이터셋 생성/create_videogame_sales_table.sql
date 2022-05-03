-- 테이블을 생성합니다.
DROP table if exists videogame_sales;
CREATE table videogame_sales
(
rank int
,name varchar
,platform varchar
,year int
,genre varchar
,publisher varchar
,na_sales decimal
,eu_sales decimal
,jp_sales decimal
,other_sales decimal
,global_sales decimal
)
;

-- CSV 파일에서 데이터를 읽어 테이블에 채워넣습니다.
-- 본인이 다운로드 한 CSV 파일의 경로로 수정하세요
COPY videogame_sales FROM 'C:\sql_data\videogame_sales.csv' DELIMITER ',' CSV HEADER;

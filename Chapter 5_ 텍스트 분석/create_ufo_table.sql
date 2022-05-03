-- 테이블을 생성합니다.
DROP table if exists ufo;
CREATE table ufo
(
sighting_report varchar(1000)
,description text
)
;

-- CSV 파일에서 데이터를 읽어 테이블에 채워넣습니다. 
-- 본인이 다운로드 한 CSV 파일의 경로로 수정하세요
COPY ufo FROM 'C:\sql_data\ufo1.csv' DELIMITER ',' CSV HEADER;
COPY ufo FROM 'C:\sql_data\ufo2.csv' DELIMITER ',' CSV HEADER;
COPY ufo FROM 'C:\sql_data\ufo3.csv' DELIMITER ',' CSV HEADER;
COPY ufo FROM 'C:\sql_data\ufo4.csv' DELIMITER ',' CSV HEADER;
COPY ufo FROM 'C:\sql_data\ufo5.csv' DELIMITER ',' CSV HEADER;



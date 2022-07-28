-- 테이블을 생성합니다.
DROP table if exists public.earthquakes;
CREATE table public.earthquakes
(
time timestamp
,latitude decimal
,longitude decimal
,depth decimal
,mag decimal
,magType varchar
,nst decimal
,gap decimal
,dmin decimal
,rms decimal
,net varchar
,id varchar
,updated timestamp
,place varchar
,type varchar
,horizontalError decimal
,depthError decimal
,magError decimal
,magNst decimal
,status varchar
,locationSource varchar
,magSource varchar
)
;

-- CSV 파일에서 데이터를 읽어 테이블에 채워넣습니다.
-- 본인이 다운로드 한 CSV 파일의 경로로 수정하세요
COPY public.earthquakes FROM 'C:\sql_data\earthquakes1.csv' DELIMITER ',' CSV HEADER;
COPY public.earthquakes FROM 'C:\sql_data\earthquakes2.csv' DELIMITER ',' CSV HEADER;
COPY public.earthquakes FROM 'C:\sql_data\earthquakes3.csv' DELIMITER ',' CSV HEADER;
COPY public.earthquakes FROM 'C:\sql_data\earthquakes4.csv' DELIMITER ',' CSV HEADER;
COPY public.earthquakes FROM 'C:\sql_data\earthquakes5.csv' DELIMITER ',' CSV HEADER;
COPY public.earthquakes FROM 'C:\sql_data\earthquakes6.csv' DELIMITER ',' CSV HEADER;
COPY public.earthquakes FROM 'C:\sql_data\earthquakes7.csv' DELIMITER ',' CSV HEADER;
COPY public.earthquakes FROM 'C:\sql_data\earthquakes8.csv' DELIMITER ',' CSV HEADER;
COPY public.earthquakes FROM 'C:\sql_data\earthquakes9.csv' DELIMITER ',' CSV HEADER;
COPY public.earthquakes FROM 'C:\sql_data\earthquakes10.csv' DELIMITER ',' CSV HEADER;
COPY public.earthquakes FROM 'C:\sql_data\earthquakes11.csv' DELIMITER ',' CSV HEADER;
COPY public.earthquakes FROM 'C:\sql_data\earthquakes12.csv' DELIMITER ',' CSV HEADER;
COPY public.earthquakes FROM 'C:\sql_data\earthquakes13.csv' DELIMITER ',' CSV HEADER;
COPY public.earthquakes FROM 'C:\sql_data\earthquakes14.csv' DELIMITER ',' CSV HEADER;
COPY public.earthquakes FROM 'C:\sql_data\earthquakes15.csv' DELIMITER ',' CSV HEADER;

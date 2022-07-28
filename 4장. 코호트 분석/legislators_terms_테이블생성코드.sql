-- 테이블을 생성합니다.
DROP table if exists legislators_terms;
CREATE table legislators_terms
(
id_bioguide varchar
,term_number int 
,term_id varchar primary key
,term_type varchar
,term_start date
,term_end date
,state varchar
,district int
,class int
,party varchar
,how varchar
,url varchar--terms_1_url
,address varchar
,phone varchar
,fax varchar
,contact_form varchar
,office varchar
,state_rank varchar
,rss_url varchar
,caucus varchar
)
;

-- CSV 파일에서 데이터를 읽어 테이블에 채워넣습니다.
-- 본인이 다운로드 한 CSV 파일의 경로로 수정하세요
COPY legislators_terms FROM 'C:\sql_data\legislators_terms.csv' DELIMITER ',' CSV HEADER;



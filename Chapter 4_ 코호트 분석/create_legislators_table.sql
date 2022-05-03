-- 테이블을 생성합니다.
DROP table if exists legislators;
CREATE table legislators
(
full_name varchar
,first_name varchar
,last_name varchar
,middle_name varchar
,nickname varchar
,suffix varchar
,other_names_end date
,other_names_middle varchar
,other_names_last varchar
,birthday date
,gender varchar
,id_bioguide varchar primary key
,id_bioguide_previous_0 varchar
,id_govtrack int
,id_icpsr int
,id_wikipedia varchar
,id_wikidata varchar
,id_google_entity_id varchar
,id_house_history bigint
,id_house_history_alternate int
,id_thomas int
,id_cspan int
,id_votesmart int
,id_lis varchar
,id_ballotpedia varchar
,id_opensecrets varchar
,id_fec_0 varchar
,id_fec_1 varchar
,id_fec_2 varchar
)
;

-- CSV 파일에서 데이터를 읽어 테이블에 채워넣습니다.
-- 본인이 다운로드 한 CSV 파일의 경로로 수정하세요
COPY legislators FROM 'C:\sql_data\legislators.csv' DELIMITER ',' CSV HEADER;


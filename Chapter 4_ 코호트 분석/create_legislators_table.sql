-- 테이블을 생성합니다.
DROP table if exists legislators;

CREATE table legislators
(
full_name varchar--name_official_full
,first_name varchar --name_first
,last_name varchar --name_last
,middle_name varchar --name_middle
,nickname varchar --name_nickname
,suffix varchar --name_suffix
,other_names_end date -- other_names_0_end date
,other_names_middle varchar -- other_names_0_middle
,other_names_last varchar -- other_names_0_last
,birthday date -- bio_birthday
,gender varchar-- bio_gender
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
COPY legislators
FROM 'C:\sql_data\legislators.csv' -- 본인이 다운로드 한 CSV 파일의 경로로 수정하세요
DELIMITER ','
CSV HEADER
;


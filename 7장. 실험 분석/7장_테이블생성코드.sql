-- game_users 테이블을 생성합니다.
DROP table if exists game_users;
CREATE table game_users
(
user_id int
,created date
,country varchar
)
;

-- CSV 파일에서 데이터를 읽어 테이블에 채워넣습니다.
-- 본인이 다운로드 한 CSV 파일의 경로로 수정하세요
COPY game_users FROM 'C:\sql_data\game_users.csv' DELIMITER ',' CSV HEADER;


-- game_actions 테이블을 생성합니다.
DROP table if exists game_actions;
CREATE table game_actions
(
user_id int
,action varchar
,action_date date
) 
;

-- CSV 파일에서 데이터를 읽어 테이블에 채워넣습니다.
-- 본인이 다운로드 한 CSV 파일의 경로로 수정하세요
COPY game_actions FROM 'C:\sql_data\game_actions.csv' DELIMITER ',' CSV HEADER;


-- game_purchases 테이블을 생성합니다.
DROP table if exists game_purchases;
CREATE table game_purchases
(
user_id int
,purch_date date
,amount decimal
)
;

-- CSV 파일에서 데이터를 읽어 테이블에 채워넣습니다.
-- 본인이 다운로드 한 CSV 파일의 경로로 수정하세요
COPY game_purchases FROM 'C:\sql_data\game_purchases.csv' DELIMITER ',' CSV HEADER;


-- exp_assignment 테이블을 생성합니다.
DROP table if exists exp_assignment;
CREATE table exp_assignment
(
exp_name varchar
,user_id int
,exp_date date
,variant varchar
)
;

-- CSV 파일에서 데이터를 읽어 테이블에 채워넣습니다.
-- 본인이 다운로드 한 CSV 파일의 경로로 수정하세요
COPY exp_assignment FROM 'C:\sql_data\exp_assignment.csv' DELIMITER ',' CSV HEADER;


-- 9장 결론



-- 9.1 퍼널 분석: 수도 코드(Pseudo code)


SELECT count(a.user_id) as all_users
,count(b.user_id) as step_one_users
,count(b.user_id) / count(a.user_id) as pct_step_one
,count(c.user_id) as step_two_users
,count(c.user_id) / count(b.user_id) as pct_one_to_two
FROM users a
LEFT JOIN step_one b on a.user_id = b.user_id
LEFT JOIN step_two c on b.user_id = c.user_id
;


SELECT count(a.user_id) as all_users
,count(b.user_id) as step_one_users
,count(b.user_id) / count(a.user_id) as pct_step_one
,count(c.user_id) as step_two_users
,count(c.user_id) / count(b.user_id) as pct_step_two
FROM users a
LEFT JOIN step_one b on a.user_id = b.user_id
LEFT JOIN step_two c on a.user_id = c.user_id
;


-- 9.2 이탈, 휴면의 정의: 4장의 입법가 데이터셋을 활용해 실제 동작하는 코드


-- 갭 분석
SELECT avg(gap_interval) as avg_gap
FROM
(
    SELECT id_bioguide, term_start
    ,lag(term_start) over (partition by id_bioguide order by term_start) as prev
    ,age(term_start,lag(term_start) over (partition by id_bioguide order by term_start)) as gap_interval
    FROM legislators_terms
    WHERE term_type = 'rep'
) a
WHERE gap_interval is not null
;


SELECT gap_months, count(*)
FROM
(
    SELECT id_bioguide, term_start
    ,lag(term_start) over (partition by id_bioguide order by term_start) as prev
    ,age(term_start,lag(term_start) over (partition by id_bioguide order by term_start)) as gap_interval
    ,date_part('year',age(term_start,lag(term_start) over (partition by id_bioguide order by term_start))) * 12
          + date_part('month',age(term_start,lag(term_start) over (partition by id_bioguide order by term_start))) as gap_months
    FROM legislators_terms
    WHERE term_type = 'rep'
) a
WHERE gap_months is not null
GROUP BY 1
ORDER BY 1
;


-- 마지막 시간 이후(time since last) 분석
SELECT date_part('year',interval_since_last) as years_since_last
,count(*) as reps
FROM
(
    SELECT id_bioguide
    ,max(term_start) as max_date
    ,age('2020-05-19',max(term_start)) as interval_since_last
    FROM legislators_terms
    WHERE term_type = 'rep'
    GROUP BY 1
) a
GROUP BY 1
ORDER BY 1
;


-- 활동 고객, 휴면 고객, 이탈 고객 분석
SELECT 
case when months_since_last <= 23 then 'Current'
     when months_since_last <= 48 then 'Lapsed'
     else 'Churned' 
     end as status
,sum(reps) as total_reps     
FROM
(
    SELECT 
    date_part('year',interval_since_last) * 12 
     + date_part('year',interval_since_last)
     as months_since_last
    ,count(*) as reps
    FROM
    (
        SELECT id_bioguide
        ,max(term_start) as max_date
        ,age('2020-05-19',max(term_start)) as interval_since_last
        FROM legislators_terms
        WHERE term_type = 'rep'
        GROUP BY 1
    ) a
    GROUP BY 1
) a
GROUP BY 1
;


-- 9.3 장바구니 분석: 수도 코드(Pseudo code)


SELECT product1, product2
,count(customer_id) as customers
FROM
(
    SELECT a.customer_id
    ,a.product as product1
    ,b.product as product2
    FROM purchases a
    JOIN purchases b on a.customer_id = b.customer_id and b.product > a.product
) a
GROUP BY 1,2
ORDER BY 3 desc
;

SELECT products
,count(customer_id) as customers
FROM
(
    SELECT customer_id
    ,string_agg(product,', ') as products
    FROM purchases
    GROUP BY 1
) a
GROUP BY 1
ORDER BY 2 desc
;


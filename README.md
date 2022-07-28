# SQL로 시작하는 데이터 분석
## 실무에 꼭 필요한 분석 기법 총정리! 실제 데이터셋으로 배우는 시계열, 코호트, 텍스트 분석

초판 1쇄 발행 2022년 8월 10일 &nbsp; 

지은이 캐시 타니무라 / 옮긴이 박상근 / 펴낸이 김태헌 &nbsp; 

펴낸곳 한빛미디어 (주) / 주소 서울시 서대문구 연희로2길 62 한빛미디어(주) IT출판부 &nbsp; 

전화 02 – 325 – 5544 / 팩스 02 – 336 – 7124 &nbsp; 

등록 1999년 6월 24일 제25100-2017-000058호 / ISBN 979–11–6921–008–9 93000 &nbsp; 

## 목차
- 1장. SQL을 활용한 분석
- [2장. 데이터 준비](https://github.com/sql-for-data-analysis-kr/book/tree/main/2%EC%9E%A5.%20%EB%8D%B0%EC%9D%B4%ED%84%B0%20%EC%A4%80%EB%B9%84)
- [3장. 시계열 분석](https://github.com/sql-for-data-analysis-kr/book/tree/main/3%EC%9E%A5.%20%EC%8B%9C%EA%B3%84%EC%97%B4%20%EB%B6%84%EC%84%9D)
- [4장. 코호트 분석](https://github.com/sql-for-data-analysis-kr/book/tree/main/4%EC%9E%A5.%20%EC%BD%94%ED%98%B8%ED%8A%B8%20%EB%B6%84%EC%84%9D)
- [5장. 텍스트 분석](https://github.com/sql-for-data-analysis-kr/book/tree/main/5%EC%9E%A5.%20%ED%85%8D%EC%8A%A4%ED%8A%B8%20%EB%B6%84%EC%84%9D)
- [6장. 이상 탐지](https://github.com/sql-for-data-analysis-kr/book/tree/main/6%EC%9E%A5.%20%EC%9D%B4%EC%83%81%20%ED%83%90%EC%A7%80)
- [7장. 실험 분석](https://github.com/sql-for-data-analysis-kr/book/tree/main/7%EC%9E%A5.%20%EC%8B%A4%ED%97%98%20%EB%B6%84%EC%84%9D)
- [8장. 복잡한 데이터셋 생성](https://github.com/sql-for-data-analysis-kr/book/tree/main/8%EC%9E%A5.%20%EB%B3%B5%EC%9E%A1%ED%95%9C%20%EB%8D%B0%EC%9D%B4%ED%84%B0%EC%85%8B%20%EC%83%9D%EC%84%B1)
- [9장. 결론](https://github.com/sql-for-data-analysis-kr/book/tree/main/9%EC%9E%A5.%20%EA%B2%B0%EB%A1%A0)

---

본 깃허브는 [SQL로 시작하는 데이터 분석]에서 사용하는 실습 데이터와 예제 코드를 제공합니다.
각 장에 해당하는 csv 파일을 다운받고, 테이블 생성 코드를 실행하여 실습을 위한 테이블을 생성하세요.
본문에서 사용하는 SQL 예제 코드도 함께 제공하고 있지만, 복사/붙여넣기로 코드를 실행하기보다 직접 타이핑하며 코드가 동작하는 원리를 이해하는 것이 좋습니다.

### SQL 실습 환경 구축

- [PostgreSQL 설치 및 실행](./postgreSQL_설치및실행방법.md)

### SQL 실행시 문제 해결

```
오류:  날짜/시간 필드의 값이 범위를 벗어남: "1/1/1947 17:00"
힌트:  날짜 표현 방식("datestyle")을 다른 것으로 사용하고 있는 듯 합니다.
```
TIMESTAMP 또는 DATE 타입으로 데이터 타입 변환시 위와 같은 에러가 발생할 수 있습니다.
컴퓨터는 연도/월/일의 형식으로 문자열이 저장되어 있다고 판단하지만,
실제 값은 월/일/연도의 형식으로 저장되어 있기 때문에 위와 같은 오류가 발생합니다.
이때는 아래 명령어를 실행하여 현재 날짜 형식으로 저장된 문자열이 월/일/연도의 형식으로 저장되어 있다는 것을 명시해야 합니다.

```sql
SET datestyle = mdy; -- 월/일/연도(month/day/year)
```

이제 현재 저장된 날짜 형식의 문자열이 월/일/연도(month/day/year)의 형식으로 저장되어 있음을 명시하였습니다.
다음 다시 데이터 타입 변환 쿼리를 실행하면 오류없이 실행할 수 있습니다.

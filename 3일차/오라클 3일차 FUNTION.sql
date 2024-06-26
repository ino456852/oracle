-- 3일차

-- 오라클 함수의 종류
-- 1. 단일행 함수 - 결과값 여러개
-- 2. 다중행 함수 - 결과값 1개(그룹합수)
SELECT SUM(SALARY) FROM EMPLOYEE;

-- A 숫자 처리 함수
-- - ABS(절대값), MOD(나머지)D, TRUNC(소숫점 지정 버림), FLOOR(버림),ROUND(반올림), CEIL(올림)
SELECT TRUNC(SYSDATE-HIRE_DATE,2) FROM EMPLOYEE; -- 소숫점 2자리 남고 버리기
-- 함수의 결과를 테스트 해볼 수 있게 해주는 가상의 테이블 DUAL
SELECT MOD(35,3) FROM DUAL; 
SELECT ABS(-1) FROM DUAL;
SELECT SYSDATE FROM DUAL;
-- B 문자 처리 함수
-- C 날자 처리 함수
-- ADD_MONTHS(), MONTHS_BETWEEN(), LAST_DAY(), EXTRACT, SYSDATE
SELECT ADD_MONTHS(SYSDATE,2) FROM DUAL; -- 2개월 뒤를 출력 해줌
SELECT MONTHS_BETWEEN(SYSDATE,'24/05/07') FROM DUAL; 
-- ex1) EMPLOYEE 테이블에서 사원의 이름, 입사일, 
-- 입사 후 3개월이 된 날짜를 조회하시오.
SELECT EMP_NAME,HIRE_DATE, HIRE_DATE+90, ADD_MONTHS(HIRE_DATE,3)
FROM EMPLOYEE;
-- ex2) EMPLOYEE 테이블에서 사원의 이름, 입사일, 근무 개월수를 조회하시오.
SELECT EMP_NAME, HIRE_DATE , FLOOR((SYSDATE-HIRE_DATE)/30), 
FLOOR(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)) FROM EMPLOYEE;
-- LAST DAY() 마지막 날짜를 구해줌
SELECT LAST_DAY(SYSDATE) FROM DUAL;
SELECT LAST_DAY('24/02/23')+1 FROM DUAL;
-- ex3) EMPLOYEE 테이블에서 사원이름, 입사일, 입사월의 마지막날을 조회하세요.
SELECT EMP_NAME AS 이름,HIRE_DATE AS 입사일,LAST_DAY(HIRE_DATE) AS 입사월말일
FROM EMPLOYEE;

--EXTRACT 년도, 월 ,일 DATE에서 추출해줌
SELECT EXTRACT(YEAR FROM SYSDATE) FROM DUAL;
SELECT EXTRACT(MONTH FROM SYSDATE) FROM DUAL;
SELECT EXTRACT(DAY FROM SYSDATE) FROM DUAL;

-- ex4) EMPLOYEE 테이블에서 사원이름, 입사 년도, 입사 월, 입사 일을 조회하시오
SELECT EMP_NAME AS 이름,
EXTRACT(YEAR FROM HIRE_DATE)||'년도' AS 입사년도,
EXTRACT(MONTH FROM HIRE_DATE)||'월' AS 입사월,
EXTRACT(DAY FROM HIRE_DATE)||'일' AS 입사일
FROM EMPLOYEE;
COMMIT;
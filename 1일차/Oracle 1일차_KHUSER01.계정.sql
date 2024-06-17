SHOW USER;

CREATE TABLE EMPLOYEE( -- TABLE 생성
    NAME VARCHAR2(20),
    T_CODE VARCHAR2(10),
    D_CODE VARCHAR2(10),
    AGE NUMBER
);
-- 1. 컬럼의 데이터 타입없이 테이블 생성하여 오류남
-- -> 데이터타입 작성
-- 2. 권한도 없이 테이블을 생성하여 오류남
-- -> System 계정에서 RESORCE 권한 부여
-- 3. 접속 해제 후 접속 새로운 워크시트 말고 기존 워크시트에서 접속을 선택하여
-- 명령어 재실행

INSERT INTO EMPLOYEE(NAME, T_CODE, D_CODE, AGE) -- 데이터 삽입
VALUES('일용자' , 'T1' , 'D1' , 33);
INSERT INTO EMPLOYEE -- 생략 가능
VALUES('이용자','T2','D1',44);
INSERT INTO EMPLOYEE
VALUES('삼용자','T1','D2',32); 
INSERT INTO EMPLOYEE  
VALUES('백인호','T1','D2',29);


DROP TABLE EMPLOYEE; -- TABLE 삭제
DELETE FROM EMPLOYEE; -- TABLE 내용 삭제
DELETE FROM EMPLOYEE WHERE NAME = '백인호'; -- DELETE FROM WHERE

UPDATE EMPLOYEE SET T_CODE = 'T3' WHERE NAME = '일용자'; -- 업데이트 조심

SELECT NAME,T_CODE, D_CODE, AGE FROM EMPLOYEE
WHERE NAME = '일용자';

SELECT * FROM EMPLOYEE;

-- 이름이 STUDENT TABLE 테이블을 만드세요
-- 이름 나이 학년 주소를 저장할 수 있도록 하며
-- 일용자 21 1 서울시 중구를 저장해주세요
-- 데이터를 삭제하는 쿼리문을 작성하고 삭제를 확인하시고
-- 테이블을 삭제하는 쿼리문을 작성하여 테이블이 사라진 것을 확인하세요

CREATE TABLE STUDENT( -- 테이블 STUDENT 생성
NAME VARCHAR2(10), -- 문자열 10자
AGE NUMBER(3), -- 숫자 3자리123
GRADE NUMBER(5),
ADDRESS VARCHAR2(200)
);

SELECT * FROM STUDENT;

ROLLBACK; -- 되돌리기
INSERT INTO STUDENT  -- 데이터 삽임
VALUES ('일용자',21,1,'서울시 중구'); -- 값
COMMIT; -- 저장

ROLLBACK; -- 되돌리기
INSERT INTO STUDENT  -- 데이터 삽임
VALUES ('이용자',22,2,'서울시 중구'); -- 값
COMMIT; -- 저장

UPDATE STUDENT  -- 테이블 STUDENT 의 AGE가 21인 행의 NAME을 사용자로 변경
SET NAME = '사용자' -- NAME을 사용자로 바꿔라
WHERE AGE = 21; -- 어디? AGE가 21인 행의

DELETE FROM STUDENT -- 테이블 내용 삭제
WHERE AGE = 21; -- AGE가 21인 행의 


DROP TABLE STUDENT; -- 테이블 삭제

-- 아이디가 KHUSER02 비밀번호가 KHUSER02 계정을 생성하고
-- 접속이 되도록 하고 테이블도 만들 수 있도록 하세요

--system red
CREATE USER KHUSER03 IDENTIFIED BY KHUSER03;
GRANT CONNECT TO KHUSER03; -- 권한 부여

-- KHUSER02  하늘색
CREATE TABLE STUDENT (
NAME VARCHAR2(20), -- 20byte 김(3byte)
AGE NUMBER(3),
GRADE NUMBER(5),
ADDRESS VARCHAR2(200)
);

-- system red
GRANT RESOURCE TO KHUSER02;

INSERT INTO STUDENT(NAME,AGE,GRADE,ADDRESS)
VALUES('백인호',29,6,'고양 일산');

DELETE STUDENT;

DROP TABLE STUDENT;

------------------------------------------------------------------
GRANT RESOURCE TO KHUSER03; -- 테이블 등의 생성권한 부여

CREATE TABLE STUDENT( -- 테이블 생성
NAME VARCHAR2(20),
AGE NUMBER(3)
);

SELECT * FROM STUDENT;

INSERT INTO STUDENT VALUES ('백인호',29); -- 삽입
INSERT INTO STUDENT VALUES('백인호',30);

COMMIT; -- 저장
DELETE FROM STUDENT 
NAME -- 이름을 삭제
WHERE AGE = 29; -- AGE가 29인 행의
ROLLBACK; -- 되돌리기

DROP TABLE STUDENT; -- 테이블 STUDENT 지우기
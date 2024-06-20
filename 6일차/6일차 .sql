-- 6일차 DCL - TCL
-- TCL(TRANJECTION COMTROL LANGUGE)
-- COMMIT, ROLLBACK, SAVEPOINT
-- 트렌젝션이란?
-- 한꺼번에 수행되어야 할 최소의 작업 단위를 말함
-- ATM 출금, 계좌이체 등이 트랜젝션의 예
-- 1.카드 투입
-- 2.메뉴 선택
-- 3.금액 입력
-- 4.비밀번호 입력
-- 5.출금 완료
-- 계좌이체
-- 1. 송급버튼 클릭
-- 2. 계좌번호 입력
-- 3. 은행명 선택
-- 4. 금액 입력
-- 5. 비밀번호
-- 6. 이체 버튼 터치

-- ORACLE DBMS 트렌젝션?
-- INSERT 수행 OR UPDATE 수행 OR DELETE 수행이 되었다면 그 뒤에 추가 작업이
-- 있을 것으로 간주하고 처리 -> 트렌젝션이 걸렸다.
DESC USER_GRADE;

INSERT INTO USER_GRADE
VALUES(10,'일반회원');
COMMIT;
ROLLBACK;
-- TCL 명령어
-- 1. COMMIT : 트렌젝션 작업이 정상 완료되어 변경 내용을 영구히 저장(모든 savepoint 삭제)
-- 2. ROLLBACK : 트렌젝션 작업을 모두 취소하고 가장 최근 commit 시점으로 이동.
-- 3. SAVEPOINT <savepoint명> : 현제 트렌젝션 작업 시점에 이름을 저장함
-- 임시저장이라고 하며 하나의 트렌젝션에서 구역을 나눌 수 있음.
CREATE TABLE USER_TCL (
    USER_NO NUMBER UNIQUE,
    USER_ID VARCHAR2(20) PRIMARY KEY,
    USER_NAME VARCHAR2(20) NOT NULL
);
DESC USER_TCL;

INSERT INTO USER_TCL
VALUES(1, 'khuser01','일용자');
INSERT INTO USER_TCL
VALUES(2, 'khuser02','이용자');
INSERT INTO USER_TCL
VALUES(3, 'khuser03','삼용자');

SAVEPOINT UTCL3; -- SAVEPOINT 생성

INSERT INTO USER_TCL
VALUES(4, 'khuser04','사용자');

ROLLBACK TO UTCL3; -- SEVEPOINT로 이동

COMMIT;
ROLLBACK; -- 최종 커밋한 시점으로 이동 SAVEPOINT 삭제

SELECT * FROM USER_TCL;


-- DCL (DATA CONTROL LANGUAGE)
-- DB에 대한 보안, 무결성, 복구 등 DBMS를 제어하기 위한 언어다.
-- GRANT, REVOKE, (COMMIT,ROLLBACK)
-- 권한부여 및 회수는 System 계정에서만 가능(red)

SELECT * FROM CHUN.TB_CLASS;
-- KH계정에는 CHUN에 있는 TB_CLASS를 조회할 권한이 없음
-- 권한 부여를 해야지만 조회가 가능
GRANT SELECT ON CHUN.TB_CLASS TO KH; -- SYSTEM으로 권한 부여

-- 권환 회수하여 조회 차단
REVOKE SELECT ON CHUN.TB_CLASS FROM KH;






















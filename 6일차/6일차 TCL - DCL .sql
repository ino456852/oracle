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


-- DCL
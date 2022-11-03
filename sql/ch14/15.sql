/*
[9일차]
함수 p495
--함수는 결과를 되돌려받기 위해서 함수가 되돌려받을 자료형과 값을 기술해야 한다.
--함수는 반드시 하나의 값을 반환한다.(리턴을위해 펑션을 쓰는 것)
--함수 생성
creat [or replace] FUNCTION 함수명[(파라미터1 IN 자료형, ...있으면 쓰고 없으면 생략 가능한 부분)]
return 자료형
 IS 
        선언부
BEGIN
        실행부
       return 반환값
EXCEPTION
        예외처리부
END[함수명]; - 생략 가능
/

--함수 삭제
 DROP FUNCION 함수명;

*/
--497p 실습 19-19
SET SERVEROUTPUT ON;
CREATE OR REPLACE FUNCTION func_aftertax(
	sal IN NUMBER 
	)
return NUMBER
 IS 
       tax NUMBER := 0.05;
BEGIN
       return (ROUND(sal - (sal * tax )));
END func_aftertax;
/

--19-20
DECLARE
	aftertax NUMBER;
BEGIN
	aftertax := func_aftertax(3000);
	dbms_output.put_line('after-tax incom :' || aftertax);
END;
/
SELECT empno, ename, salary, func_aftertax(salary) AS AFTERTAX 
  FROM emp_tbl;
  
  
  --dual에서는 salary가 없기때문에 직접 값을 줘야한다.
  
SELECT func_aftertax(3000) AS AFTERTAX 
  FROM dual;
  
  
  
  
  
  
/*
 * 트리거 triger
 * 정의 : 이벤트(동작)가 발생할 경우에 자동으로 실행되는 기능이 정의된 PL/SQL 서브프로그램이다.
 * [BEFORE] : 어떤 테이블에 INSERT, UPDATE, DELETE문이 실행(EVENT)되기 전에
 * 			  BEGIN-END 사이의 문장 (트리거 문장)을 실행한다.
 * [AFTER] : 어떤 테이블에 INSERT, UPDATE, DELETE문이 실행(EVENT)된 후에
 * 			  BEGIN-END 사이의 문장 (트리거 문장)을 실행한다.
 	[형식]
 * CREAT TRIGGER 트리거명
 * BERFORE | AFTER
 * EVENT[INSERT | UPDATE | DELETE] ON 테이블명
 * [FOR EACH ROW]--생략가능
 * BEGIN
 * 	트리거 문장;
 * END;
 */ 

 
 --19-31 실습
 CREATE TABLE EMP_TRG
 	AS SELECT * FROM EMP_TBL;
 --19-32 BEFORE 트리거 생성
  CREATE or replace TRIGGER emp_weekend_trg
 BEFORE
  INSERT OR UPDATE OR DELETE ON EMP_TRG
  BEGIN
  	IF TO_CHAR(SYSDATE, 'DY') IN ('토','일')THEN 
  	  IF INSERTING THEN 
  	  	raise_application_error(-20000, '주말 사원정보 추가 불가');
  	  ELSIF UPDATING THEN
  	  	raise_application_error(-20001, '주말 사원정보 수정 불가');
 	  ELSIF DELETING THEN
 	    raise_application_error(-20002, '주말 사원정보 삭제 불가');
 	  ELSE
 	    raise_application_error(-20003, '주말 사원정보 변경 불가');
 	  END IF;
 	END IF;
 END;
 /
  --19-33 평일 날짜로 update하기
  UPDATE emp_trg 
           SET salary = 35000
    WHERE empno = 101;
     commit;
--1 행 이(가) 업데이트되었습니다.
    select * from emp_trg;
 --19-34 주말 날짜로 update하기
  UPDATE emp_trg 
           SET salary = 30000
    WHERE empno = 102;
--ORA-20001: 주말 사원정보 수정 불가
 
 
 
--after
--insert => emp_trg : 999, 김연아, 20/07/06, 1000000, 30, kim@naver.com
--log에도 넣기
--update => emp_trg : 102, 방탄소년 salary: 9999999로 수정
--각각LOG확인

--19-35 로그테이블 생성
DROP TABLE EMP_TRG_LG;
CREATE TABLE EMP_TRG_LG(
	TABLENAME VARCHAR2(10),
	DML_TYPE VARCHAR2(10),
	EMPNO NUMBER(4),
	USER_NAME VARCHAR(30),
	CHANGE_DATE DATE
	);
--19-36 DML실행 후 수행할 트리거 생성하기
DROP TRIGGER TRG_EMP_LG;
CREATE TRIGGER TRG_EMP_LG
AFTER
 INSERT OR UPDATE OR DELETE ON EMP_TRG
 FOR EACH ROW
 BEGIN 
 	IF INSERTING THEN 
 		INSERT INTO EMP_TRG_LG
 		VALUES ('EMP_TRG', 'INSERT', :new.empno, SYS_CONTEXT('USERNV', 'SEESION_USER'), SYSDATE);
 	ELSIF UPDATING THEN
 		INSERT INTO EMP_TRG_LG
 		VALUES ('EMP_TRG', 'UPDATE', :old.empno, SYS_CONTEXT('USERNV', 'SEESION_USER'), SYSDATE);
 	ELSIF DELETING THEN
 		INSERT INTO EMP_TRG_LG
 		VALUES ('EMP_TRG', 'DELETE', :old.empno, SYS_CONTEXT('USERNV', 'SEESION_USER'), SYSDATE);
 	END IF;
END;
/
--19-39 EMP_TRG에 INSERT 실행하기 
INSERT INTO EMP_TRG
VALUES (999, '김연아',TO_DATE('20/07/06','YY-MM-DD'), 1000000, 30, 'kim@naver.com');
COMMIT;
--19-39 EMP_TRG에 INSERT 확인하기 
SELECT * FROM EMP_TRG;
--19-40 EMP_TRG_LG 테이블의 INSERT 기록 확인
SELECT * FROM EMP_TRG_LG;
--19-41 EMP_TRG 테이블에 UPDATE 실행하기
UPDATE EMP_TRG
 SET SALARY = 9999999
 WHERE EMPNO = 102;
 COMMIT;
 --EMP_TRG_LG 테이블의 INSERT 기록 확인
SELECT * FROM EMP_TRG_LG;

--트리거 변경
ALTER TRIGGER 트리거명 ENABLE(활성화)|DISABLE(비활성화);

--트리거 삭제
DROP TRIGGER 트리거명;
  
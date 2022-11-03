/* p291 ch11.트랜잭션
트랜잭션 - 하나의 실행단위
- 트랜잭션은 데이터 처리에서 논리적인 하나의 작업 단위를 의미한다.
- ALL or Nothing : 여러개의 명령어 집합이 정상적으로 처리되면 정상종료하고,
   명령어들중 하나라도 잘못된다면 전체를 취소한다.
- DML 작업이 성공적으로 처리되었다면 COMMIT을, 취소해야 한다면 ROLLBACK 명령을 실행한다.
   ROLLBACK : commit 후에 취소가 되지 않는다.
- DDL(테이블생성, 수정), DCL(권한)문이 실행되는 경우에는 자동으로 COMMIT 된다. COMMIT 할 필요 없다.
- COMMIT - 트랜잭션의 처리과정을 반영하여 변경된 내용을 영구저장한다. 모든 작업들의 정상처리확정 명령어다.
           INSERT, UPDATE, DELETE(즉 DML) 후 COMMIT을 해야 한다.
           
- lOCK : 특정 세션에서 조작중인 데이터는 트랜잭션이 완료(commit or rollback)되기 전까지 다른 계정에서
		 조작할 수 없는 상태가 된다. 즉, 데이터가 '잠금현상'이 일어난다.
		 트랜재션이 완료(commit, rollback)가 되면 lock가 풀리게 된다.
		 
		 주의 : where절을 지정하지 않은 update, delete문일 경우에는 테이블의 모든행 데이터에 영향을 주므로
		 	   전체행이 lock상태가 된다.

- SAVEPOINT - 현재의 트랜잭션을 작게 분할한다. 대소문자 구별함
   저장된 SAVEPOINT는 ROLLBACk TO SAVEPOINT 문을 사용하여 표시한 곳까지 롤백할 수 있다.
  1) SAVEPOINT S1;   -- S1 : SAVEPOINT명
     SAVEPOINT S2;   -- S2 : SAVEPOINT명
   2) ROLLBACk TO S1;   -- S1 : SAVEPOINT명
*/ 

CREATE TABLE MEMBER_TBL_TR
 AS SELECT * FROM MEMBER_TBL;
  
 SELECT * FROM MEMBER_TBL_TR;
/*
101	김태희	30	xogml@daum.net	서울시 강남구
102	비		35	ql@daum.net		서울시 강남구
103	아이유	27	iu@iu.com		서울시 강남구 서초동
104	박나래	35	park@daum.net	서울시 강남구 서초동
105	유느님	40	you@daum.net	서울시 강남구 가산동
*/
INSERT INTO MEMBER_TBL_TR(M_ID, M_NAME, M_AGE, M_EAMIL, M_ADDRESS)
 	VALUES (101, '김태희', 30, 'xogml@daum.net', '서울시 강남구');
 
INSERT INTO MEMBER_TBL_TR(M_ID, M_NAME, M_AGE, M_EAMIL, M_ADDRESS)
 	VALUES (102, '비', 35, 'ql@daum.net', '서울시 강남구');
 
INSERT INTO MEMBER_TBL_TR(M_ID, M_NAME, M_AGE, M_EAMIL, M_ADDRESS)
 	VALUES (106, '김정식', 40, 'kim@nr.com', '서울시 강서구 마곡동');
COMMIT;

 
ROLLBACK;    --COMMIT 이후 작업이 모두 취소
SELECT * FROM MEMBER_TBL_TR; --101,102삭제 취소

UPDATE MEMBER_TBL_TR
   SET M_EAMIL = 'iu_copy@google.com'
 WHERE M_ID = 103;
SAVEPOINT s1;

DELETE FROM MEMBER_TBL_TR
  WHERE M_id = 104;
 SAVEPOINT s5;  
 
DELETE FROM MEMBER_TBL_TR
  WHERE M_EAMIL = 'kim@nr.com';
SAVEPOINT s4;  

SELECT * FROM MEMBER_TBL_TR;
ROLLBACK TO s1;
ROLLBACK TO s2;
ROLLBACK;

select * from MEMBER_TBL_TR;
 
/*
 * 데이터 사전 p327
 * - 데이터 사전 : 사용자와 데이터베이스 자원의 효율적 관리를 위한 다양한 정보는 저장하는 시스템 테이블의 집합이다.
 * - 사용자가 테이블을 생성하거나, 사용자를 변경하는 등의 작업을 할 때 데이터베이스 서버에 의해 
 *   자동으로 갱신되는 테이블이다.
 * - [접두어]
 * USER_XXXX : 자신의 계정이 소유한 객체 등에 관한 정보 조회
 * ALL_XXXX : 사용허가를 받은 모든 객체 정보 
 * DBA_XXXX : 데이터베이스 관리자(SYSTEM, SYS)만 접근가능한 정보
 * 
 * -데이터 사전 - USER_데이터 사전
 *  	- USER_SEQYENCES : 사용자가 소유한 시퀀스의 정보
 * 		- USER_INDEXES : 사용자가 소유한 인덱스의 정보
 * 		- USER_NIEWS : 사용자가 소유한 뷰의 정보
 */
--SCOTT 계정에서 실행
--user_tables : USER_데이터 사전 -> 자신의 계정에서 개인이 만든 테이블 목록 조회
--13-3
SELECT Table_name
  FROM USER_tables; --개발자가 만든 테이블 목록

--13-4
SELECT owner, Table_name
  FROM all_tables;
--13-6
SELECT owner, Table_name
  FROM dba_tables;  --system 계정에서 실행

 
 
 ----------------------
 
 /*
  * 13-2 인덱스 p334
  *
  * - 인덱스 (=색인)는 검색 속도를 향상시키기 위해 사용
  * - 기본키나 유일키는 자동으로 인덱스가 생성된다.
  * - USER_COLUNMN, USER_IND_COLUMN데이터 사전을 통해 확인
  * 
  * - 데이터 사전 - USER 데이터 사전
  *	- USER_SEQYENCES : 사용자가 소유한 시퀀스의 정보
  * - USER_INDEXES : 사용자가 소유한 인덱스의 정보
  * - USER_NIEWS : 사용자가 소유한 뷰의 정보
  */ 
--13-8
 SELECT * 
   FROM user_indexes;
--기본키나 유일키는 자동으로 인덱스가 생성된다.
  SELECT index_name
  	   , table_name
  	   , column_name
  	FROM USER_IND_COLUMNS 
   WHERE table_name IN ('DEPT_TBL', 'EMP_TBL'); --소문자이면 에러난다.

-- 제약조건명은 모든 테이블에서 중복되면 안된다.
SELECT CONSTRAINT_name, CONSTRAINt_type, table_name
  FROM sys.USER_CONSTRAINTS
 WHERE table_name IN ('DEPT_TB', 'EMP_TBL');
  
  
  
/*인덱스의 종류

- 1) 비고유 인덱스 : 중복된 데이터를 갖는 컬럼에대해서 생성하는 인덱스이며,
                이 때 unique를 붙이면 에러가 난다.
- 2) 고유 인덱스 : 기본키나 유일키처럼 유일한 값을 컬럼에대해서 생성하는 인덱스이며, unique index로 사용한다
- 3) 결합 인덱스 :  두개 이상의 컬럼으로 인덱스를 구성
- 4) 함수기반 인덱스 : 수식이나 함수를 적용하여 만든 인덱스
*/ 
create table emp_idx 
as
select * from emp_tbl;  --구조, 데이터까지 복사 단, 제약조건은 복사가 안됨.

create table dept_idx
as
select * from DEPT_TBL;

select * from emp_idx;
select * from dept_idx;
select * from TAB;  --테이블 목록 확인



-- 1) 비고유 인덱스 (중복된 데이터를 갖는 컬럼 여기서는 ename 이름이 중복될 수 있다.)
drop index idx_emp_ename;
create index idx_EMP_ENAME
          on emp_idx(ename);
          
   SELECT index_name
  	   , table_name
  	   , column_name
  	FROM USER_IND_COLUMNS --데이터 사전에서 검색
   WHERE table_name IN ('EMP_IDX'); --반드시 대문자
--인덱스명        테이블명    컬럼명
--IDX_EMP_ENAME	EMP_IDX	  ENAME



-- 2) 고유 인덱스 : 기본키나 유일키처럼 유일한 값을 컬럼에대해서 생성하는 인덱스
create unique index idx_DEPT_tbl_deptno
    on dept_idx(deptno);
    
 SELECT index_name
  	   , table_name
  	   , column_name
   FROM USER_IND_COLUMNS --데이터 사전에서 검색
  WHERE table_name IN ('DEPT_IDX'); --반드시 대문자
   --인덱스명                 테이블명      컬럼명
   --IDX_DEPT_TBL_DEPTNO	DEPT_IDX	DEPTNO

-- 3) 결합 인덱스 :  두개 이상의 컬럼으로 인덱스를 구성
drop table idx_DEPT_COM;
create index idx_DEPT_COM
    on dept_idx(deptname, loc);

SELECT index_name
  	   , table_name
  	   , column_name
  FROM USER_IND_COLUMNS --데이터 사전에서 검색
 WHERE table_name IN ('DEPT_IDX'); --반드시 대문자
   --인덱스명                 테이블명      컬럼명
   --IDX_DEPT_TBL_DEPTNO	DEPT_IDX	DEPTNO
   --IDX_DEPT_COM	        DEPT_IDX	DEPTNAME
   --IDX_DEPT_COM	        DEPT_IDX	LOC


 -- 4) 함수기반 인덱스 : 수식이나 함수를 적용하여 만든 인덱스
 drop table idx_emp_salary;
create index idx_emp_salary
    on emp_idx(salary * 12);

SELECT index_name
  	   , table_name
  	   , column_name
  FROM USER_IND_COLUMNS --데이터 사전에서 검색
 WHERE table_name IN ('EMP_IDX'); --반드시 대문자
--인덱스명                테이블명       컬럼명 
--IDX_EMP_SALARY	    EMP_IDX	   SYS_NC00007$



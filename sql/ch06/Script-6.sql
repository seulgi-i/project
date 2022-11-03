/*
P.312
페이지 생성
1.SCOTT계정으로 변경
2.Schemas > scott > tables 우클릭 > create New Table

CRUD : 생성(CREATE) 조회(RETRIEVE) 수정(UPDATE) 삭제(DELETE)
*/

--테이블 삭제(f5로 새로고침)
DROP TABLE MEMBER_TBL;

--테이블 생성(f5로 새로고침)
CREATE TABLE member_tbl (
   m_id      number(3)       PRIMARY KEY,   --PK( NOT NULL, UNIQUE)
   m_name      varchar2(20)    NOT NULL,      --필수
   m_age      number(3),
   m_email      varchar2(60)    NOT NULL,      --필수
   m_address   varchar2(100)
);


--P.266 테이블에 데이터 추가하기
--열 순서와 자료형에 맞게 데이터 입력
--INSERT INTO 테이블명(컬럼명1, 컬럼명2...)
--           VALUES(값1, 값2, )
INSERT INTO MEMBER_TBL(M_ID, M_NAME, M_AGE, M_EMAIL, M_ADDRESS)
 VALUES(101, '김태희', 30, 'ki@naver.com', '서울시 강남구 서초동');

INSERT INTO MEMBER_TBL(M_ID, M_NAME, M_AGE, M_EMAIL, M_ADDRESS)
 VALUES(102, '비', 30, 'rain@naver.com', '서울시 강남구 서초동');

INSERT INTO MEMBER_TBL(M_ID, M_NAME, M_AGE, M_EMAIL, M_ADDRESS)
 VALUES(103, '홍길동', 35, 'hong@naver.com', '서울시 강남구 서초동');

INSERT INTO MEMBER_TBL(M_ID, M_NAME, M_AGE, M_EMAIL, M_ADDRESS)
 VALUES(104, '박나래', 30, 'park@naver.com', '서울시 강남구 가산동');

INSERT INTO MEMBER_TBL(M_ID, M_NAME, M_AGE, M_EMAIL, M_ADDRESS)
 VALUES(105, '유느님', 40, 'you@naver.com', '서울시 금천구 가산동');
 
INSERT INTO MEMBER_TBL(M_ID, M_NAME, M_AGE, M_EMAIL, M_ADDRESS)
 VALUES(106, '어피치', 40, 'a@naver.com', '서울시 금천구 가산동');

COMMIT;   --영구저장 (데이터베이스-트랜잭션모드-manual로 변경해야 함. 기본설정 : auto commit)
ROLLBACK;   --COMMIT전이면 취소가능

SELECT * FROM MEMBER_TBL mt;

/*
P.277 
데이터 삭제
UPDATE 테이블명
   SET 변경컬럼명1 = 수정할데이터1, 변경컬럼명2 = 수정할데이터2...
 WHERE 조건식;
 */
UPDATE MEMBER_TBL
   SET M_NAME = '아이유', M_AGE = 27
 WHERE M_ID = 103;




/*
P.283
데이터 삭제
DELETE FROM 테이블명
 WHERE 조건절;
*/
DELETE FROM MEMBER_TBL
 WHERE M_ID = 106;
COMMIT;
-----------------------------------------------------------
----------------테이블레벨 : 현업에서 더 많이 사용----------------

-----------------------------------------------------------
--테이블 생성 순서 : 부모테이블 -> 자식테이블(부모테이블을 참조해서 생성)
--테이블 삭제 순서 : 자식테이블부터(부모를 참조하고 있기 때문..)
--on DELETE CASCADE : 안물어보고 마음대로 삭제가능..
--부서테이블 생성(부모 테이블)
DROP TABLE DEPT_tbl;
CREATE TABLE DEPT_tbl(
   deptno      number(2),   --PK
   deptname   varchar2(50) NOT NULL,
   loc         varchar2(50),
   CONSTRAINT DEPT_tbl_deptno_pk PRIMARY KEY(deptno) --테이블 레벨

);

--사원테이블 생성(자식테이블)
DROP TABLE emp_tbl;
CREATE TABLE emp_tbl(
      empno       NUMBER(3),      --pk
      ename       varchar2(30) NOT NULL,
      hire_date   DATE DEFAULT sysdate,
      salary       NUMBER(9)CONSTRAINT emp_tbl_salary_min CHECK (salary > 0),
      deptno      number(2),      --fk
      email      varchar2(100),   -- UNIQUE
      CONSTRAINT emp_tbl_empno_pk PRIMARY KEY (empno),
      CONSTRAINT emp_tbl_deptno_fk FOREIGN KEY (deptno) REFERENCES dept_tbl(deptno)
               ON DELETE CASCADE, --자식테이블에 설정하면, 부모테이블 데이터 삭제시, 자식도 함께 삭제
      CONSTRAINT emp_tbl_email_uk UNIQUE(email)
);

SELECT * FROM emp_tbl;
SELECT * FROM dept_tbl;


INSERT INTO dept_tbl(deptno, deptname, loc)
 VALUES(10, 'IT', '뉴욕');
 
INSERT INTO dept_tbl(deptno, deptname, loc)
 VALUES(20, 'MARKETING', '캐나다');
 
INSERT INTO dept_tbl(deptno, deptname, loc)
 VALUES(30, 'ACCOUNT', '파리');
 
INSERT INTO dept_tbl(deptno, deptname, loc)
 VALUES(40, 'HR', '맨하튼');
 
INSERT INTO dept_tbl(deptno, deptname, loc)
 VALUES(50, 'SINGER', '서울');
 
COMMIT;
SELECT * FROM dept_tbl;

INSERT INTO emp_tbl(empno, ename, hire_date, salary, deptno, email)
 VALUES(101, '아이유', '2022/07/01', 10000, 10, 'iu@naver.com');
 
INSERT INTO emp_tbl(empno, ename, hire_date, salary, deptno, email)
 VALUES(102, '방탄소년', '2022/07/02', 20000, 20, 'bt@naver.com');
 
INSERT INTO emp_tbl(empno, ename, hire_date, salary, deptno, email)
 VALUES(103, '소지섭', '2022/07/03', 30000, 30, 'sjs@naver.com');
 
INSERT INTO emp_tbl(empno, ename, hire_date, salary, deptno, email)
 VALUES(104, '박나래', '2022/07/04', 40000, 40, 'pnr@naver.com');
 
INSERT INTO emp_tbl(empno, ename, hire_date, salary, deptno, email)
 VALUES(105, '유느님', '2022/07/05', 50000, 50, 'you@naver.com');
 
COMMIT;
SELECT * FROM EMP_TBL;
--부서코드 60 : violated parent key not found
--INSERT INTO emp_tbl(empno, ename, hire_date, salary, deptno, email)
-- VALUES(106, '아이유', '2022/07/01', 10000, 60, 'iu2@naver.com');


--dept_tbl의 50번 부서를 삭제하면 50번부서의 사원정보도 함께 삭제됌. 동시순장..on delete cascade
DELETE FROM DEPT_TBL
 WHERE DEPTNO = 50;
COMMIT;


/*
P.360 14장. 제약조건 종류
1.제약조건
-제약조건이란 테이블에 유효하니 않은(부적절한) 데이터가 입력되는 것을 방지하기 위해서
 테이블 생성시 각 컬럼에 대해 정의하는 규칙이다.

-데이터 무결성 : 데이터베이스에 저장되는 데이터의 정확성과 일관성을 보장한다는 의미이다.
             제약조건은 데이터 무결성을 지키기 위한 안전장치로서 중요한 역할을 한다.
             INSERT, UPDATE, DELETE등 모든 과정에서 제약조건을 지켜야 한다.

-Oracle의 제약조건 종류
   구분         설명
-NOT NULL : 컬럼에 NULL값을 허용하지 않는다. 중복가능
-UNIQUE : 지정한 컬럼이 유일한 값을 가져야 한다. 단 NULL값은 중복에서 제외
-PRIMARY KEY : 식별자로서 지정한 컬럼이 유일한 값이면서 NULL을 허락하지 않는다. 테이블에 하나만 지정가능하다.
-FOREING KEY : 부모테이블에 존재하는 PK의 값만 입력가능하다. NULL을 허용한다.
-CHECK : 설정한 조건식을 만족하는 데이터만 입력가능하다.


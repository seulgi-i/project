/* 뷰 p338
1. 뷰의 개념과 사용하기
- 뷰(View)는 한마디로 물리적인 테이블(create table)을 근거로 한(=서브쿼리) 논리적인(sql문장) 가상테이블
- 디스크 저장 공간이 할당되지 않는다. (가상테이블)
  즉, 실질적으로 데이터를 저장하지 않고, 데이터 사전에, 뷰를 정의할 때 기술한 쿼리문만 저장되어 있다.
  하지만 사용방법은 테이블에서 파생된 객체 테이블과 유사하기 때문에 가상테이블이라 한다.
  뷰의 정의는 USER_VIEWS 데이터 사전을 통해 조회가 가능하다.
  
2. 동작원리
- 뷰는 데이터를 저장하고 있지 않은 가상테이블이므로 실체가 없다.
  뷰가 테이블처럼 사용될 수 있는 이유는, 뷰를 정의할 때 CREATE VIEW 명령어 다음의
  AS 절에 기술한 쿼리문장 자체를 데이터딕셔너리에 저장하고 있다가 이를 실행하기 때문이다.
                                                 (v_emp_dept)
                                                 
  SELECT문의 FROM 절에서 v-emp로 기술하여 정의하면, 오라클 서버는 USER_VIEWS(라는 데이터딕셔너리)에서 뷰이름(v-emp)를 찾는다.
  기술했던 서브쿼리문장이 저장된 text값을 view 즉 v_emp 위치(from다음)로 가져와서 실행한다. p275 그림 참조
 
3. 뷰를 사용하는 이유
- 보안과 사용의 편의성 때문
- 보안 : 권한별로 접근이 제한되어서 동일한 테이블에 접근하는 사람마다 다른 뷰에 접근할 수 있도록 한다.

4. 권한부여
권한 부여 방법(system에서 부여): grant creat view to scott;
만약 권한을 부여하지 않으면 insufficient privileges  => create view권한 없음 => 권한 부여하면 됨.
view를 생성하면 자동으로 user_views 데이터사전에 등록이 된다.

VIEW 이름은 user_views 데이터사전의 view_name에 저장
SQL문은 user_views 데이터사전의 text에 저장

*/

--scott에서 실행
create or replace view v_emp_dept
as
select e.empno
     , e.ename
     , e.email
     , e.hire_date
     , e.deptno
     , d.deptname
     , d.loc
  from emp_tbl e
     , dept_tbl d
 where e.deptno = d.deptno;  
--View V_EMP_DEPT이(가) 생성되었습니다.

--view조회
select * from v_emp_dept;

/*
101	아이유	    IU@IU.COM	        22/07/01	10  	IT	                뉴욕
102	방탄소년	BTS@BT.COM	    22/07/02	20  	MARKETING	캐나다
103	소지섭	    SUB@SUB.COM 	22/07/03	30	    ACCOUNT	    파리
104	차은우	    EN@EN.COM       	22/07/04	40  	HR	            맨하튼
*/

-- user_views : 데이터 사전의 user 테이블
-- view_name : 뷰이름
-- text : 뷰내용(=서브쿼리)


--데이터 사전에서 뷰를 조회
--회사에서 자주 쓰는 sql문을 이렇게 등록.

select view_name, text
  from user_views;

/* p343
    뷰 삭제하기
    (형식) Drop VIEW  뷰이름;
    뷰는 실체가 없는 가상테이블이기 때문에 뷰를 삭제한다는 것은 USER_VIEWS데이터 사전에 저장되어 있는
    뷰의 정의를 삭제하는 것을 의미
--뷰를 정의한 기본테이블의 구조나 데이터에는 영향이 없다.
*/

DROP VIEW v_emp_dept;
--View V_EMP_DEPT이(가) 삭제되었습니다.

select view_name, text
  from user_views;
--뷰를 정의한 문장이 사라진 것을 확인할 수 있음.

/*
P341
CREATE OR REPLACE VIEW
이미 존재하는 뷰에대해서 그 내용을 새롭게 변경하여 재생성
뷰가 없으면 새롭게 생성하고, 존재하면 변경

WITH CHECK OPTION --조회 기준
지정한 제약 조건을 만족하는 데이터에 한해 DML 작업이 가능하도록 뷰 생성

-WITH READ ONLY
 해당 뷰를 통해서 SELECT만 가능하며, INSERT/UPDATE/DELETE를 할 수 없다.
 */
 --WITH READ ONLY
CREATE OR REPLACE VIEW v_emp_readonly
AS
select empno
     , ename
     , hire_date
     , salary
     , deptno
  from emp_tbl 
  WITH READ ONLY;
--View V_EMP_READONLY이(가) 생성되었습니다.
SELECT view_name, text
  from user_views;


select * from v_emp_readonly;
insert into  v_emp_readonly(empno, ename, hire_date, salary, deptno)
  values (106, '박명수',sysdate, 10000, 40);
  -- "cannot perform a DML operation on a read-only view"

/*
1) email 컬럼을 빼고 view생성
2)111,112,113 insert (email)컬럼 빼고
3)update email -> eamil 컬럼이 없으므로 ng
4)email 컬럼을 추가하고 view생성
5)delete
6)insert
7)update(메일)
*/







CREATE OR REPLACE VIEW v_emp_chkoption
AS
select empno
     , ename
     , hire_date
     , salary
     , deptno
     , email
  from emp_tbl 
  where empno in (111,112,113) -- 이미 있는 데이터 말고 없는 데이터, 지정한 제약 조건을 만족하는 데이터에 한해 DML 작업이 가능하도록 뷰 생성
  WITH CHECK OPTION;
--View V_EMP_CHKOPTION이(가) 생성되었습니다.

delete from v_emp_chkoption
where empno in (111,112,113);


  
  insert into  v_emp_chkoption(empno, ename, hire_date, salary, deptno, email)
  values (111, '이효리', sysdate, 20000, 40,' lee@daum.net');
  
    insert into  v_emp_chkoption(empno, ename, hire_date, salary, deptno, email)
  values (112, '상순', sysdate, 30000, 40, ' sang@daum.net');
  
    insert into  v_emp_chkoption(empno, ename, hire_date, salary, deptno, email)
  values (113, '신동엽', sysdate, 40000, 40, ' shin@daum.net');
  
  
  
  insert into v_emp_chkoption(empno, ename, hire_date, salary, deptno)
    values (114, '신애리', sysdate, 20000, 40);
  -- view WITH CHECK OPTION where-clause violation
  
  SELECT * from v_emp_chkoption;
  
  update v_emp_chkoption
     set email = 'lee@naver'
    where empno = 111;
    
      update v_emp_chkoption
     set email = 'assa@naver'
    where empno = 112;
    
      update v_emp_chkoption
     set email = 'ldsad@naver'
    where empno = 113;
    /*
111	이효리	22/07/26	20000	40	lee@naver
112	상순	22/07/26	30000	40	assa@naver
113	신동엽	22/07/26	40000	40	ldsad@naver
*/




/*p292 시퀀스
시퀀스는 테이블내의 유일한 숫자를 자동으로 생성해주며, 기본키로 사용된다.
새로운 데이터가 추가될 때 기본키값을 자동으로 발생시키는 용도로 사용된다.

사용 : 게시판의 게시글번호
---(형식)---
create secquence 시퀀스명
 start with n
increment by n
maxvalue n | minvalue n
cycle | nocycle
cache | nocache

--시퀀스 삭제
drop sequence 시퀀스명;

*/

create sequence dept_seq
 start with 10
increment by 10
maxvalue 90
 nocycle;
 
 -- nextval =  sequnece의 다음번호 생성
 select  dept_seq.nextval from dual;   --10(처음이니 10부터 시작) 20.30,40,50~90  ng(nocycle)
 
 
 -- currval = 시퀀스의 현재값(시퀀스에서 마지막으로 생성한 번호)
 --시퀀스 생성후 바로 사용하면 번호가 만들어진 적이 없으므로 오류가 발생한다. 따라서 nextval을 먼저 사용한 후 사용 한다.
 
 SELECT dept_seq.CURRVAL FROM dual;   --10 , 20. 30,40,50~90 ng안남. 계속90
 
 
 
 select * from dept_tbl; --10~40
 select * from emp_tbl;-- 111~113
 
 
 
 
 --부서테이블 (부모)
 DROP TABLE seq_dept_tbl;
CREATE TABLE seq_dept_tbl(
   deptno      number(2),   --PK
   deptname   varchar2(50) NOT NULL,
   loc         varchar2(50),
   CONSTRAINT seq_dept_tbl_deptno_pk PRIMARY KEY(deptno) --테이블 레벨

);

--사원테이블 생성(자식테이블)
DROP TABLE seq_emp_tbl;
CREATE TABLE seq_emp_tbl(
      empno       NUMBER(3),      --pk
      ename       varchar2(30) NOT NULL,
      hire_date   DATE DEFAULT sysdate,
      salary       NUMBER(9)CONSTRAINT seq_emp_tbl_salary_min CHECK (salary > 0),
      deptno      number(2),      --fk
      email      varchar2(100),   -- UNIQUE
      CONSTRAINT seq_emp_tbl_empno_pk PRIMARY KEY (empno),
      CONSTRAINT seq_dept_tbl_deptno_fk FOREIGN KEY (deptno) REFERENCES seq_dept_tbl(deptno)
               ON DELETE CASCADE, --자식테이블에 설정하면, 부모테이블 데이터 삭제시, 자식도 함께 삭제
      CONSTRAINT seq_emp_tbl_email_uk UNIQUE(email)
);


--10~50까지 10씩 증가
create sequence seq_dept_sequence
 start with 10
increment by 10
maxvalue 50
minvalue 10
cycle
 nocache;
 drop sequence seq_dept_sequence;

--시퀀스명 seq_dept_sequence 생성

--10, 'IT', '뉴욕'
--20, 'MARKETING', '캐나다'
--30, 'ACCOUNT', '파리'
--40, 'HR', '맨하튼'
--50, 'SINGER', '서울'

--101, '아이유', '2022/07/01', 10000, 10, 'iu@naver.com'


INSERT INTO seq_dept_tbl(deptno, deptname, loc)
 VALUES(seq_dept_sequence.nextval, 'IT', '뉴욕'); --10
 
INSERT INTO seq_emp_tbl(empno, ename, hire_date, salary, deptno, email)
 VALUES(101, '아이유', '2022/07/01', 10000, seq_dept_sequence.CURRVAL, 'iu@naver.com');
 
INSERT INTO seq_dept_tbl(deptno, deptname, loc)
 VALUES(seq_dept_sequence.nextval, 'MARKETING', '캐나다');
  
INSERT INTO seq_emp_tbl(empno, ename, hire_date, salary, deptno, email)
 VALUES(102, '방탄소년', '2022/07/02', 20000, seq_dept_sequence.CURRVAL, 'bt@naver.com');
 
INSERT INTO seq_dept_tbl(deptno, deptname, loc)
 VALUES(seq_dept_sequence.nextval, 'ACCOUNT', '파리');
 
INSERT INTO seq_emp_tbl(empno, ename, hire_date, salary, deptno, email)
 VALUES(103, '소지섭', '2022/07/03', 30000, seq_dept_sequence.CURRVAL, 'sjs@naver.com');
 
INSERT INTO seq_dept_tbl(deptno, deptname, loc)
 VALUES(seq_dept_sequence.nextval, 'HR', '맨하튼');
 
INSERT INTO seq_emp_tbl(empno, ename, hire_date, salary, deptno, email)
 VALUES(104, '박나래', '2022/07/04', 40000, seq_dept_sequence.CURRVAL, 'pnr@naver.com');
 
INSERT INTO seq_dept_tbl(deptno, deptname, loc)
 VALUES(seq_dept_sequence.nextval, 'SINGER', '서울');
 
 INSERT INTO seq_emp_tbl(empno, ename, hire_date, salary, deptno, email)
 VALUES(105, '유느님', '2022/07/05', 50000, seq_dept_sequence.CURRVAL, 'you@naver.com');
 
COMMIT;



 

 
 SELECT * FROM seq_emp_tbl;
 
 select * from seq_dept_tbl s , seq_emp_tbl q
 where  s.deptno=q.deptno;
 
 /*
   계정생성 및 권한관리

 -- 1. 계정생성
-- create user <계정이름> identified by <계정암호> default tablespace users;
   create user scott identified by tiger default tablespace users;
-- 2. 사용자 권한 부여
  -- gradnt [시스템 권한] to [계정];
   grant connect, resource to scott;
   grant create view to scott;
 --3. 권한 취소
 -- revoke [시스템권한] from [계정];
  REVOKE view FROM scott;
  -- 4. 계정 잘못만든 경우 계정 삭제하기 -- drop user <계정이름> cascade;
    drop user scott cascade; 

-- 5. 패스워드 변경
--alter user <계정이름> identified by <패스워드>;
    alter user scott identified by tiger; 
  ////////////////////////////////////////////////////////////////////
  
-- cmd 상태
-- 교육용 hr 계정 사용하려면
-- 1. sqlplus system_117/1234로 접속 또는 system계정으로 연결

-- 2. 락해제
alter user hr account unlock;

-- 3. 패스워드 변경
--alter user <계정이름> identified by <패스워드>;
alter user hr identified by tiger; 

  */
 
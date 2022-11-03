/* ch06
 * <오라클 계정 생성>
 * 
-- <오라클 계정 생성 방법>
-- cmd 상태
-- 교육용 hr 계정 사용하려면
-- 1. sqlplus system_105/oracle로 접속

-- 2. 락해제
alter user hr account unlock;

-- 3. 패스워드 변경
--alter user <계정이름> identified by <패스워드>;
alter user hr identified by tiger; 


-- +를 눌러 계정연결하러 간다.
-- Schemas 우클릭 -> Creat New Schema를 눌러 계정을 연결한다

--******************* 일반 계정 생성 =>[시스템계정(System_117)에서 작업 1, 2, 3 ***********
--- 1. 계정생성
-- [DBeaver]
-- Schemas 우클릭 > Create New Schema를 눌러 계정 생성하러 간다(System_117 / 1234)

-- cf) [SQL developer]
-- 이미 system 계정이 생성되어 있으면 연결만 하면 됨.

-- [SQL developer에서만 작업] system 계정(System_117)에서 일반 계정 생성 후, 계정을 연결한다.
-- cf) [dbeaver는 계정을 생성하면 자동으로 연결해줌]
-- create user <계정이름> identified by <계정암호> default tablespace users;
   create user scott identified by tiger default tablespace users;
   
-- 2. 사용자 권한 부여
   grant connect, resource to scott;
   grant create view to scott;
   
--  grant connect, resource,create view to scott; -- connect, resource는 롤

-- 권한 취소
-- revoke [시스템 권한] from [계정];
    revoke create view from scott;
   
-- 3. 락 해제
-- alter user <계정이름> account unlock;
    alter user scott account unlock;
 
-- 실행결과   
--User SCOTT이(가) 생성되었습니다.
--Grant을(를) 성공했습니다.
--User SCOTT이(가) 변경되었습니다.

-- 중요 => Schema를 새로고침하면 scott 계정이 보인다. 그 계정으로 바꿔서 작업
-- 		테이블 생성 및 CRUD : 시트 만들어서 CREATE문 작성
--		사용 금지 : 우클릭해서 CREATE NEW TABLE => 테이블이 자동 생성됨
--------------------------------------------
-- 4. 계정 잘못만든 경우 계정 삭제하기 -- drop user <계정이름> cascade;
    drop user scott cascade; 

-- 5. 패스워드 변경
--alter user <계정이름> identified by <패스워드>;
    alter user scott identified by tiger; 
 */

create user jsp_pj_117_csg identified by tiger default tablespace users;

grant connect, resource to jsp_pj_117_csg;
grant create view to jsp_pj_117_csg;

alter user jsp_pj_117_csg account unlock;


CREATE USER MADANG IDENTIFIED BY MADANG DEFAULT TABLESPACE USERS;
GRANT CONNECT, RESOURCE TO MADANG;
GRANT CREATE VIEW TO MADANG;
ALTER USER MADANG ACCOUNT UNLOCK;


-- hr 계정 연결
alter user hr account unlock;
alter user hr identified by tiger; 

-- 과제 2차 모델링 과제용 계정
CREATE USER project02 IDENTIFIED BY prj02 DEFAULT tablespace users;
GRANT CONNECT, resource TO project02;
GRANT CREATE VIEW TO project02;
ALTER USER project02 account unlock;
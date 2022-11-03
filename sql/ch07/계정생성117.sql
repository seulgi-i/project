--ch06 <오라클 계정생성방법>
----------[11기 1,2,3]---------
--0. 시스템 계정 생성 : 1회
-- [dbeaver]
-- schemas 우클릭 > create new schema를 눌러 계정생성 하러 간다 (system_117/1234)

--cf[SQL developer]
--이미 system 계정이 생성되어 있으면 연결만 하면 됨.

--[sql developer에서만 작업] system계정(system_117)에서 일반계정 생성 후, 계정을 연결한다.
-- cf) dbeaver는 계정을 생성하면 자동으로 연결해줌.

-- cmd 상태
-- 교육용 hr 계정 사용하려면
-- 1. sqlplus system_117/1234로 접속

-- 2. 락해제
alter user hr account unlock;

-- 3. 패스워드 변경
--alter user <계정이름> identified by <패스워드>;
alter user hr identified by tiger; 


--******************* 일반 계정 생성 =>[시스템계정(System_117)에서 작업 ***********
--- 1. 계정생성
-- create user <계정이름> identified by <계정암호> default tablespace users;
   create user scott identified by tiger default tablespace users;
-- 2. 사용자 권한 부여
  -- gradnt [시스템 권한] to [계정];
   grant connect, resource to scott;
   grant create view to scott;
 --3. 권한 취소
 -- revoke [시스템권한] from [계정];
  REVOKE view FROM scott;
--  grant connect, resource,create view to scott;   
-- 4. 락 해제
-- alter user <계정이름> account unlock;
    alter user scott account unlock;
 
-- 실행결과   
--User SCOTT이(가) 생성되었습니다.
--Grant을(를) 성공했습니다.
--User SCOTT이(가) 변경되었습니다.

-- 새로고침하면 scott계정이 보인다. 그 계정으로 바꿔서 작업
--------------------------------------------
-- 4. 계정 잘못만든 경우 계정 삭제하기 -- drop user <계정이름> cascade;
    drop user scott cascade; 

-- 5. 패스워드 변경
--alter user <계정이름> identified by <패스워드>;
    alter user scott identified by tiger; 
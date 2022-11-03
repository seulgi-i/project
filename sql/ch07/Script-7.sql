/*
[6일차]p311
ch12 -2 테이블 생성
*/

-- 테이블 생성시 데이터, 구조 복사
CREATE TABLE member_tbl_copy
	AS SELECT * FROM member_tbl;

SELECT * FROM MEMBER_TBL_copy;  --commit할 필요 없음.
-- 테이블 생성시 데이터를 제외한 구조만 복사
CREATE TABLE member_tbl_copy2
	AS SELECT * FROM member_tbl
 WHERE 0=1; --where절의 값이 false일 때 구조만 가져옴.
-- 방법2-2) 테이블에 데이터 복사하기 (insert select)
INSERT INTO member_tbl_copy2
SELECT * FROM member_tbl;
COMMIT;

SELECT * FROM MEMBER_TBL_copy2;


-----------------------------------------------
/*p317
 * ch12-3 테이블 구조를 변경하는 ALTER TABEL문
 * 1) 컬럼 추가 : ADD 컬럼명 데이터타입
 * 
 * [형식]
 * ALTER TABLE 테이블명
 * ADD 컬럼명 데이터타입
 */
--MEMBER_TBL_copy에 가입일자 컬럼 추가(join_date DATE ... sysdate)
ALTER TABLE MEMBER_TBL_copy
ADD JOIN_date DATE DEFAULT sysdate;
SELECT * FROM MEMBER_TBL_copy;

--MEMBER_TBL_copy에 가입일자 컬럼 추가(salary number ... 0)
ALTER TABLE MEMBER_TBL_copy
ADD SALARY number DEFAULT 0;

SELECT * FROM MEMBER_TBL_copy;

/*p317
 * ch12-3 테이블 구조를 변경하는 ALTER TABEL문
 * 2) 컬럼의 자료형 변경 : MODIFY 컬럼명 데이터타입
 * 		=>기존 데이터는 그대로 유지하면서 데이터타입, 크기, 기본값을 변경한다.
 * [형식]
 * ALTER TABLE 테이블명
 * MODIFY 컬럼명 데이터타입
 */
--MEMBER_TBL_copy에 gender 컬럼 추가(gender number ... 0)
ALTER TABLE MEMBER_TBL_copy
ADD gender number DEFAULT 0;
--MEMBER_TBL_copy에 gender 컬럼 변경(gender varchar2(6) ... 0)
--방법1)데이터가 존재하지 않는경우
ALTER TABLE MEMBER_TBL_copy
MODIFY m_name varchar2(50);

--테이블 생성 후 데이터가 존재하지 않는경우의 자료형 수정 (아주 간단)
CREATE TABLE member_tbl_test
	AS SELECT * FROM member_tbl
 WHERE 0=1;
 
select * from member_tbl_test;

ALTER TABLE member_tbl_test
MODIFY m_age varchar2(5);
--



--방법2) 데이터가 존재하는경우 gender 자료형 변경 => 데이터가 이미 존재해서 데이터를 삭제하기 곤란한 경우
/*
 * 1)변경하고자 하는 데이터 타입을 가진 새로운 컬럼(temp_gender)을 새로 생성
 * 2)기존 컬럼(gender)의 데이터를 새 컬럼(temp)로 복사
 * 3)기존 컬럼 (gender)삭제
 * 4) 새 컬럼(temp_gender)을 기존 컬럼(gender)으로 변경 
 */
SELECT * FROM MEMBER_TBL_COPY;
--1)변경하고자 하는 데이터 타입을 가진 새로운 컬럼(temp_gender)을 새로 생성
ALTER TABLE MEMBER_TBL_COPY
ADD tmep_gender varchar2(10);
--2)기존 컬럼(gender)의 데이터를 새 컬럼(temp)로 복사
UPDATE MEMBER_TBL_COPY
   SET tmep_gender = gender;
 COMMIT;
--3)기존 컬럼 (gender)삭제
ALTER TABLE MEMBER_TBL_COPY
  DROP COLUMN gender;
--4) 새 컬럼(temp_gender)을 기존 컬럼(gender)으로 변경 
ALTER TABLE MEMBER_TBL_COPY
RENAME COLUMN tmep_gender TO gender;  --RENAME column기존컬럼 TO 새컬럼

--GNEDER => 0 => 101,103,104 여성 / 102, 105 남성으로 변경
/* P277
 * UPDATE 테이블명
 *   SET 변경컬1= 값1, 변경컬럼2=값2, ... 변경컬럼N=값N
 * WHERE 조건
 */

--방법1
--UPDATE 테이블명
--   SET 변경컬럼1=서브쿼리1, 변경컬럼2=서브쿼리2,...변경컬럼N = 서브쿼리N
-- WHERE 조건



--UPDATE : FOOD_CODE =5번의 STAR_POINT를 5로 변경
UPDATE MENU_TBL
   SET STAR_POINT = 5
 WHERE FOOD_CODE =5;
 COMMIT;
SELECT * FROM MENU_TBL;
--서브쿼리를 사용하여 데이터 수정
--방법1
--MENU_TBL테이블에서 FOOD_CODE=6번일 때, FOOD_NAME=1번의 라볶이, FOOD_PRCE=2번의 가격
UPDATE MENU_TBL 
   SET FOOD_NAME = (SELECT FOOD_NAME
   					  FROM MENU_TBL
   					 WHERE FOOD_CODE = 2),
   	   FOOD_PRICE = (SELECT FOOD_PRICE
   					  FROM MENU_TBL
   					 WHERE FOOD_CODE = 2)
 WHERE FOOD_CODE = 5;

--방법2
--MENU_TBL테이블에서 FOOD_CODE=5일 때, FOOD_NAME=2번의 서브클럽, FOOD_PRCE=2번의 가격

UPDATE MENU_TBL
  SET (FOOD_NAME, FOOD_PRICE) =(
  					SELECT FOOD_NAME, FOOD_PRICE
  					FROM MENU_TBL
  					WHERE FOOD_CODE=2
  					)
 WHERE FOOD_CODE=5;

UPDATE MENU_TBL
   SET FOOD_NAME = '잡채덮밥'
 WHERE FOOD_CODE = 6;
COMMIT;




UPDATE MEMBER_TBL_COPY
   SET GENDER = '여성'
 WHERE M_ID IN (101, 103, 104);
UPDATE MEMBER_TBL_COPY
   SET GENDER = '남성'
 WHERE M_ID IN (102,105);
COMMIT;

/*
 * p283
 * delecte from 테이블명
 * WHERE 조절
 * 
 * DELETE문의 WHERE에서 서브쿼리를 기술하면, 서브쿼리를 수행한 결과로 내용이 삭제된다.
 * 
 * 방법1
 * DELETE FROM테이블명
 * WHERE 조건절(서브쿼리)
 * 
 * 
 */
INSERT INTO menu_tbl(food_code, restaurant_name, food_kind, food_name, food_price, star_point)
	 VALUES ('7', '중화요리', 'CH', '송이덮밥', 8000, 3);
COMMIT;


--덮밥을 포함하고 있는 데이터를 삭제하라
 DELETE FROM menu_tbl
  WHERE food_name LIKE '%덮밥%';
 COMMIT;
SELECT * FROM MENU_TBL;

--menu_tbl테이블에서 food_price가 food_code 2번(=6000원)의 가격보다 적은 행 삭제
DELETE FROM menu_tbl
  WHERE FOOD_PRICE < (
  					SELECT FOOD_PRICE
  					FROM MENU_TBL
  					WHERE food_code = 2
  					);
 COMMIT;
SELECT * FROM MENU_TBL;


 /*p317
 * ch12-3 테이블 구조를 변경하는 ALTER TABEL문
 * 2) 컬럼 변경 : drop colum 컬럼명 데이터타입
 * 		=>기존 데이터는 삭제
 * [형식]
 * ALTER TABLE 테이블명
 * drop 컬럼명 데이터타입
 */






ALTER TABLE MEMBER_TBL_copy
DROP column join_date;

SELECT * FROM MEMBER_TBL_copy;

/*p321
 * ch12-3 테이블 구조를 변경하는 ALTER TABEL문
 * 2) 컬럼 변경 : drop colum 컬럼명 데이터타입
 * 		=>기존 데이터는 삭제
 * [형식]
 * ALTER TABLE 테이블명
 * drop 컬럼명 데이터타입
 */

--테이블 이름 변경 RENAME TO
--ALTER TABLE [old테이블] rename to [new 테이블]

 TABLE member_tbl_copy2
	AS SELECT * FROM member_tbl;

SELECT * FROM MEMBER_TBL_copy2;

ALTER TABLE member_tbl_copy2
RENAME TO member_tbl_copy3;

--테이블 데이터를 삭제하는 truncate : 롤백이 되지 않는다. (where절이 없는 delete와 동일, 차이점 : 롤백이 된다.)
TRUNCATE TABLE MEMBER_TBL_COPY3;
SELECT * FROM MEMBER_TBL_copy3;

--drop table MEMBER_TBL_COPY3삭제
DROP TABLE MEMBER_TBL_COPY3;






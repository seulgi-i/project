/*ch10
 * 
 * INSERT INTO 테이블명(컬럼1, 컬럼2, ... 컬럼n)
 * 	VALUES (데이터1, 데이터2, ... 데이터n)
 */

--갯수, 순서, 데이터타입 주의
--commit; -- 데이터베이스에 데이터를 영구저장(insert, update, delete 문장 실행 후 Co*mmit)
--테이블 생성
DROP TABLE menu_tbl;
CREATE TABLE MENU_TBL(
 food_code	char(5)			 PRIMARY KEY,
 restaurant_name varchar2(50) 	NOT NULL,
 food_kind char(2)				NOT NULL,
 food_name varchar2(100) 		NOT NULL,
 food_price number(8)			NOT NULL,
 star_point number(1) 			DEFAULT 0
);

INSERT INTO menu_tbl(food_code, restaurant_name, food_kind, food_name, food_price, star_point)
	 VALUES ('1', '김밥천국', 'ko', '라볶이', 5000, 3);

INSERT INTO menu_tbl(food_code, restaurant_name, food_kind, food_name, food_price, star_point)
	 VALUES ('2', '서브웨이', 'US', '서브클럽', 6000, 5);

INSERT INTO menu_tbl(food_code, restaurant_name, food_kind, food_name, food_price, star_point)
	 VALUES ('3', '스시조이', 'jp', '스시', 15000,5);

INSERT INTO menu_tbl(food_code, restaurant_name, food_kind, food_name, food_price, star_point)
	 VALUES ('4', '아웃백', 'US', '스테이크', 35000,4);
--1, 김밥천국, ko, 라볶이, 5000, 3
--2, 서브웨이, US, 서브클럽, 6000, 5
--3, 스시조이, jp, 스시, 15000,5
--4, 아웃백, US, 스테이크, 35000,4

--컬럼명 생략 ㅣ  into절에 컬럼명 생략시 테이블 생성할 때, 정의할 컬럼 순서대로 값을 insert, default도 필수인 경우 insert된다.	
	--모든 컬럼의 값을 지정해야 한다.
INSERT INTO menu_tbl(food_code, restaurant_name, food_kind, food_name, food_price)
	 VALUES ('5', '감성타고', 'ME', '타코', 20000);

UPDATE menu_tbl
  SET restaurant_name='감성타코'
 WHERE food_code=5;

INSERT INTO menu_tbl
	 VALUES ('6', '포차','KO','곰장어',30000,4);
--벨류값은 값을 넣지 않아도 공백이나 null을 넣어서라도 자리를 꼭 차지해야함. 컬럼수=데이터수
--값을 넣지 않고 디폴트값을 이용하려면 컬럼도 빼주면 된다.



COMMIT;	
SELECT * FROM menu_tbl;


/*
 * 서브쿼리를 사용하여 한번에 여러데이터 추가하기 - insert select
 * menu_tbl_copy 테이블 생성 => 구조만 복사후 데이터는 insert select
 */
DROP TABLE menu_tbl_copy;
CREATE TABLE menu_tbl_copy
AS SELECT * FROM menu_tbl
 WHERE 0=1;
 
SELECT * FROM menu_tbl_copy;

INSERT INTO menu_tbl_copy(food_code, restaurant_name, food_kind, food_name, food_price, star_point)
SELECT * FROM menu_tbl
COMMIT;


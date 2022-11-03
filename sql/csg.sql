

----------- 테이블 생성 
-----------[고객 테이블 생성]----------
  DROP TABLE mvc_customer CASCADE  CONSTRAINTS;
CREATE TABLE mvc_customer(
        id                  varchar2(20) PRIMARY KEY,     --id
        password            VARCHAR2(20) NOT NULL,        --비밀번호
        name                VARCHAR2(20) NOT NULL,        --이름
        birthday            DATE         NOT NULL,        --생년원일
        address             VARCHAR2(50) NOT NULL,        --주소
        hp                  VARCHAR2(13),                 --핸드폰
        email               VARCHAR2(50) NOT NULL,        --이메일
        regDate             TIMESTAMP 	 DEFAULT SYSDATE  --가입일
        );
 COMMIT;
 DELETE FROM mvc_customer;
 SELECT *  FROM mvc_customer;   
 --admin 회원가입 후 권한 변경 (시큐리티 부분)
CREATE TABLE mvc_customer(
    id        VARCHAR2(20) PRIMARY KEY,
    password  VARCHAR2(100) NOT NULL,  -- 암호화된 비밀번호를 저장해야 하므로 사이즈 크게 조정(100)
    name      VARCHAR2(20) NOT NULL,   
    birthday  DATE         NOT NULL,
    address   VARCHAR2(50) NOT NULL,
    hp        VARCHAR2(13),
    email     VARCHAR2(50) NOT NULL,
    regDate  TIMESTAMP DEFAULT sysdate,   -- 가입일
    -- 시큐리티를 위한 추가
    key      VARCHAR2(100), -- 회원가입시 이메일 key 추가
    authority VARCHAR2(30) DEFAULT 'ROLE_USER', -- 권한 : ROLE_USER:customer, ROLE_ADMIN:관리자
    enabled   CHAR(1)    DEFAULT 0    -- 계정사용 가능여부(1:사용가능, 0:사용불가) : 이메일인증시 1로 update
);
-- 시큐리티 admin 권한설정
UPDATE mvc_customer
   SET authority='ROLE_ADMIN'
 WHERE id='admin'; 
COMMIT;

SELECT * FROM mvc_customer;
-----------[상품 테이블 생성]----------
  DROP TABLE mvc_product_tbl CASCADE CONSTRAINTS;
CREATE TABLE  mvc_product_tbl (
        pdNo 		NUMBER 			PRIMARY KEY,		--상품번호
        pdName 		VARCHAR2(40) 	NOT NULL UNIQUE,	--상품이름
        pdImg 		VARCHAR2(100) 	NOT NULL,			--상품이미지
        category 	VARCHAR2(50) 	NOT NULL, 			--상품카테고리
        brand 		VARCHAR2(50) 	NOT NULL, 			--상품브랜드
        content 	CLOB,								--상품설명
        price 		NUMBER 			NOT NULL,			--상품가격
        quantity 	NUMBER 			NOT NULL,			--상품수량
        status 		VARCHAR2(20) 	NOT NULL, 			--상품상태
        indate 		DATE 			DEFAULT SYSDATE		--상품입고일
        );
COMMIT;
  DESC mvc_product_tbl;
SELECT *  FROM mvc_product_tbl;

-----------[게시판 테이블 생성]----------
  DROP TAbLE mvc_board_tbl CASCADE CONSTRAINTS;
CREATE TABLE mvc_board_tbl(
        num     	NUMBER(7) 		PRIMARY KEY,   	 	--글번호
        title     	VARCHAR2(50)	NOT NULL,   		--글제목
        content 	CLOB 			NOT NULL,           --글내용
        writer    	VARCHAR2(20) 	NOT NULL,  			--작성자
        password 	VARCHAR2(20) 	NOT NULL,  			--수정, 삭제용 비밀번호
        readCnt    	NUMBER(6)    	DEFAULT 0,      	--조회수
        regDate     DATE 			DEFAULT SYSDATE    	--가입일
        );
COMMIT;
  DESC mvc_board_tbl;
SELECT * FROM mvc_board_tbl;

------[게시판 댓글 테이블 ]-------
  DROP TABLE mvc_board_comment_tbl CASCADE CONSTRAINTS;
CREATE TABLE  mvc_board_comment_tbl (
        comment_num NUMBER(7) 		PRIMARY KEY,							 --댓글번호
        board_num NUMBER(7) 		NOT NULL REFERENCES mvc_board_tbl(num),	 --게시판번호
        writer VARCHAR2(50) 		NOT NULL,								 --작성자
        content CLOB 				NOT NULL,								 --글내용
        reg_date DATE 				DEFAULT SYSDATE							 --작성일
        );
--[댓글 컬럼 추가]
--게시글 목록에 댓글 갯수를 위한 mvc_board_tbl 컬럼 추가 : comment_count
ALTER TABLE mvc_board_tbl ADD comment_count NUMBER(6) DEFAULT 0;
--게시글 목록에 삭제된 게시글을 안보여주기 위한 컬럼 추가 : show
ALTER TABLE mvc_board_tbl ADD show CHAR(1) DEFAULT 'y';

COMMIT;
  DESC mvc_board_comment_tbl;
SELECT *  FROM mvc_board_comment_tbl;

-----------[장바구니 테이블 생성]----------
  DROP TABLE mvc_customer_cart 		CASCADE CONSTRAINTS;				
CREATE TABLE mvc_customer_cart(	
        id  VARCHAR2(20)			REFERENCES  mvc_customer(id),			--아이디
        pdNo NUMBER 				REFERENCES  mvc_product_tbl(pdNo),		--상품번호
        cartNo NUMBER 				PRIMARY KEY,							--카트번호
        cartCnt NUMBER														--수량
        );
COMMIT;        
  DESC mvc_customer_cart;        
SELECT *  FROM mvc_customer_cart;
DELETE FROM mvc_customer_cart;


SELECT *  FROM mvc_customer_cart t
JOIN  mvc_product_tbl p ON t.pdNo = p.pdNo JOIN mvc_customer c ON t.id = c.id where t.pdNo=5 AND t.id='test';
SELECT * FROM MVC_ORDER_TBL o JOIN mvc_product_tbl p ON o.pdNo = p.pdNo WHERE state LIKE '%요청' ORDER BY orderdate ASC;

-----------[주문 테이블 생성]----------
  DROP TABLE mvc_order_tbl CASCADE CONSTRAINTS;
CREATE Table mvc_order_tbl(
        id  VARCHAR2(20)	REFERENCES  mvc_customer(id),			--아이디			
        orderNo NUMBER 		PRIMARY KEY,							--주문번호
        pdNo NUMBER 		REFERENCES  mvc_product_tbl(pdNo),		--상품번호
        cartNo NUMBER ,												--카트번호
        orderdate DATE 		DEFAULT SYSDATE,						--주문날짜
        state  VARCHAR2(20) DEFAULT '주문요청',						--상태
        orderName                	VARCHAR2(20),        		 	--주문자 이름
        orderaddress             	VARCHAR2(50),         			--주문자 주소
        orderhp                  	VARCHAR2(13),        			--주문자 핸드폰
        orderCnt NUMBER												--주문수량
 );
DELETE FROM mvc_order_tbl;
COMMIT;
------------[결산 뷰 생성]----------------
CREATE OR REPLACE VIEW view_account -- 30일, 60일 매출액
AS
SELECT DISTINCT(SYSDATE) AS 결산일
	   , (SELECT sum(p.PRICE * o.ORDERCNT)
	   	    FROM mvc_order_tbl o
	   	    JOIN mvc_product_tbl p
	   	      ON p.pdNo = o.pdNo
	   	    JOIN mvc_customer c
	   	      ON c.id = o.id
	   	   WHERE o.STATE = '구매확정'
	   	     AND o.orderdate BETWEEN SYSDATE-30 AND SYSDATE) AS 30days	--최근 30일 매출
	   , (SELECT sum(p.PRICE * o.ORDERCNT)
	   	    FROM mvc_order_tbl o
	   	    JOIN mvc_product_tbl p
	   	      ON p.pdNo = o.pdNo
	   	    JOIN mvc_customer c
	   	      ON c.id = o.id   
	   	   WHERE o.STATE = '구매확정'
	   	     AND o.orderdate BETWEEN SYSDATE-60 AND SYSDATE) AS 60days	--최근 60일 매출
  FROM MVC_ORDER_TBL o;

SELECT * FROM view_account;
-----------------------------------------
CREATE OR REPLACE VIEW view_sold --상품별 매출액
AS
	  SELECT p.PDNO, p.pdImg, p.PDNAME, sum(o.ORDERCNT) as totalCnt, sum(p.PRICE * o.ORDERCNT) as totalMoney
	    FROM mvc_product_tbl p 			
	    JOIN mvc_order_tbl o 			
	 	 ON o.pdNo = p.pdNo         	
	    JOIN mvc_customer c 				 
	      ON c.id = o.id 				 
       WHERE o.STATE = '구매확정' 			 
	   GROUP BY p.PDNO , p.PDNAME, p.pdImg;
 
SELECT * FROM view_sold;

---------------------------------------------------------------------	
CREATE OR REPLACE VIEW sold_view --상품별 매출액2
AS
SELECT p.PDNAME, sum(o.ORDERCNT) as totalCnt, sum(p.PRICE * o.ORDERCNT) as totalMoney
	    FROM mvc_product_tbl p 			
	    JOIN mvc_order_tbl o 			
	 	 ON o.pdNo = p.pdNo         	
	    JOIN mvc_customer c 				 
	      ON c.id = o.id 				 
       WHERE o.STATE = '구매확정' 			 
	   GROUP BY  p.PDNAME;
 
	  
SELECT * FROM sold_view;








** 주문 순서 **
 주문 : 주문요청(고객) > 주문승인(관리자) > 구매확정(고객) 
 환불 : 주문요청(고객) > 주문승인(관리자) > 환불요청(고객) > 환불승인(관리자)
  --조건1) 고객의 모든 요청은 관리자의 승인이 필요함. (주문취소제외)
  --조건2) 관리자는 '구매확정'된 것만 결산이 잡힘.
  --      그래서 고객의 요청을 승인처리해야만 결산이 가능. 컨펌리스트에서 승인처리한다.
 주문취소 : 주문요청(고객) > 주문취소(고객) 

				 ** ORDER state **
				 1. 주문요청 <고객>
				 2. 환불요청 <고객>
				 3. 주문승인 <관리자>
				 4. 환불승인 <관리자>
				 5. 구매확정 <고객>
				 6. 주문취소 <고객>


--테이블 생성
DROP TABLE product;
DROP TABLE customer;
DROP TABLE cart;
DROP TABLE orders;
DROP TABLE refund;
DROP TABLE board;

--상품 테이블
CREATE TABLE product(
   p_id number(3),
   p_name varchar2(30) NOT NULL,
   p_quantity number(3),
   p_opendate date DEFAULT sysdate,
   p_price    NUMBER(9),
   CONSTRAINT product_p_id_pk PRIMARY KEY(p_id));
  
--상품 시퀀스, 트리거 생성  
	CREATE SEQUENCE	seq_product
		 START WITH 1
	   INCREMENT BY 1
		   MAXVALUE 999
	 		nocache;  
	 	
 	
	CREATE OR REPLACE TRIGGER seq_product
	BEFORE 
		  INSERT ON product
		  FOR EACH ROW 
	 BEGIN 
	      SELECT seq_product.nextval
	      	INTO :NEW.p_id
	      	FROM dual;
	END;
/
	
  
--고객 테이블  
CREATE TABLE customer(
   cus_id      number(3),   --PK
   cus_name   varchar2(50) NOT NULL,
   cus_address    varchar2(50),
   cus_phone varchar2(30),
   CONSTRAINT customer_cus_id_pk PRIMARY KEY(cus_id));
  
--고객 시퀀스 생성
 
 	CREATE SEQUENCE	seq_customer
		 START WITH 100
	   INCREMENT BY 1
		   MAXVALUE 999
	 		nocache; 
	 	
	 	
	 	
--장바구니 테이블  
CREATE TABLE cart(
	  cart_id NUMBER(3),
	  order_id number(3),
      p_id      number(3) REFERENCES product(p_id),
      cart_quantity  number(3),
      CONSTRAINT cart_cart_id_pk PRIMARY KEY (cart_id),
      CONSTRAINT orders_order_id_fk FOREIGN KEY (order_id) REFERENCES orders(order_id)
               ON DELETE CASCADE);
              
--장바구니 시퀀스, 트리거 생성            
 	CREATE SEQUENCE	seq_cart
		 START WITH 01
	   INCREMENT BY 1
		   MAXVALUE 50
	 		nocache; 
	 	
	 	
	CREATE OR REPLACE TRIGGER seq_cart
	BEFORE 
		  INSERT ON cart
		  FOR EACH ROW 
	 BEGIN 
	      SELECT seq_cart.nextval
	      	INTO :NEW.cart_id
	      	FROM dual;
	END;
/	 	


--주문관리 테이블           
CREATE TABLE orders(
      order_id      	 NUMBER(3),   
      cus_id      		 number(3),
      p_id 				 number(3),
      order_quantity     NUMBER(3),
      order_date   DATE DEFAULT sysdate,
      CONSTRAINT orders_order_id_pk PRIMARY KEY (order_id),
      CONSTRAINT product_p_id_fk FOREIGN KEY (p_id) REFERENCES product(p_id)
               ON DELETE CASCADE,       
      CONSTRAINT customer_cus_id_fk FOREIGN KEY (cus_id) REFERENCES customer(cus_id)
               ON DELETE CASCADE);
              
--주문관리 시퀀스, 트리거 생성
 	CREATE SEQUENCE	seq_orders
		 START WITH 100
	   INCREMENT BY 1
		   MAXVALUE 999
	 		nocache; 
	 	
	 	
	CREATE OR REPLACE TRIGGER seq_orders
	BEFORE 
		  INSERT ON orders
		  FOR EACH ROW 
	 BEGIN 
	      SELECT seq_orders.nextval
	      	INTO :NEW.order_id
	      	FROM dual;
	END;	
/

--환불관리 테이블
CREATE TABLE refund(
	refund_id NUMBER(3) NOT NULL,
	order_id NUMBER(3) REFERENCES orders(order_id),
	refund_date DATE DEFAULT sysdate,
	refund_total number(10) ,
	refund_state varchar2(30),
	CONSTRAINT refund_refund_id_pk PRIMARY KEY (refund_id));



--환불 시퀀스, 트리거 생성
 	CREATE SEQUENCE	seq_refund
		 START WITH 100
	   INCREMENT BY 1
		   MAXVALUE 999
	 		nocache;

	CREATE OR REPLACE TRIGGER seq_refund
	BEFORE 
		  INSERT ON refund
		  FOR EACH ROW 
	 BEGIN 
	      SELECT seq_refund.nextval
	      	INTO :NEW.refund_id
	      	FROM dual;	 
	END;
/



INSERT INTO refund (order_id, refund_date, refund_total, refund_state)
  VALUES (101,'20220802', 120000);
 SELECT * FROM REFUND;
/*
 100 101 2022-08-02 120,000
*/

--리뷰게시판 테이블
CREATE TABLE board
(
	board_id NUMBER(3)NOT NULL,
	cus_id number (3)REFERENCES customer(cus_id),
	review varchar2(50),
	update_date DATE DEFAULT sysdate,
	CONSTRAINT board_board_id_pk PRIMARY KEY (board_id));

--리뷰 시퀀스, 트리거 생성
	CREATE SEQUENCE seq_board
		 START WITH 1
	   INCREMENT BY 1
		   MAXVALUE 999
	 		nocache;

	CREATE OR REPLACE TRIGGER seq_board
	BEFORE 
		  INSERT ON board
		  FOR EACH ROW 
	 BEGIN 
	      SELECT seq_board.nextval
	      	INTO :NEW.board_id
	      	FROM dual;	 
	END;
/


INSERT INTO board (cus_id, review, update_date)
  VALUES (100, '너무 예뻐요 감사합니다~', default);	 	
	 	
INSERT INTO board (cus_id, review, update_date)
  VALUES (102,'조금 시들어서 왔어요', default); 	 


SELECT * FROM BOARD;
/*
1	100	너무 예뻐요 감사합니다~	2022-08-02 
2	102	조금 시들어서 왔어요		2022-08-02 
 */

--회원추가
 
INSERT INTO customer (cus_id, cus_name, cus_address, cus_phone)
  VALUES (100, '김연아', '서울시 강남구', '02-1111-3122');
 
INSERT INTO customer (cus_id, cus_name, cus_address, cus_phone)
  VALUES (101, '홍길동', '서울시 금천구', '02-2236-4813');
 
INSERT INTO customer (cus_id, cus_name, cus_address, cus_phone)
  VALUES (102,'유재석', '서울시 가산동', '02-111-2354'); 
 
INSERT INTO customer (cus_id, cus_name, cus_address, cus_phone)
  VALUES (103, '제니', '서울시 송파구', '02-4322-3122');
 
INSERT INTO customer (cus_id, cus_name, cus_address, cus_phone)
  VALUES (104,  '지수', '서울시 송파구', '02-4536-4823');
 
SELECT * FROM CUSTOMER; 

/*
100	김연아	서울시 강남구	02-1111-3122
101	홍길동	서울시 금천구	02-2236-4813
102	유재석	서울시 가산동	02-111-2354
103	제니		서울시 송파구	02-4322-3122
104	지수		서울시 송파구	02-4536-4823
 */
 
 
 
--상품 추가
INSERT INTO product (p_name, p_quantity, p_opendate,p_price)
  VALUES ('수국',50,'20220801', 10000);

INSERT INTO product (p_name, p_quantity, p_opendate,p_price)
  VALUES ('개나리',40,'20220802', 12000);
  
 INSERT INTO product (p_name, p_quantity, p_opendate,p_price)
  VALUES ('백합',30,'20220803', 13000);
  
 INSERT INTO product (p_name, p_quantity, p_opendate,p_price)
  VALUES ('장미',60,'20220804', 10000);
  
 INSERT INTO product (p_name, p_quantity, p_opendate,p_price)
  VALUES ('수국',60,'20220805', 10000);

INSERT INTO product (p_name, p_quantity, p_opendate,p_price)
  VALUES ('라일락',20,'20220806', 10000);

 INSERT INTO product (p_name, p_quantity, p_opendate,p_price)
  VALUES ('코스모스',35,'20220807',20000);
 
SELECT * FROM product;    
/*
1	수국		50	2022-08-01 	10000
2	개나리	40	2022-08-02 	12000
3	백합		30	2022-08-03 	13000
4	장미		60	2022-08-04 	10000
5	수국		60	2022-08-05 	10000
6	라일락	20	2022-08-06 	10000
7	코스모스	35	2022-08-07 	20000
*/
--장바구니 상품 추가

INSERT INTO cart (order_id, p_id, cart_quantity )
  VALUES (100, 1, 20);
 
INSERT INTO cart (order_id, p_id, cart_quantity )
  VALUES (101, 2, 10);

INSERT INTO cart (order_id, p_id, cart_quantity )
  VALUES (102, 3, 5);
 
INSERT INTO cart (order_id, p_id, cart_quantity )
  VALUES (103, 4, 15);
 
INSERT INTO cart (order_id, p_id, cart_quantity )
  VALUES (104, 5, 30);
 
INSERT INTO cart (order_id, p_id, cart_quantity )
  VALUES (105, 6, 10);
 
INSERT INTO cart (order_id, p_id, cart_quantity )
  VALUES (106, 7, 12);

SELECT * FROM cart;
/*
1	100	1	20
2	101	2	10
3	102	3	5
4	103	4	15
5	104	5	30
6	105	6	10
7	106	7	12
 */   


--주문 추가
INSERT INTO orders (CUS_ID, p_id, ORDER_QUANTITY, ORDER_DATE)
  VALUES(103,1,10,TO_DATE('2022-08-05', 'yyyy-mm-dd'));

INSERT INTO orders (CUS_ID, p_id, ORDER_QUANTITY, ORDER_DATE)
  VALUES(100,2,5,TO_DATE('2022-08-02', 'yyyy-mm-dd')); 
 
INSERT INTO orders (CUS_ID, p_id, ORDER_QUANTITY, ORDER_DATE)
  VALUES(104,3,20,TO_DATE('2022-08-04', 'yyyy-mm-dd'));
 
INSERT INTO orders (CUS_ID, p_id, ORDER_QUANTITY, ORDER_DATE)
  VALUES(101,4,5,TO_DATE('2022-08-08', 'yyyy-mm-dd'));

INSERT INTO orders (CUS_ID, p_id, ORDER_QUANTITY, ORDER_DATE)
  VALUES(103,5,10,TO_DATE('2022-08-07', 'yyyy-mm-dd'));
 
INSERT INTO orders (CUS_ID, p_id, ORDER_QUANTITY, ORDER_DATE)
  VALUES(104,6,40,TO_DATE('2022-08-07', 'yyyy-mm-dd'));

INSERT INTO orders (CUS_ID, p_id, ORDER_QUANTITY, ORDER_DATE)
  VALUES(101,7,20,TO_DATE('2022-08-06', 'yyyy-mm-dd')); 


SELECT * FROM orders;
/*
100	103	1	10	2022-08-05 
101	100	2	5	2022-08-02 
102	104	3	20	2022-08-04 
103	101	4	5	2022-08-08 
104	103	5	10	2022-08-07 
105	104	6	40	2022-08-07 
106	101	7	20	2022-08-06 
*/

--


create or replace view v_orders
as
select 
  from PRODUCT p 
     , ORDERS o 
 where  
--View V_EMP_DEPT이(가) 생성되었습니다.

--view조회
select * from v_custOrder;



 

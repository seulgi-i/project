
drop table Book;
drop table Customer;
drop table Orders;

CREATE TABLE Book(
  bookid    NUMBER(2) PRIMARY KEY,
  bookname  VARCHAR2(40),
  publisher VARCHAR2(40),
  price     NUMBER(8)
);
 
-- 고객
DROP TABLE Customer;
CREATE TABLE Customer(
  custid  NUMBER(2) PRIMARY KEY,
  name    VARCHAR2(40),
  address  VARCHAR2(50),
  phone    VARCHAR2(20)
);
-- 주문
DROP TABLE 
CREATE TABLE Orders(
  orderid NUMBER(2) PRIMARY KEY,
  custid  NUMBER(2) REFERENCES Customer(custid),
  bookid  NUMBER(2) REFERENCES Book(bookid),
  saleprice NUMBER(8),
  orderdate DATE
);

CREATE TABLE Imported_Book (
  bookid    NUMBER,
  bookname  VARCHAR2(40),
  publisher VARCHAR2(40),
  price     NUMBER(8)
);


-- INSERT INTO 테이블명(컬럼1, 컬럼2,...컬럼n)
-- VALUES(val1, val2..valn);
/* Book, Customer, Orders 데이터 생성 */
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (2, '축구아는 여자', '나무수', 13000);  
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (3, '축구의 이해', '대한미디어', 22000);    
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (4, '골프바이블', '대한미디어', 35000); 
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (5, '피겨교본', '굿스포츠', 8000); 
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (6, '역도 단계별기술', '굿스포츠', 6000); 
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (7, '야구의 추억', '이상미디어', 20000);   
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (8, '야구를 부탁해', '이상미디어', 13000); 
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (9, '올림픽 이야기', '삼성당', 7500); 
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (10, 'Olympic Champions', 'Person', 13000);   

  
INSERT INTO Customer (custid, name, address, phone)
  VALUES(1, '박지성', '영국 멘체스터', '000-5000-0001');  
INSERT INTO Customer (custid, name, address, phone)
  VALUES(2, '김연아', '대한민국 서울', '000-6000-0001');
INSERT INTO Customer (custid, name, address, phone)
  VALUES(3, '장미란', '대한민국 강원도', '000-7000-0001');  
INSERT INTO Customer (custid, name, address, phone)
  VALUES(4, '추신수', '미국 클리브랜드', '000-8000-0001');
INSERT INTO Customer (custid, name, address, phone)
  VALUES(5, '박세리', '대한민국 대전', NULL);  
  
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(1,1,1,6000,TO_DATE('2014-07-01', 'yyyy-mm-dd'));
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(2,1,3,21000,TO_DATE('2014-07-03', 'yyyy-mm-dd'));  
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(3,2,5,8000,TO_DATE('2014-07-03', 'yyyy-mm-dd'));
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(4,3,6,6000,TO_DATE('2014-07-04', 'yyyy-mm-dd'));
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(5,4,7,20000,TO_DATE('2014-07-05', 'yyyy-mm-dd'));
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(6,1,2,12000,TO_DATE('2014-07-07', 'yyyy-mm-dd'));
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(7,4,8,13000,TO_DATE('2014-07-07', 'yyyy-mm-dd'));
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(8,3,10,12000,TO_DATE('2014-07-08', 'yyyy-mm-dd'));
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(9,2,10,7000,TO_DATE('2014-07-09', 'yyyy-mm-dd'));
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(10,3,8,13000,TO_DATE('2014-07-10', 'yyyy-mm-dd'));  

INSERT INTO Imported_Book VALUES(21, 'Zen Golf', 'Person', 12000);
INSERT INTO Imported_Book VALUES(22, 'Soccer Skills', 'Human Kinetics', 15000);
commit;  

SELECT *
  FROM Book;

SELECT *
  FROM Customer;

SELECT *
  FROM ORDERS;  

SELECT *
  FROM Imported_Book;  
 


--02. SQL 개요
--예) 김연아 고객의 전화번호를 찾으시오.
SELECT PHONE 
  FROM CUSTOMER
 WHERE NAME = '김연아';
--3.1.1 SELECT/FROM
--3-1 모든 도서의 이름과 가격을 검색하시오.
SELECT BOOKNAME 
  	 , PRICE 
  FROM BOOK;
 
--(3-1 변형) 모든 도서의 가격과 이름을 검색하시오.
SELECT PRICE 
	 , BOOKNAME
  FROM BOOK;
--3-2 모든 도서의 도서번호, 도서이름,출판사,가격을 검색하시오.
SELECT BOOKID
	 , BOOKNAME 
	 , PUBLISHER 
	 , PRICE 
  FROM BOOK;
--3-3 도서 테이블에 있는 모든 출판사를 검색하시오.
SELECT PUBLISHER 
  FROM BOOK;
--3.1.2 WHERE 조건

--3-4 가격이 20,000원 미만인 도서를 검색하시오.
SELECT BOOKNAME  
  FROM BOOK  
 WHERE PRICE < 20000;
--3-5 가격이 10,000원 이상 20,000 이하인 도서를 검색하시오.
SELECT BOOKNAME  
  FROM BOOK  
 WHERE PRICE >= 10000
   AND PRICE <= 20000;
--3-6 출판사가 '굿스포츠'혹은 '대한미디어'인 도서를 검색하시오.
SELECT BOOKNAME  
  FROM BOOK  
 WHERE PUBLISHER IN ('굿스포츠','대한미디어');
--3-7 '축구의 역사'를 출간한 출판사를 검색하시오.
SELECT PUBLISHER  
  FROM BOOK  
 WHERE BOOKNAME = '축구의 역사';
--3-8 도서이름에 '축구'가 포함한 출판사를 검색하시오.
SELECT PUBLISHER  
  FROM BOOK  
 WHERE BOOKNAME LIKE '%축구%';
--3-9 도서이름의 왼쪽 두 번째 위치에 '구'라는 문자열을 갖는 도서를 검색하시오.
SELECT BOOKNAME  
  FROM BOOK  
 WHERE BOOKNAME LIKE '_구%';
--3-10 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 검색하시오.
SELECT BOOKNAME  
  FROM BOOK  
 WHERE BOOKNAME LIKE '%축구%'
   AND PRICE >= 20000;
--3-11 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색하시오.
SELECT BOOKNAME  
  FROM BOOK  
 WHERE PUBLISHER IN ('굿스포츠','대한미디어');
--3-12 도서를 이름순으로 검색하시오
SELECT BOOKNAME  
  FROM BOOK  
ORDER BY BOOKNAME;
--3-13 도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색하시오
SELECT BOOKNAME 
	 , PRICE 
  FROM BOOK  
ORDER BY PRICE, BOOKNAME;
--3-14 도서를 가격의 내림차순으로 검색하시오. 만약 가격이 같다면 출판사의 오름차순으로 검색한다.
SELECT PUBLISHER 
	 , PRICE 
  FROM BOOK  
ORDER BY PRICE DESC, PUBLISHER;
--3-15 고객이 주문한 도서의 총 판매액을 구하시오.
SELECT SUM(SALEPRICE)
  FROM ORDERS;
--3-16 2번 김연아 고객이 주문한 도서의 총 판매액을 구하시오.
SELECT SUM(O.SALEPRICE)
  FROM ORDERS o 
  	 , CUSTOMER c
 WHERE c.NAME ='김연아';
  
--3-17 고객이 주문한 도서의 총판매액, 평균값, 최저가, 최고가를 구하시오
SELECT SUM(O.SALEPRICE)
	 , avg(o.SALEPRICE)
	 , min(o.SALEPRICE)
	 , max(o.SALEPRICE)
  FROM ORDERS o;
--3-18 마당서점의 도서 판매 건수를 구하시오.
SELECT COUNT(BOOKID)
  FROM ORDERS o;
--3.2.2 GROUP BY
--3-19 고객별로 주문한 도서의 총 수량과 총 판매액을 구하시오.
SELECT o.ORDERID
	 , count(o.BOOKID)
	 , sum(SALEPRICE)	   
  FROM ORDERS o 
 GROUP BY CUSTID, ORDERid;
--3-20 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오. 단, 두권 이상 구매한 고객만 구한다.
SELECT CUSTID 
	 , count(*) 
  FROM ORDERS o 
 WHERE SALEPRICE >= 8000
 HAVING count(*)>=2
 GROUP BY CUSTID;
--3-21 고객과 고객의 주문에 관한 데이터를 모두 보이시오.
SELECT c2.*
	 , o.*
 FROM CUSTOMER c2 
 JOIN ORDERS o 
   ON c2.CUSTID = o.CUSTID;
--3-22 고객과 고객의 주문에 관한 데이터를 고객번호 순으로 정렬하여 보이시오.
SELECT c2.*
	 , o.*
 FROM CUSTOMER c2 
 JOIN ORDERS o 
   ON c2.CUSTID = o.CUSTID
ORDER BY c2.CUSTID;
--3-23 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오.
SELECT c2.NAME 
	 , o.SALEPRICE 
 FROM CUSTOMER c2 
 JOIN ORDERS o 
   ON c2.CUSTID = o.CUSTID;
--3-24 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하시오.
SELECT c2.name
	 , o.SALEPRICE
 FROM CUSTOMER c2 
 JOIN ORDERS o 
   ON c2.CUSTID = o.CUSTID
ORDER BY c2.CUSTID;
--3-25 고객의 이름과 고객이 주문한 도서의 이름을 구하시오.
SELECT c2.name
	 , b.BOOKNAME 
 FROM CUSTOMER c2 
 JOIN ORDERS o 
   ON c2.CUSTID = o.CUSTID
 JOIN BOOK b 
   ON o.BOOKID = b.BOOKID;
--3-26 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하시오.
SELECT c.NAME 
	 , b.BOOKNAME 
 FROM CUSTOMER c
 	, ORDERS o 
 	, BOOK b 
WHERE c.CUSTID  = o.custid
  AND o.BOOKID = b.BOOKID 
  AND b.PRICE = 20000;
--3-27 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하시오.
SELECT c.NAME 
	 , o.SALEPRICE 
 FROM CUSTOMER c LEFT OUTER JOIN 
 	  ORDERS o ON c.CUSTID = o.CUSTID;
--3.3.2 부속질의
--3-28 가장 비싼 도서의 이름을 보이시오.
SELECT BOOKNAME 
  FROM BOOK 
 WHERE PRICE =(SELECT max(PRICE)
			     FROM BOOK);

--3-29 도서를 구매한 적이 있는 고객의 이름을 검색하시오.
SELECT c.NAME
  FROM CUSTOMER c
 WHERE c.CUSTID IN (SELECT c.CUSTID
 				   FROM ORDERS);
--3-30 대한미디어에서 출판한 도서를 구매한 고객의 이름을 보이시오.
SELECT NAME
  FROM CUSTOMER 
 WHERE CUSTID IN (SELECT CUSTID 
 				   FROM ORDERS
 				   WHERE BOOKID  IN (SELECT BOOKID 
 				   					     FROM BOOK 
 				   					    WHERE PUBLISHER = '대한미디어'));
--3-31 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오.
SELECT b.BOOKNAME 
  FROM BOOK b 
  WHERE b.PRICE > (SELECT avg(b2.PRICE)
  					FROM  BOOK b2
  					WHERE b2.PUBLISHER = b.PUBLISHER);
--3-32 도서를 주문하지 않은 고객의 이름을 보이시오.
SELECT c.NAME 
  FROM CUSTOMER c
  MINUS
 SELECT c.NAME 
  FROM CUSTOMER c
  WHERE c.CUSTID IN (SELECT CUSTID
  					   FROM orders);
--3-33 주문이 있는 고객의 이름과 주소를 보이시오.
SELECT c.NAME
	 , c.ADDRESS 
  FROM CUSTOMER c
  WHERE c.CUSTID IN (SELECT CUSTID
  					   FROM orders);
--4.1 CREATE 문
--3-34 다음과 같은 속성을 가진 NewBook 테이블을 생성하시오. 정수형은 NUMBER를, 문자형은 가변형 문자타입인 VARCHAR2를 사용한다.
--  bookid	NUMBER,
--bookname  VARCHAR2(20),
--publisher  VARCHAR2(20),
--price      NUMBER);
CREATE TABLE NewBook (
bookid		NUMBER,
bookname 	VARCHAR2(20),
publisher  	VARCHAR2(20),
price      	NUMBER);


--3-35 다음과 같은 속성을 가진 NewCustomer 테이블을 생성하시오.
--custid(고객번호) NUMBER, 기본키
--name(이름)-VARCHAR2(40)
--address(주소)-VARCHAR2(40)
--phone(전화번호)-VARCHAR2(30)

CREATE TABLE NewCustomer(
custid 	NUMBER PRIMARY KEY,
name 	VARCHAR2(40),
address VARCHAR2(40),
phone 	VARCHAR2(30));


--3-36 다음과 같은 속성을 가진 NewOrders 테이블을 생성하시오.
--orderid(주문번호)- NUMBER, 기본키
--custid(고객번호)- NUMBER, NOT NULL 제약조건, 외래키(NewCustomer.custid, 인쇄삭제)
--bookid(도서번호)- NUMBER, NOT NULL 제약조건
--saleprice(판매가격)-NUMBER
--orderdate(판매일자)-DATE
CREATE TABLE NewOrders(
orderid 	NUMBER PRIMARY key,
custid 		NUMBER NOT NULL,
bookid 		NUMBER NOT NULL,
saleprice 	NUMBER,
orderdate 	DATE,
FOREIGN KEY (custid) REFERENCES NewCustomer(custid) ON DELETE CASCADE);


--4.2 ALTER문
--3-37 NewBook 테이블에 VARCHAR2(13)의 자료형을 가진 isbn 속성을 추가하시오.
ALTER TABLE NewBook
 ADD isbn VARCHAR2(13);

--3-38 NewBook 테이블의 isbn 속성의 데이터 타입을 NUMBER형으로 변경하시오.
ALTER TABLE NewBook
 MODIFY isbn NUMBER;
--3-39 NewBook 테이블의 isbn 속성을 삭제하시오.
ALTER TABLE NewBook
 DROP COLUMN isbn;
--3-40 NewBook 테이블의 bookid 속성에 NOT NULL 제약조건을 적용하시오.
ALTER TABLE NewBook
 MODIFY BOOKID NUMBER NOT NULL;
--3-41 NewBook 테이블의 bookid 속성을 기본키로 변경하시오.
ALTER TABLE NewBook
 ADD PRIMARY KEY(bookid);
--4.3 DROP 문
--3-42 NewBook 테이블을 삭제하시오.
DROP TABLE newBook;
--3-43 NewCustomer 테이블을 삭제하시오. 만약 삭제가 거절된다면 원인을 파악하고 관련된 테이블을 같이 삭제하시오(NewOrders 테이블이 NewCustomer를 참조하고 있음).
DROP TABLE NewOrders;
DROP TABLE NewCustomer;


*/
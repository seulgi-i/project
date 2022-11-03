
--5.1 INSERT 문
--3-44 Book 테이블에 새로운 도서 '스포츠 의학'을 삽입하시오. 스포츠 의학은 한솔의학서적에서 출간했으며 가격은 90,000원이다.
SELECT * FROM CUSTOMER;
INSERT INTO BOOK (BOOKID, BOOKNAME, PUBLISHER,PRICE)
VALUES (11,'스포츠 의학', '한솔의학서적',9000);

--3-45 Book 테이블에 새로운 도서 '스포츠 의학'을 삽입하시오. 스포츠 의학은 한솔의학서적에서 출간했으며 가격은 미정이다.
INSERT INTO BOOK (BOOKID, BOOKNAME, PUBLISHER,PRICE)
VALUES (11,'스포츠 의학', '한솔의학서적',9000);
--3-46 수입도서 목록(Imported_book)을 Book 테이블에 모두 삽입하시오.
--     (Imported_book 테이블은 스크립트 Book 테이블과 같이 이미 만들어져 있음)
INSERT INTO BOOK(BOOKID, BOOKNAME, PUBLISHER,PRICE)
SELECT BOOKID
	 , BOOKNAME
	 , PUBLISHER
	 , PRICE
FROM   IMPORTED_BOOK;
--3-47 Customer 테이블에 고객번호가 5인 고객의 주소를 '대한민국 부산'으로 변경하시오.
UPDATE CUSTOMER 
   SET ADDRESS = '대한민국 부산'
 WHERE CUSTID = 5;
--3-48 Customer 테이블에서 박세리 고개의 주소를 김연아 고객의 주소로 변경하시오.
UPDATE CUSTOMER 
   SET ADDRESS = (SELECT ADDRESS 
   				    FROM CUSTOMER
   				   WHERE NAME = '김연아')
 WHERE NAME = '박세리';
--3-49 Customer 테이블에서 고객번호가 5인 고객을 삭제하시오.
DELETE  FROM CUSTOMER 
 WHERE CUSTID = 5;
--3-50 모든 고객을 삭제하시오.
drop INDEX MADANG_CUSTID;
--1.1.1 수학함수
--4-1 -78과 +78의 절댓값을 구하시오.
SELECT abs(-78),abs(78)
  FROM dual;
--4-2 4.875를 소수 첫째 자리까지 반올림한 값을 구하시오.
SELECT round(4.875,0)
  FROM dual;
--4-3 고객별 평균 주문 금액을 백 원 단위로 반올림한 값을 구하시오.
SELECT round(avg(o.SALEPRICE),-3)
  FROM ORDERS o ;
--4-4 도서제목에 야구가 포함된 도서를 농구로 변경한 후 도서 목록을 보이시오.
SELECT b.BOOKID , replace(b.BOOKNAME, '야구', '농구'),b.PUBLISHER , b.PRICE 
  FROM BOOK b ;
--4-5 굿스포츠에서 출판한 도서의 제목과 제목의 글자 수를 확인하시오.
--    (한글은 2바이트 혹은 UNICODE 경우는 3바이트를 차지함)
SELECT b.BOOKNAME 
	 , LENGTH (b.BOOKNAME)AS "글자 수"
	 , LENGTHB(b.BOOKNAME)AS "바이트 수" 
  FROM BOOK b 
 WHERE b.PUBLISHER = '굿스포츠';
--4-6 마당서점의 고객 중에서 같은 성을 가진 사람이 몇 명이나 되는지 성별 인원수를 구하시오.
SELECT substr(c.NAME,1,1)
	 , count(*)
  FROM CUSTOMER c
GROUP BY substr(c.NAME,1,1);
 
--1.1.3 날짜함수
--4-7 마당서점은 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 구하시오.
SELECT o.ORDERID 
	 , o.ORDERDATE 
	 , o.ORDERDATE+10
  FROM ORDERS o ;
--4-8 마당서점이 2014년 7월 7일에 주문받은 도서의 주문번호, 주문일, 고객번호, 도서번호를 모두 보이시오. 
--    단 주문일은 'yyyy-mm-dd 요일' 형태로 표시한다.
SELECT o.ORDERID 
	 , TO_CHAR(o.ORDERDATE,'yyyy-mm-dd(DY)')
	 , o.CUSTID 
	 , o.BOOKID 
  FROM ORDERS o 
 WHERE o.ORDERDATE = '20140707';
--4-9 DBMS 서버에 설정된 현재 시간과 오늘 날짜를 확인하시오.
SELECT to_char(SYSDATE,'yyyy-mm-dd(dy) hh24:mm:ss') 
 FROM dual;
--4-10 이름, 전화번호가 포함된 고객목록을 보이시오. 단, 전화번호가 없는 고객은 '연락처없음'으로 표시한다.
SELECT c.NAME
	 , nvl(c.PHONE,'연락처없음')
  FROM CUSTOMER c;
--4-11 고객 목록에서 고객번호, 이름, 전화번호를 앞의 두 명만 보이시오.
SELECT CUSTID , NAME , PHONE 
  FROM CUSTOMER
 WHERE rownum <= 2;
--4-12 마당서점의 고객별 판매액을 보이시오(결과는 고객이름과 고객별 판매액을 출력).
SELECT CUSTID, (SELECT name
				FROM CUSTOMER c2 
			    WHERE c2.CUSTID = o.CUSTID), sum(SALEPRICE)
  FROM ORDERS o 
GROUP BY CUSTID;

--4-13 Orders 테이블에 각 주문에 맞는 도서이름을 입력하시오.

ALTER TABLE ORDERS ADD bookname varchar2(40);

	UPDATE ORDERS
	   SET bookname = (SELECT BOOKNAME
	   					 FROM BOOK
	   					WHERE ORDERS.bookid = BOOK.BOOKID);
   					

--4-14 고객번호가 2이하인 고객의 판매액을 보이시오 (결과는 고객이름과 고객별 판매액 출력)
SELECT CUSTID, (SELECT name
				FROM CUSTOMER c2 
			    WHERE c2.CUSTID = o.CUSTID), sum(SALEPRICE)
  FROM ORDERS o 
 WHERE CUSTID <= 2
GROUP BY CUSTID;
--2.3 중첩질의 - WHERE 부속질의
--4-15 평균 주문금액 이하의 주문에 대해서 주문번호와 금액을 보이시오.
SELECT o.ORDERID 
	 , o.SALEPRICE 
  FROM ORDERS o 
 WHERE o.SALEPRICE <= ( SELECT avg(o.SALEPRICE)
					 	  FROM ORDERS o);
--4-16 각 고객의 평균 주문금액보다 큰 금액의 주문 내역에 대해서 주문번호, 고객번호, 금액을 보이시오.
SELECT o.ORDERID 
	 , c.CUSTID 
	 , o.SALEPRICE 
  FROM CUSTOMER c 
  	 , ORDERS o
 WHERE o.SALEPRICE > ( SELECT avg(o.SALEPRICE)
					 	 FROM ORDERS o);
--4-17 대한민국에 거주하는 고객에게 판매한 도서의 총판매액을 구하시오.
SELECT sum(o.SALEPRICE)
  FROM ORDERS o
 WHERE o.ORDERID in (SELECT c.CUSTID  
				   FROM CUSTOMER c
				  WHERE c.ADDRESS like '%대한민국%');
--4-18 3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액을 보이시오.
SELECT o.ORDERID 
	 , o.SALEPRICE 
  FROM ORDERS o  
 WHERE o.SALEPRICE > ALL(SELECT MAX(o.SALEPRICE)
 				      FROM ORDERS o  
 				     WHERE o.ORDERID=3) --8,000
ORDER BY o.SALEPRICE ASC;
--4-19 EXISTS 연산자로 대한민국에 거주하는 고객에게 판매한 도서의 총 판매액을 구하시오.
SELECT sum(o.SALEPRICE)
  FROM ORDERS o 
 WHERE EXISTS ((SELECT c.CUSTID  
				 FROM CUSTOMER c
			    WHERE c.ADDRESS like '%대한민국%');
--4-20 주소에 '대한민국'을 포함하는 고객들로 구성된 뷰를 만들고 조회하시오. 단, 뷰의 이름은 ww_Customer로 한다.
CREATE VIEW ww_Customer
AS SELECT c.*
  from CUSTOMER c
 WHERE c.ADDRESS LIKE '%대한민국%';

SELECT * FROM ww_Customer;
     
--4-21 Orders 테이블에 고객이름과 도서이름을 바로 확일할 수 있는 뷰를 생성한 후, '김연아' 고객이 구입한 도서의 주문번호, 도서이름, 주문액을 보이시오
DROP TABLE orders_view;
CREATE VIEW Orders_view
AS
SELECT o.ORDERID 
	 , o.BOOKID 
	 , o.SALEPRICE 
	 , c.NAME 
  FROM ORDERS o 
  	 , CUSTOMER c 
 WHERE c.CUSTID = o.CUSTID;

SELECT * FROM orders_view;

SELECT ov.*
 FROM ORDERS_VIEW ov 
WHERE NAME = '김연아';

--4-22 [질의 4-20]에서 생성한 뷰 vw_Customer는 주소가 대한민국인 고객을 보여준다.
--     이 뷰를 영국을 주소로 가진 고객으로 변경하시오. phone속성은 필요 없으므로 포함시키지 마시오.
CREATE OR REPLACE VIEW ww_Customer(custid, name, address)
AS
select c.CUSTID, c.NAME , c.ADDRESS 
  from CUSTOMER c 
 WHERE c.ADDRESS LIKE '%영국%';
SELECT * FROM ww_customer;
 
--4-23 앞서 생성한 뷰 vw_Customer를 삭제하시오.
DROP view ww_customer;

--4-24 Book 테이블의 bookname 열을 대상으로 비 클러스터 인덱스 ix_Book을 생성하라.비고유인덱스
create index ix_Book
          on book(bookname);
         
SELECT * FROM user_IND_columns
WHERE TABLE_name IN ('IX_BOOK');
--4-25 Book 테이블의 publisher, price 열을 대상으로 인덱스 ix_Book2를 생성하시오.
create index ix_Book2
          on book(publisher, price);
--4-26 인덱스 ix_Book을 재생성하시오.
ALTER INDEX ix_Book REBUILD;
--4-27 인덱스 ix_Book을 삭제하시오.
DROP INDEX ix_Book;

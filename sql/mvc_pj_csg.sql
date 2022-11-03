--jsp_pj_117

DROP TABLE mvc_customer CASCADE  CONSTRAINTS;
CREATE TABLE mvc_customer(
    id                  varchar2(20) PRIMARY KEY,     --id
    password            VARCHAR2(20) NOT NULL,        --비밀번호
    name                VARCHAR2(20) NOT NULL,        --이름
    birthday            DATE         NOT NULL,        --생년원일
    address             VARCHAR2(50) NOT NULL,        --주소
    hp                  VARCHAR2(13),                 --핸드폰
    email               VARCHAR2(50) NOT NULL,        --이메일
    regDate             TIMESTAMP DEFAULT sysdate     --가입일
    );
    
--회원가입
Insert into mvc_customer(id, password, name, birthday, address, hp, email, regDate)
 values ('hong' ,'1234', '홍길동', '1994/02/16', '서울시 금천구','010-1111-2222','hong@naver.com', sysdate);
delete table mvc_customer_tbl;

SELECT *  FROM mvc_product_tbl;

SELECT *  FROM mvc_customer_cart;

--admin 회원가입 후 권한 변경
UPDATE mvc_customer_tbl
  SET authority='ROLE_ADMIN'
 WHERE id='admin'; 
COMMIT;
--이메일 인증을 해서 enable=1이 된 후 관리자 작업
                    
                    
                    WHERE rn BETWEEN ? AND ?

   		SELECT * 
   			FROM (SELECT A.*, rownum as rn 
			             	 FROM(SELECT* FROM mvc_product_tbl 
			             				 ORDER BY pdNo DESC 
			               	) A   
			            ) 
              WHERE rn >=1
                   AND rn<=2;
                   
 select * from mvc_customer;
 

 delete from mvc_customer_tbl;
 
 --로그인
 select * from mvc_customer_tbl;
 
    where id = 'kim'
    and password ='1234';
    
    
-- 회원상세 페이지
 select * from mvc_customer_tbl
    where id = '12345';
  delete from  mvc_board_tbl;
  
--게시판 테이블 생성
DROP TAbLE mvc_board_tbl CASCADE constraints;
CREATE TABLE mvc_board_tbl(
num     NUMBER(7) PRIMARY KEY,   --글번호
title      VARCHAR2(50) NOT NULL,   --글제목
content CLOB NOT NULL,               --글내용
writer    VARCHAR2(20) NOT NULL,  --작성자
password VARCHAR2(20) NOT NULL,  --수정, 삭제용 비밀번호
readCnt    NUMBER(6)    DEFAULT 0,      --조회수
regDate    DATE DEFAULT sysdate      --가입일
);
COMMIT;
DESC mvc_board_tbl;
SELECT * FROM mvc_board_tbl;
--CLOB : 대용량 텍스트 자료형
--BLOB : 대용량 바이너리 자료형


--게시글 목록 조회
SELECT *
    FROM (SELECT A.*, rownum as rn
        FROM(SELEcT * FROM  mvc_board_tbl
                  order by num DESC
                 ) A     
             )
             WHERE rn BETWEEN 26 AND 30;
    
--게시글 목록 조회 + 게시글 댓글갯수 구하기
SELECT *
    FROM (SELECT A.*, rownum as rn
        FROM (SELECT num, title, content, writer, password, readCnt, regDate,
                        (SELECT COUNT(*) FROM mvc_board_comment_tbl 
                         WHERE board_num = b.num) comment_count                      
                         FROM  mvc_board_tbl b
                         WHERE show='y'
                         order by num DESC
                 ) A     
             )
             WHERE rn BETWEEN 1 AND 10;
        
---------------------------------------------------------------------------------
--게시글 목록 테스트 데이터
DECLARE
     i number := 1; --변수 i에 1을 대입     
BEGIN
    while i <= 991 loop
        INSERT INTO mvc_board_tbl(num, title, content, writer, password, readCnt, regDate)
        VALUES(i, '제목'||i, '글내용'||i, '작성자'||i, '1234', 0, sysdate);
        i := i+1;
    end loop;
END;
/
--PL/SQL 프로시저가 성공적으로 완료되었습니다.
 CommIt;  --커밋안하면 화면 조회 안됨
    Select Count (*) From mvc_board_tbl;
---------------------------------------------------------------------------------
delete from mvc_board_tbl;
--게시글 작성
    Insert into mvc_board_tbl(num, title, content, writer, password, readCnt, regDate)
        values(1, '첫번째 게시글', '드디어 게시판 작성 시작', '테스터', '1234', 0, sysdate);
        
     Insert into mvc_board_tbl(num, title, content, writer, password, readCnt, regDate)
        values((SELECT NVL(MAX(num) +1, 1) FROM mvc_board_tbl), '첫번째 게시글', '드디어 게시판 작성 시작', '테스터', '1234', 0, sysdate);     
        
    COMMIT;        
    SELECT NVL(MAX(num) + 1, 1) FROM mvc_board_tbl;
    

-- 게시글 갯수 구하기
SELECT count(*) AS cnt
    FROM mvc_board_tbl;
    
SELECT * 
    FROM mvc_board_tbl   
ORDER BY num DESC;
--댓글


-- 조회수 증가

UPDATE mvc_board_tbl
    SET readCnt = 0
    WHERE num=30;
    
 Select * from mvc_board_tbl;
 commit;
------[게시판 댓글 테이블 ]--------------------------------------------------------------------------------------------
--Foreign key(외래키)  REFERENCES 부모테이블(pk)	
DROP TABLE mvc_board_comment_tbl CASCADE CONSTRAINTS;
CREATE TABLE  mvc_board_comment_tbl (
	comment_num number(7) PRIMARY KEY,
	board_num number(7) NOT NULL REFERENCES mvc_board_tbl(num),		
	writer varchar2(50) NOT NULL,	
	content CLOB NOT NULL,
	reg_date DATE DEFAULT sysdate
);


--[댓글 컬럼 추가]
--게시글 목록에 댓글 갯수를 위한 mvc_board_tbl 컬럼 추가 : comment_count
ALTER TABLE mvc_board_tbl ADD comment_count NUMBER(6) DEFAULT 0;
--게시글 목록에 삭제된 게시글을 안보여주기 위한 컬럼 추가 : show
ALTER TABLE mvc_board_tbl ADD show CHAR(1) DEFAULT 'y';

DESC mvc_board_tbl;

--댓글조회
select * from mvc_board_comment_tbl
WHERE  board_num = 991
ORDER BY comment_num ASC;
--------------
--댓글 추가
INSERT INTO mvc_board_comment_tbl(comment_num, board_num, writer, content, reg_date)
 VALUES((SELECT NVL(MAX(COMMENT_NUM) + 1, 1) FROM mvc_board_comment_tbl) , 991, '박명수', '댓글 테스트 1', sysdate);
 
COMMIT;
INSERT INTO mvc_board_comment_tbl(comment_num, board_num, writer, content, reg_date)
     VALUES((SELECT NVL(MAX(COMMENT_NUM) + 1, 1) FROM mvc_board_comment_tbl) , ?, ?, ?, sysdate);   

   
           
commit;

SELECT * FROM mvc_product_tbl;

 
SELECT * 
FROM mvc_customer_cart ; 

DROP TABLE mvc_customer_cart CASCADE CONSTRAINTS;

SELECT * FROM mvc_customer_cart t
join mvc_customer c
on t.id=c.id
where c.id='test';

SELECT * FROM mvc_customer_cart;

update mvc_customer_cart
  set cartCnt  
   JOIN  mvc_product_tbl p
      ON t.pdNo = p.pdNo;
  SELECT * FROM mvc_order_tbl;
SELECT * FROM mvc_customer_cart;
where pdNo=1;
commit;
-----------[상품 테이블 생성]----------
DROP TABLE mvc_product_tbl CASCADE CONSTRAINTS;
CREATE TABLE  mvc_product_tbl (
	pdNo number PRIMARY KEY,
	pdName varchar2(40) NOT NULL Unique,
	pdImg varchar2(100) NOT NULL,	
	category VARCHAR2(50) NOT NULL, 
	brand VARCHAR2(50) NOT NULL, 
    content CLOB,
    price number NOT NULL,
    quantity NUMBER not null,
    status VARCHAR2(20) NOT NULL, 
    indate DATE DEFAULT sysdate
);
INSERT INTO mvc_product_tbl(pdNo, pdName, pdImg, category, brand, content, price, quantity, status, indate) 
            VALUES((SELECT NVL(MAX(pdNo), 1) FROM mvc_product_tbl), , sysdate);
SELECT * FROM mvc_product_tbl;
INSERT INTO mvc_customer_cart(id, pdNo, cartNo, cartCnt)
		VALUES('test', 1, (SELECT NVL(MAX(cartNo) + 1, 1) FROM mvc_customer_cart), 10);
drop table  mvc_customer_cart CASCADE constraints;

CREATE TABLE mvc_customer_cart(
id  varchar2(20)REFERENCES  mvc_customer(id),
pdNo number REFERENCES  mvc_product_tbl(pdNo),
cartNo number PRIMARY KEY,
cartCnt number
);
drop table mvc_order_tbl CASCADE CONSTRAINTS;

CREATE Table mvc_order_tbl (
        id varchar2(20)  REFERENCES mvc_customer (id),      
        orderNo number PRIMARY KEY,
        pdNo number  REFERENCES mvc_product_tbl(pdNo),      
    cartNo number REFERENCES mvc_customer_cart(cartNo)
);
commit;
--카트 수량 수정
SELECT * FROM mvc_customer_cart t
JOIN  mvc_product_tbl p 
ON t.pdNo = p.pdNo 
JOIN mvc_customer c 
ON t.id = c.id
WHERE t.cartNo=1;

-- 페이지+카트목록
SELECT *  FROM 
                    (SELECT A.*, rownum as rn 
                         FROM(SELECT *
                                         FROM mvc_customer_cart t
                                         JOIN  mvc_product_tbl p 
                                         ON t.pdNo = p.pdNo 
                                         JOIN mvc_customer c 
                                         ON t.id = c.id
                                         where t.id='test'
                                      ORDER BY t.pdNo DESC ) A )WHERE rn BETWEEN 1 AND 10;

      


SELECT * FROM mvc_customer_cart t 
JOIN  mvc_product_tbl p 
ON t.pdNo = p.pdNo 
JOIN mvc_customer c 
ON t.id = c.id

"SELECT *  FROM "
                    +"(SELECT A.*, rownum as rn "
                    +" FROM(SELECT * FROM mvc_order_tbl o "
                    + "JOIN  mvc_product_tbl p ON o.pdNo = p.pdNo JOIN mvc_customer_cart t ON t.id = o.id where t.id=? "
                    +" ORDER BY t.pdNo DESC ) A )WHERE rn BETWEEN ? AND ?";


SELECT *  FROM
(SELECT A.*, rownum as rn
FROM(SELECT * FROM mvc_order_tbl o 
                                JOIN  mvc_product_tbl p 
                                ON o.pdNo = p.pdNo 
                                JOIN mvc_customer_cart t 
                                ON p.pdNo = t.pdNo 
                                JOIN mvc_customer c 
                                ON t.id = c.id      
                                where o.id='test'
                                ORDER BY o.pdNo DESC ) A )WHERE rn BETWEEN 1 AND 10;



INSERT INTO mvc_order_tbl (id, orderNo, pdNo, cartNo)
values('test', (SELECT NVL(MAX(orderNo) + 1, 1) FROM mvc_order_tbl), 2, 1);

SELECT * FROM mvc_order_tbl;
JOIN  mvc_product_tbl p
ON o.pdNo = p.pdNo 
JOIN mvc_customer c 
ON o.id = c.id
JOIN mvc_customer_cart t 
ON o.cartNo = t.cartNo
drop table mvc_order_tbl CASCADE CONSTRAINTS;

    INSERT INTO mvc_customer_cart(id, pdNo, cartNo, cartCnt)
    VALUES('test', 1, (SELECT NVL(MAX(cartNo) + 1, 1) FROM mvc_customer_cart), 3);

ALTER TABLE mvc_order_tbl ADD ox CHAR(1) DEFAULT 'o';
commit;
UPDATE mvc_customer_cart SET show ='n', ox='o' WHERE cartNo=2;

delete from mvc_order_tbl;
select * from mvc_order_tbl;
select * from mvc_customer_cart;

where id='test';

SELECT * FROM mvc_order_tbl o 
JOIN  mvc_product_tbl p 
ON o.pdNo = p.pdNo 
join mvc_customer_cart t
On o.cartNo=t.cartNo
where ox='o';

SELECT * 
FROM mvc_customer_cart
JOIN  mvc_order_tbl o  
ON o.cartNo = c.cartNo where ox='o';

insert into mvc_order_tbl(id, orderNo, pdNo, cartNo)
valuees();
SELECT * FROM mvc_order_tbl;

SELECT * FROM mvc_customer_cart t JOIN  mvc_product_tbl p ON t.pdNo = p.pdNo JOIN mvc_customer c ON t.id = c.id where show='n' and ox='o';
"SELECT * FROM mvc_order_tbl o JOIN  mvc_product_tbl p ON o.pdNo = p.pdNo "
					+ "JOIN mvc_customer c ON o.id = c.id "
					+ "JOIN mvc_customer_cart t  ON o.cartNo = t.cartNo";
drop table mvc_customer_cart CASCADE CONSTRAINTS;
CREATE TABLE mvc_customer_cart(
id  varchar2(20)REFERENCES  mvc_customer(id),
pdNo number REFERENCES  mvc_product_tbl(pdNo),
cartNo number PRIMARY KEY,
cartCnt number,
show char(1)  DEFAULT 'y',
ox char(1)  DEFAULT 'x'
);
SELECT * FROM mvc_customer_cart t JOIN  mvc_product_tbl p ON t.pdNo = p.pdNo JOIN mvc_customer c ON t.id = c.id where show='y' and ox='x';

commit;
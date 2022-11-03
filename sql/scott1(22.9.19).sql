SELECT * FROM tab;

--2022.09.19 [스프링 마이바티스 117기] --
--scott계정에서 작업
-- 1) mvc_user_tbl 생성
DROP TABLE mvc_user_tbl CASCADE CONSTRAINTS;
CREATE TABLE mvc_user_tbl(
    user_id     NUMBER(2) PRIMARY KEY,
    user_name VARCHAR2(20),
    reg_date    DATE
);

INSERT INTO mvc_user_tbl(user_id, user_name, reg_date)
         VALUES(1, 'john', sysdate);
         
INSERT INTO mvc_user_tbl(user_id, user_name, reg_date)
         VALUES(2, 'terry', sysdate);         

COMMIT;

SELECT * FROM mvc_user_tbl;


-- 회원정보, 주소정보
SELECT u.user_id, u.user_name, a.user_address, u.reg_date
		   FROM mvc_user_tbl u
                  , mvc_address_tbl a
        WHERE u.user_id = a.user_id
    ORDER BY u.user_id;
    

-- 2) mvc_address_tbl 생성
DROP TABLE mvc_address_tbl CASCADE CONSTRAINTS;
CREATE TABLE mvc_address_tbl(
    user_id     NUMBER(2),
    user_address VARCHAR2(50),
    CONSTRAINT mvc_address_tbl_user_id_fk FOREIGN KEY (user_id) REFERENCES mvc_user_tbl (user_id)
);

INSERT INTO mvc_address_tbl(user_id, user_address)
         VALUES(1, '서울시 금천구 가산동');
         
INSERT INTO mvc_address_tbl(user_id, user_address)
         VALUES(2, '서울시 강남구 대치동');         

COMMIT;
SELECT * FROM mvc_address_tbl;

-- 3) mvc_board_tbl 테이블 생성
DROP TABLE mvc_board_tbl CASCADE CONSTRAINTS;
CREATE TABLE mvc_board_tbl(
    board_num        NUMBER(3) PRIMARY KEY,
    board_title         VARCHAR2(50),
    board_content   VARCHAR2(100),
    user_id              NUMBER(2), 
    CONSTRAINT mvc_board_tbl_user_id_fk FOREIGN KEY (user_id) REFERENCES mvc_user_tbl (user_id)
);

INSERT INTO mvc_board_tbl(board_num, board_title, board_content, user_id)
         VALUES(100, '자바', '반복문', 1);
         
INSERT INTO mvc_board_tbl(board_num, board_title, board_content, user_id)
         VALUES(101, 'JSP', 'mvc 기본', 1);      
         
INSERT INTO mvc_board_tbl(board_num, board_title, board_content, user_id)
         VALUES(102, '스프링', 'mybatis 기본', 1);     
         
INSERT INTO mvc_board_tbl(board_num, board_title, board_content, user_id)
         VALUES(103, 'JSP응용', 'mvc 활용', 2);

INSERT INTO mvc_board_tbl(board_num, board_title, board_content, user_id)
         VALUES(104, '스프링', 'mybatis 활용', 2);
         
INSERT INTO mvc_board_tbl(board_num, board_title, board_content, user_id)
         VALUES(105, '플젝', '성취감', 2);         
         
COMMIT;
SELECT  board_title boardTitle
                        , board_content boardContent
    FROM mvc_board_tbl
WHERE user_id =2;

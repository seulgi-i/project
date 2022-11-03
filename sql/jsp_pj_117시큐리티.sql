----------2022.9.14 [스프링 시큐리티 117기 ] ------------------
-- jsp_pj_117계정에서 작업

-- 시큐리티 반영( password  VARCHAR2(100), key, authority, enabled)
DROP TABLE mvc_customer_tbl CASCADE constraints;
CREATE TABLE mvc_customer_tbl(
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
commit;
DESC mvc_customer_tbl;      --구조 확인
select * from mvc_customer_tbl;
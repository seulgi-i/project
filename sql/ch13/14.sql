/* p483 저장 프로시저(stored procedure)
--파라미터 없는 프로시저
creat or replace procedure 프로시저명
    IS 
        선언부
BEGIN
        실행부
EXCEPTION
        예외처리부
END[프로시저명]; - 생략 가능
/

실행 : EXCUTE 프로시저명;
삭제 : DROP PROCEDURE 프로시저명;

--2) 파라미터 있는 프로시저
creat or replace procedure 프로시저명(
        파라미터명1 [ IN | OUT | IN OUT ] 자료형 , 
        파라미터명2 [ IN | OUT | IN OUT ] 자료형 ,  ...
)
    IS 
        선언부
BEGIN
        실행부
EXCEPTION
        예외처리부
END[프로시저명] - 생략 가능
실행 : EXCUTE 프로시저명(파라미터명1, 파라미터명2...);
삭제 : DROP PROCEDURE 프로시저명;
*/

--파라미터 없는 프로시저 P488
--P.484    19-1
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE pro_param_in
IS
    v_empno NUMBER(4) := 7788;      --선언부
    v_ename VARCHAR2(30);
BEGIN
    v_ename := 'scott';
    DBMS_OUTPUT.PUT_LINE('v_empno : ' ||v_empno);
    DBMS_OUTPUT.PUT_LINE('v_ename : ' || v_ename);  
    
EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('예외처리 : ');
    DBMS_OUTPUT.PUT_LINE('SQL CODE : ' || TO_CHAR(SQLCODE));
    DBMS_OUTPUT.PUT_LINE('SQL ERRM : ' || TO_CHAR(SQLERRM));    
END;
/
EXECUTE pro_param_in;




--2-1) 파라미터 있는 프로시저
--19-12 먼저 create~/까지 블록지정 후 컨트롤엔터 나중에 excute프로시저
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE pro_param_out(
    in_empno IN emp_tbl.empno%TYPE,
    out_ename OUT emp_tbl.ename%TYPE,
    out_salary OUT emp_tbl.salary%TYPE
)
IS      --선언부

BEGIN

    SELECT ename, salary INTO out_ename, out_salary
      FROM emp_tbl
    WHERE empno = in_empno;
    
EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('예외처리 : ');
    DBMS_OUTPUT.PUT_LINE('SQL CODE : ' || TO_CHAR(SQLCODE));
    DBMS_OUTPUT.PUT_LINE('SQL ERRM : ' || TO_CHAR(SQLERRM));    
END pro_param_out;
/
--2-2
DECLARE
    v_ename     emp_tbl.ename%TYPE;
    v_sal           emp_tbl.salary%TYPE;
    
BEGIN
    pro_param_out(101, v_ename, v_sal);
    DBMS_OUTPUT.PUT_LINE('이름 : ' || v_ename);
    DBMS_OUTPUT.PUT_LINE('월급 : ' || v_sal);    
END;
/
 

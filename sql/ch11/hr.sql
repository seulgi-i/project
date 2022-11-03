   
--16-9. p428
--hr계정에서 실행
 set serveroutput on -- 실행 결과를 화면에 출력, 계정이 바뀌면 꼭 줘야함.
DECLARE 
        -- 변수명    테이블명.컬럼명%TYPE;
        v_deptno      EMPLOYEES.department_id%TYPE  := 50;  
        v_ename       employees.last_name%TYPE := 'scott';
BEGIN

        dbms_output.put_line('부서 번호     사원 이름');
       dbms_output.put_line('------------------------');
        dbms_output.put_line(v_deptno||'      '   ||'     ' ||  v_ename);
END;
/

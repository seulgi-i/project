/* p419
   PL/SQL구조
   --PL/SQPL (Oracle's procedual languege extensions to SQL)
   =>SQL문을 사용한 오라클의 절차적 프로그램 언어
   -- PL/SQL 블록 구조 : 선언부, 실행부, 예외처리부
   */
   --16-1 p420
   set serveroutput on -- 실행 결과를 화면에 출력
    --실행부
   begin   
            dbms_output.put_line('Hello, PL/SQL');
   end;
   /
   
--16-2. p421
DECLARE 
        v_empno         number(4) := 7788;
        v_ename         varchar2(10);
BEGIN
        v_ename := 'scott';
        dbms_output.put_line('v_empno  : ' ||'   '|| v_empno);
       dbms_output.put_line('------------------------');
        dbms_output.put_line('v_ename  : '||'   '|| v_ename);
END;
/
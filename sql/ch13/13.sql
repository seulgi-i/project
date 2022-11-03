/* 18장. 커서와 예외처리 p460
--커서란 select문 또는 데이터 조작이같은 sql문을 처리하는 정보를 저장한 메모리 공간을 말한다
-- 문법 :
DECLER
    CUROSOR 커서명 IS SQL문; --커서선언
BEGIN
    OPEN커서명;        -커서열기
    ATCH 커서명 INTO 변수;
    CLOSE 커서명;      -커서닫기
    END
;
*/

--실습18-3 여러행의 데이터를 커서에 저장하여 사용하기(LOOP 사용) 


DECLARE
        v_dept_row DEPT_TBL%ROWTYPE;
   
    CURSOR c1 IS    --행 건수만큼 반복을 한다.
        SELECT DEPTNO, DEPTNAME, LOC
        from DEPT_TBL;
--부서테이블을 커서에 담고 변수통째로 c1에 담는다
BEGIN
    OPEN C1;      
    loop
    FETCH C1 INTO v_dept_row;
    exit when c1%NOTFOUND;
    
    DBMS_OUTPUT.PUT_LINE('depno, ' || v_dept_row.deptno || 'deptname, ' ||v_dept_row.deptname ||'loc, '||v_dept_row.loc);
    
    end loop;
    CLOSE c1;
    END;
    /
    
    
--18-4 for loop문을 활용하여 커서 사용하기 p465
DECLARE
   
     v_dept_row DEPT_TBL%ROWTYPE;
        SELECT DEPTNO, DEPTNAME, LOC
        from DEPT_TBL;
--부서테이블을 커서에 담고 변수통째로 c1에 담는다
BEGIN
    for c1_rec in c1 loop
    DBMS_OUTPUT.PUT_LINE('depno, ' || c1_rec.deptno || 'deptname, ' ||c1_rec.deptname ||'loc, '||c1_rec.loc);
   end loop;
   
   end;
/

--18-5  파라미터를 사용하기
DECLARE
    v_dept_row DEPT_TBL%ROWTYPE;
    CURSOR c1 (p_deptno DEPT_TBL.DEPTNO%TYPE) IS
        SELECT DEPTNO, DEPTNAME, LOC
            from DEPT_TBL
         where DEPTNO = p_deptno;

BEGIN

    OPEN C1(10);      
    loop
    FETCH C1 INTO v_dept_row;
    exit when c1%NOTFOUND;
    
    DBMS_OUTPUT.PUT_LINE('10번 부서 - ' || v_dept_row.deptno || 'deptname, ' ||v_dept_row.deptname ||'loc, '||v_dept_row.loc);
    
    end loop;
    CLOSE c1;
    open c1 (20);
        loop
        FETCH C1 INTO v_dept_row;
         exit when c1%NOTFOUND;
    
    DBMS_OUTPUT.PUT_LINE('20번 부서 - ' || v_dept_row.deptno || 'deptname, ' ||v_dept_row.deptname ||'loc, '||v_dept_row.loc);
    
    end loop;
    CLOSE c1;
    END;
    /
    


--18-6 커서에 사용할 파라미터 입력받기
DECLARE
    v_deptno DEPT_TBL.deptno%TYPE;
    CURSOR c1 (p_deptno DEPT_TBL.DEPTNO%TYPE) IS
        SELECT DEPTNO, DEPTNAME, LOC
            from DEPT_TBL
         where DEPTNO = p_deptno;

BEGIN
    v_deptno := &INPUT_DEPTNO;
    for c1_rec in c1(v_deptno) Loop    
    DBMS_OUTPUT.PUT_LINE('deptno  :' || c1_rec.deptno || '  deptname : ' ||c1_rec.deptname ||' loc : '||c1_rec.loc);
    
    end loop;
end;
/


/* 예외처리 p471
*/
--10-11 사전정의된 예외 사용하기
declare
    v_wrong NUMBER;
BEGIN
    select DEPTNAME into v_wrong
    from    DEPT_TBL
    where DEPTNO = 10;
    end;
    /
    --오류발생
 declare
    v_wrong NUMBER;
BEGIN
    select DEPTNAME into v_wrong
    from    DEPT_TBL
    where DEPTNO = 10;
    
    dbms_output.put_line('예외가 발생하면 다음 문장은 실행되지 않습니다');
    
    EXCEPTION
        when too_many_rows then
         dbms_output.put_line('예외 처리 : 요구보다 많은 행 추출 오류 발생');
        when value_error then
         dbms_output.put_line('예외 처리 : 수치 또는 값 오류 발생');
        when others then
        dbms_output.put_line('예외 처리 : 사전 정의 외 오류 발생');
end;
/

--18-15 오류 코드와 오류 메세지 사용하기

 declare
    v_wrong NUMBER;
BEGIN
    select DEPTNAME into v_wrong
    from    DEPT_TBL
    where DEPTNO = 10;
    
    dbms_output.put_line('예외가 발생하면 다음 문장은 실행되지 않습니다');
    
    EXCEPTION

        when others then
         dbms_output.put_line('예외 처리 : 사전 정의 외 오류 발생');
         dbms_output.put_line('SQLCOED : ' || to_char(SQLCODE) );
         dbms_output.put_line('SQLERRM : ' || SQLERRM);
end;
/


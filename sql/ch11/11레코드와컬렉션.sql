/* 레코드와 컬렉션
    --레코드 : 자료형이 각기 다른 데이터를 하나의 변수에 저장한다.
        TYPE 레코드명 IS RECORD(
        변수명 자료형1,
        변수명 자료형2,
        변수명 자료형3....
        );
        변수명 레코드명;
        BEGIN
                    참조변수.변수명1 := 값1;
                    참조변수.변수명2 := 값2;
                    참조변수.변수명3 := 값3;
            END; 
*/
--17-1
DECLARE
             TYPE REC_DEPT IS RECORD (
                DEPTNO DEPT_TBL.DEPTNO%TYPE,
                DEPTNAME DEPT_TBL.DEPTNAME%TYPE,
                LOC  DEPT_TBL.LOC%TYPE
            );
             dept_rec REC_DEPT;
        BEGIN
             dept_rec.DEPTNO := 99;
             dept_rec.DEPTNAME := 'DATEABASE';
             dept_rec.LOC  := 'SEOUL';   
             dbms_output.put_line('DEPTNO : '|| dept_rec.DEPTNO);
            dbms_output.put_line('DEPTNAME : '||  dept_rec.DEPTNAME);
           dbms_output.put_line('LOC : '||dept_rec.LOC);
        END;
     /


--17-2,3레코르르 이용해서 테이블 생성하기.
CREATE TABLE DEPT_RECORD
AS SELECT * FROM DEPT_TBL;

SELECT *FROM DEPT_RECORD;

set serveroutput on;
DECLARE
        TYPE REC_DEPT IS RECORD (
                DEPTNO DEPT_TBL.DEPTNO%TYPE,
                DEPTNAME DEPT_TBL.DEPTNAME%TYPE,
                LOC  DEPT_TBL.LOC%TYPE
            );
             dept_rec REC_DEPT;
        BEGIN
             dept_rec.DEPTNO := 90;
             dept_rec.DEPTNAME := '구글';
             dept_rec.LOC  := '맨하튼';   

        INSERT INTO DEPT_RECORD
        VALUES dept_rec;
        END;
        /
--PL/SQL 프로시저가 성공적으로 완료되었습니다.
     SELECT * FROM DEPT_RECORD;
     /*
     10	IT	뉴욕
     20	MARKETING	캐나다
     30	ACCOUNT	파리
     40	HR	맨하튼
     50	SINGER	서울
     99	DATEABASE	SEOUL
*/
/*10	IT	뉴욕
    20	MARKETING	캐나다
    30	ACCOUNT	파리
    40	HR	맨하튼 
    50	SINGER	서울
    99	DATEABASE	SEOUL
    90	구글	맨하튼
*/


--17-4 RECORD 사용해서 UPDATE하기
DECLARE
        TYPE REC_DEPT IS RECORD (
                DEPTNO DEPT_TBL.DEPTNO%TYPE,
                DEPTNAME DEPT_TBL.DEPTNAME%TYPE,
                LOC  DEPT_TBL.LOC%TYPE
            );
             dept_rec REC_DEPT;
        BEGIN
             dept_rec.DEPTNO := 90;
             dept_rec.DEPTNAME := '구글';
             dept_rec.LOC  := '맨하튼';   
            
            UPDATE DEPT_RECORD
            SET ROW = dept_rec
            WHERE DEPTN0 =10;
        
        END;
        /
--PL/SQL 프로시저가 성공적으로 완료되었습니다.
     SELECT * FROM DEPT_RECORD;
     
     
--17-5 레코드에 다른 레코드 포함하기

/* 레코드와 컬렉션 p452
컬렉션 : 자료형이 같은 여러 데이터를 저장하는 컬렉션

--연관배열 : 인덱스라고도 불리는 키, 값으로 구성되는 컬렉션이다.
                        중복되지 않은 유일한 키를 통해 값을 저장하고 불러오는 방식을 사용.
 type 연관배열명 is table of 자료형(
        INDEX BY 인덱스형; -- varchar2, pls_integer..
        );
        변수명 레코드명;
        BEGIN
                    참조변수(인덱스1).변수명1 := 값1;
                    참조변수(인덱스2).변수명2 := 값2;
                    참조변수(인덱스3).변수명3 := 값3;
            END; 
 */
--17-7,
--레코드를 활용한 연관배열
DECLARE
        TYPE REC_DEPT_TBL IS RECORD(
         DEPTNO  DEPT_TBL .DEPTNO%TYPE,
          deptname DEPT_TBL.deptname%TYPE
          );
          
 TYPE ITAB_DEPT IS TABLE OF REC_DEPT_TBL
    index by pls_integer;
    
    dept_arr ITAB_DEPT;
    idx pls_integer := 0;
    
    begin
        for i In(select deptno, deptname from dept_tbl) loop
        idx := idx + 1;
        dept_arr(idx).deptno := i . deptno;
        dept_arr(idx).deptname := i.deptname;

    dbms_output.put_line(
        dept_arr(idx).deptno || ' : ' || dept_arr(idx).deptname);
    
    END LOOP;
    END;
    /




--%ROWTYPE으로 연관배열자료형 지정하기
--17-8
DECLARE
          
 TYPE ITAB_DEPT IS TABLE OF DEPT_TBL%ROWTYPE
    index by pls_integer;
    
    dept_arr ITAB_DEPT;
    idx pls_integer := 0;
    
    begin
        for i In(select * from dept_tbl) loop
        idx := idx + 1;
        dept_arr(idx).deptno := i . deptno;
        dept_arr(idx).deptname := i.deptname;
        dept_arr(idx).loc := i.loc;
 
    dbms_output.put_line(
        dept_arr(idx).deptno || ' : ' || 
        dept_arr(idx).deptname|| ' : ' ||
        dept_arr(idx).loc);
    
    END LOOP;
    END;
/



--컬렉션 메서드 사용하기
--17-9 p.456
     
  DECLARE
        TYPE ITAB_EX IS TABLE OF VARCHAR2(20)
    INDEX BY PLS_INTEGER;
        text_arr ITAB_EX;
        
    BEGIN
        text_arr(1) := '1st data';
        text_arr(2) := '2nd data';
        text_arr(3) := '3rd data';
        text_arr(50) := '50th data';
        
        
         dbms_output.put_line(' text_arr.COUNT : ' || text_arr.count);
         dbms_output.put_line(' text_arr.FIRST : ' || text_arr.FIRST);
         dbms_output.put_line(' text_arr.LAST : ' || text_arr.LAST);
         dbms_output.put_line(' text_arr.PRIOR(50) : ' || text_arr.PRIOR(50));
         dbms_output.put_line(' text_arr.NEXT(50) : ' || text_arr.NEXT(50));
END;
/
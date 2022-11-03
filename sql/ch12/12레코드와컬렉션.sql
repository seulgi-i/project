/* 레코드와 컬렉션
    --레코드 : 자료형이 각기 다른 데이터를 하나의 변수에 저장한다.
        TYPE 레코드명 IS RECORD(
        변수명 자료형1,
        변수명 자료형2,
        변수명 자료형3....
        );
        변수명 레코드명;
        BEGIN
                    참조변수.변수명1 := 값;
                    참조변수.변수명2 := 값;
                    참조변수.변수명3 := 값;
            END; 
*/

--17-2, 3
drop table DEPT_RECORD;
CREATE TABLE DEPT_RECORD
AS SELECT * FROM DEPT_TBL;

SELECT *FROM DEPT_RECORD;

set serveroutput on;
DECLARE
        TYPE REC_DEPT IS RECORD (
                DEPTNO NUMBER(2) NOT NULL := 99,
                DEPTNAME DEPT_TBL.DEPTNAME%TYPE,
                LOC  DEPT_TBL.LOC%TYPE
            );
             dept_rec REC_DEPT;
        BEGIN
             dept_rec.DEPTNO := 99;
             dept_rec.DEPTNAME := 'DATEABASE';
             dept_rec.LOC  := 'SEOUL';   
             
        INSERT INTO DEPT_RECORD
        VALUES dept_rec;
        END;
        /
        SELECT *FROM DEPT_RECORD;
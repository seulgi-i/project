/* p.242 서브쿼리
 - 메인쿼리 내부에 포함된 SELECT 문장이다
 - 즉 서브쿼리에서 실행된 결과가 메인쿼리에 전달되어 최종적인 결과를 출력한다.
 - 메인쿼리 : 서브쿼리를 포함하고있는 쿼리문
 - 서브쿼리 : 메인쿼리에 포함된 쿼리문으로, 비교연산자의 오른쪽에 기술하고, 반드시 괄호안에 넣어야 한다.
 		   메인쿼리가 실행되기 전에 한번만 실행된다.
 		   서브쿼리의 select절에 명시한 열은 메인쿼리의 비교대상과 같은 자료형과 같은 갯수로 지정한다.
 - 종류 : 단일행 서브쿼리, 다중행 서브쿼리
 - 단일행 서브쿼리 : 수행결과가 오직 하나의 행만을 반환하는 서브쿼리
 		  연산자 : >, >=, =, <, <=, <>, !=, ^=
 - 다중행 서브쿼리 : 수행결과가 하나이상의 행만을 반환하는 서브쿼리
         연산자 : IN, ANY, SOME, ALL, EXITS
*/
--1. 단일행 서브쿼리
--'Chen'의 급여보다 많은 급여를 받는 사원의 사번, 이름, 급여를 구하시오. 급여는 오름차순

SELECT EMPLOYEE_ID 
	 , LAST_NAME 
	 , SALARY 
 FROM EMPLOYEES  
WHERE SALARY >(SELECT SALARY  
				 FROM EMPLOYEES
				WHERE LAST_NAME = 'Chen') --8,200
ORDER BY SALARY ASC; --31건 8200보다 큰 8300부터 나왔음.


--'Chen'과 같은 부서에서 일하는 사원의 사번, 이름, 부서번호, 부서명을 구하시오. 사번 오름차순

SELECT e.EMPLOYEE_ID 
	 , e.LAST_NAME 
	 , d.DEPARTMENT_ID 
	 , d.DEPARTMENT_NAME 
  FROM EMPLOYEES e 
  JOIN DEPARTMENTS d ON d.DEPARTMENT_ID = e.DEPARTMENT_ID 
 WHERE e.DEPARTMENT_id = (SELECT e.DEPARTMENT_id
 					    FROM EMPLOYEES e
					   WHERE LAST_NAME = 'Chen')
ORDER BY e.EMPLOYEE_ID;


-- job_title이 'programer'를 포함하는 사원과 같은 직무에서 일하는 사원의 사번, 사원명, job_id, 급여출력
SELECT EMPLOYEE_ID 
	 , LAST_NAME 
	 , JOB_ID 
	 , SALARY 
  FROM EMPLOYEES 
 WHERE JOB_id  = (SELECT JOB_ID  
 					FROM JOBS
 				   WHERE JOB_TITLE like '%Programmer%');
/*103	Hunold	IT_PROG	9000
104	Ernst	IT_PROG	6000
105	Austin	IT_PROG	4800
106	Pataballa	IT_PROG	4800
107	Lorentz	IT_PROG	4200
*/

 --사원테이블의 최소급여를 받는 사원의 이름, 직무, 급여 출력
 				  
 				  
/*P249
 * 2. 다중행 서브쿼리 : 수행결과ㅏ가 하나이상의 행만을 반환하는 서브쿼리
 *  		연산자 : IN, ANY, SOME, ALL, EXISTS
 */
--1) IN : 메인쿼리의 비교조건이 서브쿼리의 결과와 하나라도 일치하면 참.
--사원테이블에서 근무하는 부서중 20,30,40번 부서에서 근무하는 사원정보 출력(단 부서번호로 정렬)
		  
SELECT EMPLOYEE_ID 
	 , LAST_NAME 
	 , JOB_ID 
	 , SALARY 
	 , DEPARTMENT_ID 
  FROM EMPLOYEES e 
 WHERE e.DEPARTMENT_ID IN (20, 30, 40)
ORDER BY DEPARTMENT_ID;
/*201	Hartstein	MK_MAN	13000	20
202	Fay	MK_REP	6000	20
114	Raphaely	PU_MAN	11000	30
115	Khoo	PU_CLERK	3100	30
116	Baida	PU_CLERK	2900	30
117	Tobias	PU_CLERK	2800	30
118	Himuro	PU_CLERK	2600	30
119	Colmenares	PU_CLERK	2500	30
203	Mavris	HR_REP	6500	40
*/


 --IN-- 각 부서별 최대 급여와 동일한 급여를 받는 사원정보		
SELECT EMPLOYEE_ID 
	 , LAST_NAME 
	 , JOB_ID 
	 , SALARY 
	 , DEPARTMENT_ID 
  FROM EMPLOYEES 
 WHERE SALARY  IN (SELECT MAX(SALARY)
 				    FROM EMPLOYEES 
 				   GROUP BY DEPARTMENT_ID )
ORDER BY SALARY;
/* 서브쿼리의 값
12008
11000
7000
24000
13000
10000
12008
8200
14000
6500
9000
4400
 */
 
--ANY, SOME-- 메인쿼리의 비교조건이 서브쿼리의 결과와 하나 이상이 일치하면 참이다.
-- < ANY : 메인쿼리 결과값 < 서브쿼리 최대값
-- > ANY : 메인쿼리 결과값 < 서브쿼리 최소값

--30번부서의 최대급여보다 큰 급여를 받는 사원정보
SELECT EMPLOYEE_ID 
	 , LAST_NAME 
	 , JOB_ID 
	 , SALARY 
	 , DEPARTMENT_ID 
  FROM EMPLOYEES 
 WHERE SALARY > ANY(SELECT MAX(SALARY)
 				      FROM EMPLOYEES 
 				     WHERE DEPARTMENT_ID = 30 )
ORDER BY SALARY;
/*서브쿼리 결과
11000
3100
2900
2800
2600
2500
*/
--30번부서의 최대급여보다 작은 급여를 받는 사원정보
SELECT EMPLOYEE_ID 
	 , LAST_NAME 
	 , JOB_ID 
	 , SALARY 
	 , DEPARTMENT_ID 
  FROM EMPLOYEES 
 WHERE SALARY < ANY(SELECT MAX(SALARY)
 				      FROM EMPLOYEES 
 				     WHERE DEPARTMENT_ID = 30) --11,000
ORDER BY SALARY;


--ALL -메인쿼리의 비교조건이 서브쿼리의 결과와 모든 값이 일치하면 참이다.
-- < ALL : 메인쿼리의 결과값 < 서브쿼리의 최소값
-- > ALL : 메인쿼리의 결과값 > 서브쿼리의 최대값

--30번부서의 최소급여보다 큰 급여를 받는 사원정보
SELECT EMPLOYEE_ID 
	 , LAST_NAME 
	 , JOB_ID 
	 , SALARY 
	 , DEPARTMENT_ID 
  FROM EMPLOYEES 
 WHERE SALARY > ALL(SELECT SALARY
 				      FROM EMPLOYEES 
 				     WHERE DEPARTMENT_ID = 30) --2,500
ORDER BY SALARY ASC;
--30번부서의 최소급여보다 작은 급여를 받는 사원정보
SELECT EMPLOYEE_ID 
	 , LAST_NAME 
	 , JOB_ID 
	 , SALARY 
	 , DEPARTMENT_ID 
  FROM EMPLOYEES 
 WHERE SALARY < ALL(SELECT SALARY
 				      FROM EMPLOYEES 
 				     WHERE DEPARTMENT_ID = 30) --2,500
ORDER BY SALARY ASC;

/*
132	Olson	ST_CLERK	2100	50
128	Markle	ST_CLERK	2200	50
136	Philtanker	ST_CLERK	2200	50
135	Gee	ST_CLERK	2400	50
127	Landry	ST_CLERK	2400	50
*/

--30번부서의 최대급여보다 큰 급여를 받는 사원정보
SELECT EMPLOYEE_ID 
	 , LAST_NAME 
	 , JOB_ID 
	 , SALARY 
	 , DEPARTMENT_ID 
  FROM EMPLOYEES 
 WHERE SALARY > ALL(SELECT MAX(SALARY)
 				      FROM EMPLOYEES 
 				     WHERE DEPARTMENT_ID = 30) --11,000
ORDER BY SALARY ASC;


--30번부서의 최대급여보다 작은 급여를 받는 사원정보
SELECT EMPLOYEE_ID 
	 , LAST_NAME 
	 , JOB_ID 
	 , SALARY 
	 , DEPARTMENT_ID 
  FROM EMPLOYEES 
 WHERE SALARY < ALL(SELECT MAX(SALARY)
 				      FROM EMPLOYEES 
 				     WHERE DEPARTMENT_ID = 30) --11,000
ORDER BY SALARY ASC;



SELECT *
  FROM EMPLOYEES 
 WHERE EXISTS (SELECT DEPARTMENT_NAME 
 				 FROM DEPARTMENTS 
 				WHERE DEPARTMENT_ID = 50);
 --exists가 fasle이면 검색결과가 없다.		
 SELECT *
  FROM EMPLOYEES 
 WHERE EXISTS (SELECT DEPARTMENT_NAME --없는 부서
 				 FROM DEPARTMENTS 
 				WHERE DEPARTMENT_ID = 500);			
 
 --스칼라 서브쿼리 : SELECT에 Subquery를 사용
 --반드시 한 행과 한 컬럼만 반환하는 서브쿼리이다. 만약 여러행이 반환되면 오류가 발생한다.
 --평균급여 별칭 dname옆에 붙여서 해보기 
 

SELECT e.EMPLOYEE_ID AS 사번
     , e.LAST_NAME AS 사원명
     , e.SALARY AS 월급
     ,(SELECT TRUNC(AVG(SALARY))
         FROM EMPLOYEES ) AS 평균급여
     , e.DEPARTMENT_ID AS 부서번호
     ,(SELECT d.DEPARTMENT_NAME
         FROM DEPARTMENTS d
        WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID) AS 부서명
  FROM HR.EMPLOYEES e; 
 	  

 --6) 인라인뷰p259
 --6-1) from 절에서 사용하는 서브쿼리(=인라인뷰)
 --특정 테이블 전체가 아닌, select문을 통해 일부 데이터를 먼저 추출한 후 별칭을 주어 사용
 -- 테이블내 데이터 규모가 너무 크거나, 현재 작업에 불필요한 열이 너무 많아, 행과 열만 사용하고자 할 때 사용
 --6-2 with절 : 인라인뷰를 가독성있게 사용할 경우
 
 /*문법
   WITH
   별칭1 as (select문),
   별칭2 AS (select문)
   
   메인쿼리...
    FROM 별칭1, 별칭2
  */
 --방법1 9-19예제)
SELECT E10.EMPLOYEE_ID
 	  , E10.LAST_NAME
 	  , E10.DEPARTMENT_ID
 	  , D.DEPARTMENT_NAME
 	  , D.LOCATION_ID
  FROM (SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID=10) E10
   	  ,(SELECT * FROM DEPARTMENTS) D
 WHERE E10.DEPARTMENT_ID = D.DEPARTMENT_ID;
 
 --방법2 9-20예제)
 WITH
 E10 AS (SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID=10),
 D   AS (SELECT * FROM DEPARTMENTS)
 SELECT E10.EMPLOYEE_ID, E10.LAST_NAME, E10.DEPARTMENT_ID,
 		D.DEPARTMENT_NAME, D.LOCATION_ID
   FROM E10, D
  WHERE E10.DEPARTMENT_ID = D.DEPARTMENT_ID;
 
 
 
 
 
 
 	  
 	  
 	  
 
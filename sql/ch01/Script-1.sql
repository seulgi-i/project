--검색 컬럼 *FROM 테이블명 ; --테이블 : DBMS에 공간이 할당되어 데이터를 저장
--열 (컬럼, 속성), 행(로우, 레코드)
SELECT *FROM  hr.employees; --사원테이블
SELECT *FROM  hr.departments;   --부서테이블
SELECT *FROM  hr.countries;   --국가테이블
SELECT *FROM hr.jobs;   --직무테이블
SELECT *FROM hr.job_history;   --직무 히스토리 테이블
SELECT *FROM hr.locations;  --위치테이블
SELECT *FROM hr.regions;   --지역테이블

--아이디와 이름에 해당하는 컬럼 정보만 조회
SELECT department_id, department_name
FROM hr.departments;

--테이블의 구조 : DESC(DESCRIBE) 테이블명; (컬럼들의 자료형을 볼 수 있다)
DESCRIBE hr.departments;

--사원테이블에서 사번, last_name, email조회, 단 salary가 10000이상, 
--사번이 150이상, last_name이 Ozer인 사원
SELECT employee_id
   , last_name
   , email
   FROM hr.EMPLOYEES
   WHERE salary>=10000      --WHERE는 레코드(행)에 대한 조건
   AND employee_id>=150
   AND LAST_NAME = 'Ozer';   --'문자', 대소문자 구별


--jobs 테이블에서 job_id, job_title조회
SELECT job_id
   ,job_title
   FROM hr.jobs;

-- DISTINCT : 열 중복데이터를 삭제
SELECT DISTINCT department_id
  FROM hr.employees
 ORDER BY department_id ASC;   -- 정렬 : ASC(오름차순), DESC(내림차순)
 										-- 오름차순은 기본값이기에 생략가능
 
-- p86. 별칭(AS "", AS 별칭)
 SELECT LAST_name, salary, salary*12+commission_pct "ANNSAL", commission_pct
  FROM	hr.employees;
 
 --p88. 
 -- 정렬 : ASC(오름차순), DESC(내림차순)
 -- 사원테이블에서 사번이 150미만인 사원의 사번, last_name, salary, 부서ID검색
 -- (단, 부서ID를 오름차순으로 정렬하고, 급여는 오른차순 정렬, 사번 내림차순 정렬)

SELECT last_name
		, salary
		, employee_id
		, department_id
	FROM hr.employees
	WHERE employee_id < 150
	ORDER BY department_id ASC, salary ASC, employee_id DESC;
			-- 중복일 시 우선순위 부서아이디, 2위 급여, 3위 사번
			-- ORDER BY는 문장 제일 마지막에 위치한다.

-- p.94 WHERE
 SELECT * FROM hr.employees  --107건
	WHERE department_id IS NOT NULL; --106건
	
	
-- 부서테이블의 부서ID, 부서명, 매니저ID를 검색(단 매니저ID를 오름차순, 매니저 ID가 NULL이 아닐 때)
SELECT department_id
		, department_name
		, manager_id
	FROM hr.departments
	WHERE manager_id IS NOT NULL
	ORDER BY manager_id ASC; 


--p114 IS NULL
/*
 * NULL : 미확정, 값이 정해져 있지 않아 알 수 없는 값을 의미하며, 연산불가, 할당불가, 비교불가
 * 		  연산기 관계 컬럼 값도  null로 바뀐다.
 */

 SELECT LAST_name, salary, salary*12+commission_pct "ANNSAL", commission_pct
  FROM	hr.employees;	-- commission_pct가 null이면 연산식 관게 컬럼값도 null로 바뀐다.
  
  
 /*
  * p101 비교연산자
  * - 같다 : =
  * - 같지 않다 : <>, != ^=
  * - > , <, >=, <=
  */
  -- 날짜/문자 데이터 조회
  -- 사원테이블에서 last_name이 king이거나 입사일이 05/07/16인 사원의 사번, last_name, 입사일 검색
  
  -- salary가 3000이상 5000보다 작은 사원의 사번, salary 검색(정렬)
  
  SELECT last_name
  		, hire_date
  		FROM hr.employees
  		WHERE last_name = 'king'
  		OR hire_date = '05/07/16';
  	
  SELECT employee_id
  		, salary
  	FROM hr.EMPLOYEES
  	WHERE salary >= 3000 
	AND salary  <= 5000 
  	ORDER BY salary ASC;
  
/*
--p106 IN 연산자 : 특정 컬럼의 값이 A, B, C중에 하나라도 일치하면 참이 되는 연산자이다.
--  	형식 : 컬럼값 IN(A,B,C)		컬럼값 NOT IN(A,B,C)
 */
  -- 사원테이블에서 부서 ID가 70,80,90,100일 때 사번, 이름, 부서ID로 조회(단 부서ID로 오름차순)
  
 SELECT employee_id
 		, LAST_NAME
 		, department_id
 	FROM HR.EMPLOYEES
 	WHERE department_id IN ('70','80','90','100')
 	ORDER BY department_id ASC;
  
-- p109 BETWEEN A AND B 연산자
-- WHERE 열이름 BETWEEN 최솟값 AND 최댓값;
--salary가 3000이상 5000이하인 사원의 사번, salary 검색(정렬)
  
--사원 테이블에서 사번, 입사일 조회(단, 입사일은 04/01/01~05/12/31), 단 입사일 오름차순
  SELECT employee_id
  		, salary
  	FROM hr.EMPLOYEES
  	WHERE salary BETWEEN 3000 AND 5000
  	ORDER BY salary ASC;
  	
  SELECT employee_id
  		, hire_date
  	FROM employees   --hr.이라는 스키마는 생략 가능하다.
  	WHERE hire_date BETWEEN'04/01/01' AND '05/12/31'
  	ORDER BY hire_date ASC;
  	
  
  
/*
[2일차] 
p.110
LIKE 연산자와 와일드카드
-컬럼명 LIKE Pattern
-와일드카드 :
% : 길이와 상관없이 모든 문자데이터 의미
_ : 어떤 값이든 상관없이 한개의 문자데이터를 의미
*/

--사원 테이블에서 last_name의 3번째, 4번째 단어가 'tt'인 사원의 last_name조회.. 사번 오름차순 정렬
SELECT EMPLOYEE_ID
    ,LAST_NAME
   FROM HR.EMPLOYEES
   WHERE LAST_NAME LIKE '__tt%'
   ORDER BY EMPLOYEE_ID;
--175 Hutton


--사원테이블에서 'JONES'가 포함된 email조회.. 사번 오름차순 정렬
SELECT EMPLOYEE_ID
    ,EMAIL
   FROM HR.EMPLOYEES
   WHERE EMAIL LIKE '%JONES%'
   ORDER BY EMPLOYEE_ID;
--195 VJONES


--jobs테이블에서 'REP'가 포함된 job_id조회
SELECT JOB_ID
   FROM HR.JOBS
   WHERE JOB_ID LIKE '%REP%';
--HR_REP
--MK_REP
--PR_REP
--SA_REP

--사원테이블에서 'ul'이 포함되지 않은 last_name조회, 사번 오름차순 정렬
SELECT EMPLOYEE_ID 
    ,LAST_NAME
   FROM HR.EMPLOYEES
   WHERE LAST_NAME NOT LIKE '%ul%'
   ORDER BY EMPLOYEE_ID;
--107건중 ul(6건)을 제외한 101건 조회

 

--p.119 합집합
--UNION : 중복제거,   UNION ALL : 중복허용(합집합)
-- order by는 문장의 맨 끝
  --합집합, 교집합, 차집합은 테이블간에 갯수화 자료형이 동일해야 한다.
  SELECT EMPLOYEE_ID, LAST_NAME, SALARY, DEPARTMENT_ID
   FROM HR.EMPLOYEES
   WHERE DEPARTMENT_ID =10
   UNION --중복 제거
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, DEPARTMENT_ID
   FROM HR.EMPLOYEES
   WHERE DEPARTMENT_ID =10;
--SELECT1과 2를 UNION(합침):결과 1건 (중복제거)
  --200	Whalen	4400	10
  --200	Whalen	4400	10
   
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, DEPARTMENT_ID
   FROM HR.EMPLOYEES
   WHERE DEPARTMENT_ID =10
   UNION ALL --중복 적용
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, DEPARTMENT_ID
   FROM HR.EMPLOYEES
   WHERE DEPARTMENT_ID =10
   ORDER BY EMPLOYEE_ID desc;
--SELECT1과 2를 UNION ALL:결과 2건 (중복허용, 합집합)
  
  SELECT EMPLOYEE_ID, LAST_NAME, SALARY, DEPARTMENT_ID
   FROM HR.EMPLOYEES
   MINUS --차집합
  SELECT EMPLOYEE_ID, LAST_NAME, SALARY, DEPARTMENT_ID
  FROM HR.EMPLOYEES 
  WHERE DEPARTMENT_ID = 10
 ORDER BY DEPARTMENT_ID ASC;
  

--intersect-- 교집합

  SELECT EMPLOYEE_ID, LAST_NAME, SALARY, DEPARTMENT_ID
   FROM HR.EMPLOYEES
  intersect --교집합
 SELECT EMPLOYEE_ID, LAST_NAME, SALARY, DEPARTMENT_ID
 FROM HR.EMPLOYEES 
 WHERE DEPARTMENT_ID = 10
 ORDER BY DEPARTMENT_ID ASC;
--200	Whalen	4400	10

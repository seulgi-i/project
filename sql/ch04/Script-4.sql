/*P177
 * 7장. 그룹함수
 * 7-1. 그룹함수
 * 7-2. GROUP BY
 * 7-3. HAVING
 */ 

-- 그룹함수 : 테이블의 전체데이터에서 통계적인 결과를 구하기 위해서, 하나 이상의 행을 그룹으로 묶어 연산하여 하나의 결과를 구한다.
-- 1. SUM : 합계 그룹함수
-- 급여 총액
SELECT SUM(SALARY) AS 급여   --691,416
  FROM EMPLOYEES;
 
SELECT SALARY AS 급여
  FROM EMPLOYEES;    	    --107건
  
--2. AVG : 평균 그룹함수
-- 급여 평균 : 소수점 3째 자리에서 반올림
SELECT ROUND(AVG(SALARY),2) AS 급여   --6,461.831775700934579439252336448598130841(반올림 전)
  FROM EMPLOYEES;			         -- 6,461.83 (반올림 후)

-- 급여 평균 : 정수로 출력
SELECT ROUND(AVG(SALARY),0) AS 급여  --6,462
  FROM EMPLOYEES;
 
--6461로 출력(버림)
SELECT TRUNC(AVG(SALARY),0) AS 급여  --6,461
  FROM EMPLOYEES; 
 
--6461로 출력(소수점X)
 SELECT FLOOR(AVG(SALARY)) AS 급여  --6,461
  FROM EMPLOYEES; 

--3. MAX, MIN : 최대값, 최소값 그룹함수
-- 최대급여, 최소급여
SELECT MAX(SALARY)  --24,000
  FROM EMPLOYEES;

SELECT MIN(SALARY)  --2,100
  FROM EMPLOYEES;
-- 최근 입사일, 가장 오래된 입사일
SELECT MAX(HIRE_DATE) AS "최근 입사일"   --2008-04-21
	 , MIN(HIRE_DATE) AS "오래된 입사일"  --2001-01-13
FROM EMPLOYEES;
 

--4. COUNT(*):전체항(=ROW)갯수를 구하는 그룹함수
-- COUNT(*) : NULL값으로 된 행, 중복된 행을 비롯하여 선택된 모든 행을 카운트항 갯수
-- COUNT(컬럼명):컬럼명의 값이 NULL이 아닌 갯수, 중복된 행 포함
--사원수
SELECT COUNT(*) AS 사원수 
  FROM EMPLOYEES;  --107
  
--커미션을 받은 사원수
SELECT COUNT(COMMISSION_PCT) AS "커미션을 받은 사원수"
  FROM EMPLOYEES;  --35
  
SELECT COMMISSION_PCT AS "커미션을 받은 사원수"
  FROM EMPLOYEES 
 WHERE COMMISSION_PCT IS NULL;   --72건
 
SELECT COMMISSION_PCT AS "커미션을 받은 사원수"
  FROM EMPLOYEES 
 WHERE COMMISSION_PCT IS NOT NULL;   --35건
 
--부서테이블의 부서갯수 (중복X)
SELECT * FROM DEPARTMENTS;    --27건 

SELECT DEPARTMENT_ID AS 부서갯수
  FROM DEPARTMENTS;   -중복  27건, PK이므로 NULLX 중복X
  
SELECT COUNT(DEPARTMENT_ID) AS 부서갯수
  FROM EMPLOYEES;   --NULL제외, 중복  106

SELECT COUNT(DISTINCT DEPARTMENT_ID) AS 부서갯수
  FROM EMPLOYEES;   -- 11개 NULL제외 중복안됨
  

SELECT COUNT(*) FROM DEPARTMENTS;  --27건
SELECT COUNT(DEPARTMENT_ID)
  FROM DEPARTMENTS;  --27건

  
--사원테이블의 최대급여, 최소급여, 급여총액, 급여평균 소수점 이하 2째자리, 사원수
 
SELECT MAX(SALARY) AS 최대급여
	 , MIN(SALARY) AS 최소급여
	 , SUM(SALARY) AS 급여총액
	 , ROUND(AVG(SALARY),2)  AS 급여평균
	 , COUNT(EMPLOYEE_ID)  AS 사원수
  FROM EMPLOYEES;
  --24000	2100	691416	6461.83	107

 
/*P186
 * 7-2.GROUPBY
 * -특정 컬럼을 기준으로 그룹별로 나눌 때 사용
 * -형식 
 * SELECT 컬럼명1, 컬럼명2, 그룹함수
 *   FROM 테이블명
 *  WEHRE 조건
 *  GROUP BY 컬럼명1, 컬럼명2
 *  ORDER BY 컬럼명 ASC|DESC;
 * 
 * GROUP BY 절 다음에 컬럼의 별칭은 사용할 수 없다.
 * 그룹함수가 아닌 SELECT 리스트의 모든 일반 컬럼은 GROUP BY절에 반드시 기술해야 한다. 
 * 그러나 반대로 GROUP BY절에 기술된 컬럼이 반드시 SELECT 리스트에 있어야 하는 건 아니다. 단지 결과가 무의미하다.
 */

--부서별, 직무별로 최대급여
--에러메서지 not a single-group froup funtion =>그룹화 해주어야 함.
SELECT DEPARTMENT_ID 
	 , JOB_ID 
	 --, MAX(SALARY) AS 최대급여     --MAX는 한행으로만 나옴. 107건씩 나오지 않음. 위는 107건씩 나옴. 두개를 따로 하든가 같이 만들든 해야함.
	 , MAX(SALARY) AS 최대급여		   -- 위 부서, 직무를 그룹(GROUB BY) 지어야함.
  FROM EMPLOYEES 
 GROUP BY DEPARTMENT_ID, JOB_ID --(둘 중 하나만 빠져도 에러나옴. 모두 그룹바이로 묶어줘야 함.), 그룹화는 별칭X
 ORDER BY DEPARTMENT_ID  ASC; 
/*부서 , 직무, 최대급여 (부서가 중복됨. 직무별로까지 세분화 되어진 거라 그럼)
10	AD_ASST	4400
20	MK_MAN	13000
20	MK_REP	6000
30	PU_CLERK3100
30	PU_MAN	11000
40	HR_REP	6500
50	SH_CLERK4200
50	ST_CLERK3600
50	ST_MAN	8200
60	IT_PROG	9000
70	PR_REP	10000
80	SA_MAN	14000
80	SA_REP	11500
90	AD_PRES	24000
90	AD_VP	17000
100	FI_ACCOUNT9000
100	FI_MGR	12008
110	AC_ACCOUNT8300
110	AC_MGR	12008
	SA_REP	7000
 */

SELECT DEPARTMENT_ID 
	 , MAX(SALARY) AS 최대급여		   
  FROM EMPLOYEES 
 GROUP BY DEPARTMENT_ID --그룹화는 별칭X
 ORDER BY DEPARTMENT_ID  ASC; 
--JOB_ID  지웠을 때 결과.
--위는 직무까지 포함한 최대급여라 값이 쪼개짐. 직무별로 한 번 더 세분화 되어짐. 그래서 20번이 중복되어 나옴.
--아래 결과는 직무를 뺐기때문에 부서별로만 나와서 값이 적음.
/*
10	4400
20	13000
30	11000
40	6500
50	8200
60	9000
70	10000
80	14000
90	24000
100	12008
110	12008
	7000
*/


--직무(JOB_ID)별로 총급여 구하기, 최대급여 구하기, 직무로 정렬.
SELECT JOB_ID AS 직무
	 , SUM(SALARY) AS 총급여
	 , MAX(SALARY) AS "최대 급여"
  FROM EMPLOYEES 
 GROUP BY JOB_ID 
 ORDER BY JOB_ID;

--사원테이블에서 부서별, 직무별로 인원수, 총급여, 급여평균, 최대급여 구하기
-- 부서, 직무로 오름차순 정렬 (단 부서는 NULL허용 안함)
SELECT DEPARTMENT_ID AS 부서
	 , JOB_ID AS 직무
	 , COUNT(*) AS 인원수
	 , SUM(SALARY) AS 총급여
	 , ROUND(AVG(SALARY),2) AS 급여평균
	 , MAX(SALARY) AS 최대급여
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID IS NOT NULL
 GROUP BY DEPARTMENT_ID, JOB_ID
 ORDER BY DEPARTMENT_ID ASC, JOB_ID ASC;

-- 19건

/*
 *  7-3. 그룹 결과 제한 : HAVING절
 * - 표시할 그룹을 지정하여 집계정보를 기준으로 FILTERING
 * - HAVING + 그룹함수 조건절
 * (그룹함수의 WHERE격)  
 * - 형식 
 * SELECT 컬럼명1, 컬럼명2, 그룹함수
 *   FROM 테이블명
 *  WEHRE 조건
 *  GROUP BY 컬럼명1, 컬럼명2
 *  HAVING + 그룹함수 조건절
 *  ORDER BY 컬럼명 ASC|DESC;
 */

--부서별 최대급여, 총급여(단 총급여가 15000이상), 부서코드 오름차순 정렬
--부서코드가 없으면 제외

SELECT DEPARTMENT_ID  AS 부서코드
	 , MAX(SALARY)	AS 최대급여
     , SUM(SALARY)  AS 총급여
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IS NOT NULL
 GROUP BY DEPARTMENT_ID
HAVING SUM(SALARY) >= 15000
 ORDER BY DEPARTMENT_ID ASC;


--직무별 급여평균, 급여총액 구하기(단 급여평균이 5000이상)
--소수점 이하는 무조건 절삭, 직무 정렬, it직무 스킵

SELECT JOB_ID  AS 직무
	 , floor(avg(SALARY)) AS 급여평균
	 , sum(SALARY) AS 급여총액
  FROM EMPLOYEES 
 WHERE JOB_ID NOT LIKE '%IT%' 
 GROUP BY JOB_ID 
HAVING avg(SALARY) >= 5000
 ORDER BY JOB_ID;

 -- 14건


/*
 * 중첩함수
 * - 그룹함수는 두번까지 중첩해서 사용가능하다. 예)MAX(AVG(SALARY))
 * - 중첩함수는 SELECT LIST에 일반컬럼 사용 불가
 */
--최대평균급여 구하기. 이중 그룹함수.

SELECT --DEPARTMENT_ID --NG
	   MAX(AVG(SALARY)) AS 최대평균급여
     , SUM(SALARY)  AS 총급여
  FROM EMPLOYEES
HAVING SUM(SALARY) >= 15000;






/*p215조인
 * 부서정보
 * 
 * 정보제공 하는 테이블 =>부모테이블 : 부서T->Primary Key(식별키, PK)=>NOT NILL. unique
 * 정보제공 받는 테이블 =>자식테이블 : 사원T->Foreign Key(외래키, FK)
 * 
 * 형식 
 * SELECT t1.column, t2.column
 * 	 FROM table t1, table t2 (t1, t2는 별칭)
 *  WHERE t1.COLUMN = t2.COLUMN
 * 	  AND 조건식
 * -중복조건은 테이블명을 붙여야 함.
 */

--[ 부서정보 ]
--사원테이블의 사번이 103번인 사원의 사번, 부서번호
--방법1.
SELECT e.EMPLOYEE_ID 
	 , d.DEPARTMENT_ID  --d.은 어디 소속인지 말을 안해주면 에러가 남. 반드시 소속을 가지고 오는 습관을 가져야 함.
	 , d.DEPARTMENT_NAME  -- 
	 , d.MANAGER_ID 
	 , e.EMAIL 
	 , d.location_id
  FROM EMPLOYEES e --사원테이블 e라는 별칭을 줌. 만약 별칭을 안 주면 테이블명.컬럼으로 다 주어야 함.
     , DEPARTMENTS d --부서테이블(부서번호는 사원테이블에 없음. 부서테이블에 가서 달라고 해야 함.)
 WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID  	-- PK = FK  반드시 둘 값이 같아야 함. 항상 제공하는 pk가 앞으로 
   AND EMPLOYEE_ID = 103;
--103	60     IT
--103	60	IT	103	AHUNOLD	1400


  
  
  
--[ 부서정보 ]  
--사원테이블의 사번이 103번인 사원의 사번, 부서번호
--방법1.
SELECT e.EMPLOYEE_ID  -- 110
	 , e.DEPARTMENT_ID -- 100
	 , d.DEPARTMENT_NAME -- Finance
  FROM EMPLOYEES e 
     , DEPARTMENTS d 
 WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID --key비교를 하지 않으면 엉터리 값이 나온다.
   AND e.EMPLOYEE_ID = 110;  
  
--방법2. JOIN~ON => ,를 JOIN으로 바꾸고, WHERE를 ON으로 바꾼다.
SELECT e.EMPLOYEE_ID 
 	 , e.DEPARTMENT_ID 
 	 , d.DEPARTMENT_NAME 
  FROM EMPLOYEES e 
  JOIN DEPARTMENTS d 
    ON d.DEPARTMENT_ID = e.DEPARTMENT_ID 
 where e.EMPLOYEE_ID = 103;
   
  
  
  
  
--[ 직무정보 ]
--사원테이블의 100번인 사원의 사번, 직무ID, 직무 타이틀, 최소급여, 최대급여
--방법1
SELECT e.EMPLOYEE_ID 
	 , e.JOB_ID 
	 , j.JOB_TITLE 
	 , j.MIN_SALARY 
	 , j.MAX_SALARY 
  FROM EMPLOYEES e 
     , JOBS j 
 WHERE j.JOB_ID = e.JOB_ID 
   AND e.EMPLOYEE_ID = 100;
-- 100	AD_PRES	President	20080	40000

--[ 직무정보 ]
--사원테이블의 100번인 사원의 사번, 직무ID, 직무 타이틀, 최소급여, 최대급여
--방법2
SELECT e.EMPLOYEE_ID 
	 , j.JOB_ID 
	 , j.JOB_TITLE 
	 , j.MIN_SALARY 
	 , j.MAX_SALARY 
  FROM EMPLOYEES e 
  JOIN JOBS j 
    ON j.JOB_ID = e.JOB_ID 
 where e.EMPLOYEE_ID = 100;
--100	AD_PRES	President	20080	40000

  
  
--[ 위치정보 ]
-- 부서 id가10번째일 때의 부서 id, 부서명, location테이블의 모든 정보 조회
--방법1
SELECT d.DEPARTMENT_ID 
     , d.DEPARTMENT_NAME 
     , l.LOCATION_ID 
     , l.STREET_ADDRESS 
     , l.POSTAL_CODE 
     , l.CITY 
     , l.STATE_PROVINCE 
     , l.COUNTRY_ID      -- 테이블의 모든 정보를 가져오려면 l.*이라 해도 된다.
  FROM DEPARTMENTS d 
  	 , LOCATIONS l 
 where l.LOCATION_ID = d.LOCATION_ID 
  AND  d.DEPARTMENT_ID = 10;
--10	Administration	1700	2004 Charade Rd	98199	Seattle	Washington	US

-- 부서 id가10번째일 때의 부서 id, 부서명, location테이블의 모든 정보 조회
--방법2
SELECT d.DEPARTMENT_ID 
	 , d.DEPARTMENT_NAME 
	 , l.*
  FROM DEPARTMENTS d  
  JOIN LOCATIONS l 
    ON l.LOCATION_ID = d.LOCATION_ID 
 where d.DEPARTMENT_ID = 10;
--10	Administration	1700	2004 Charade Rd	98199	Seattle	Washington	US
  
  
--[ 국가정보 ]
-- location id가 1000번일 때 streat_address, city, countires정보 가져오기

--방법1
SELECT l.LOCATION_ID 
	 , l.STREET_ADDRESS 
	 , l.CITY 
	 , c.*
  FROM LOCATIONS l 
  	 , COUNTRIES c 
 WHERE c.COUNTRY_ID = l.COUNTRY_ID 
   AND l.LOCATION_ID = 1000;
--방법2
  
SELECT l.LOCATION_ID 
	 , l.STREET_ADDRESS 
	 , l.CITY 
	 , c.*
 FROM LOCATIONS l 
 JOIN COUNTRIES c 
   ON c.COUNTRY_ID = l.COUNTRY_ID 
WHERE l.LOCATION_ID = 1000;
  


-- [ 지역정보]
--country_id가 'us'를 포함할 때의 COUNTRY_ID , COUNTRY_NAME, regions모든정보
--방법1
SELECT c.COUNTRY_ID 
	 , c.COUNTRY_NAME 
	 , r.*
  FROM COUNTRIES c 
  	 , REGIONS r 
 WHERE r.REGION_ID = c.REGION_ID 
   AND c.COUNTRY_ID LIKE '%US%';
--방법2
SELECT c.COUNTRY_ID 
	 , c.COUNTRY_NAME 
	 , r.*
  FROM COUNTRIES c 
  JOIN REGIONS r 
    ON r.REGION_ID = c.REGION_ID 
 WHERE c.COUNTRY_ID LIKE '%US%';
--US	United States of America	2	Americas



--'IT'가 포함된 부서명을 가진 부서의 사번, 이름(last+fist) 입사일, 부서코드, 부서명 조회
--방법1
SELECT e.EMPLOYEE_ID 
	 , e.FIRST_NAME||e.LAST_NAME AS 이름
	 , e.HIRE_DATE 
	 , d.DEPARTMENT_ID 
	 , d.DEPARTMENT_NAME 
  FROM DEPARTMENTS d 
  	 , EMPLOYEES e 
 WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID 
   AND d.DEPARTMENT_name LIKE '%IT%';
--방법2
SELECT e.EMPLOYEE_ID 
	 , e.FIRST_NAME||e.LAST_NAME  AS 이름
	 , e.HIRE_DATE 
	 , d.DEPARTMENT_ID 
	 , d.DEPARTMENT_NAME 
  FROM DEPARTMENTS d 
  join EMPLOYEES e 
	on d.DEPARTMENT_ID = e.DEPARTMENT_ID 
 where d.DEPARTMENT_name LIKE '%IT%';

--5건 

--'seatle'이라는 city에서 근무하는 사원의 사번, last_name salary 부서id 부서명 city조회
--방법1
SELECT e.EMPLOYEE_ID 
	 , e.LAST_NAME 
	 , e.SALARY 
	 , d.DEPARTMENT_ID 
	 , d.DEPARTMENT_NAME 
	 , l.CITY
  FROM LOCATIONS l 
  	 , EMPLOYEES e 
  	 , DEPARTMENTS d 
 WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID
   AND l.LOCATION_ID = d.LOCATION_ID 
   AND l.CITY LIKE 'Seattle';
--방법2
SELECT e.EMPLOYEE_ID 
	 , e.LAST_NAME 
	 , e.SALARY 
	 , d.DEPARTMENT_ID 
	 , d.DEPARTMENT_NAME 
	 , l.CITY 
  FROM EMPLOYEES e
  JOIN DEPARTMENTS d 
    ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
  JOIN LOCATIONS l 	
    on l.LOCATION_ID = d.LOCATION_ID 
 WHERE l.CITY LIKE INITCAP('seAttle');
--18건
  

--테이블 전체 조인
--사번이 101번인 사원의 job_history의 start_date가 97/09/21'인 사원의 사번, last_name
-- 부서정보, 위치정보, 국가정보, 지역정보, 직무정보, 직무히스토리 정보 가져오기
--방법1

SELECT e.*
	 , d.*
	 , l.*
	 , r.*
	 , c.*
	 , j.*
	 , jh.*
  FROM DEPARTMENTS d 
  	 , EMPLOYEES e
  	 , LOCATIONS l 
  	 , REGIONS r 
  	 , COUNTRIES c 
  	 , JOBS j 
  	 , JOB_HISTORY jh 
 WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID 
   AND e.EMPLOYEE_ID = jh.EMPLOYEE_ID 
   AND j.JOB_ID = jh.JOB_ID 
   AND l.LOCATION_ID = d.LOCATION_ID 
   AND c.COUNTRY_ID = l.COUNTRY_ID 
   AND c.REGION_ID = r.REGION_ID
   AND e.EMPLOYEE_ID  = 101
   AND jh.START_DATE = '97/09/21';
   


--방법2
SELECT e.*
	 , d.*
	 , l.*
	 , r.*
	 , c.*
	 , j.*
	 , jh.*
 FROM EMPLOYEES e
 Join DEPARTMENTS d ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
 Join LOCATIONS l ON l.LOCATION_ID = d.LOCATION_ID 
 Join COUNTRIES c ON l.COUNTRY_ID = c.COUNTRY_ID
 Join REGIONS r ON r.REGION_ID = c.REGION_ID
 Join JOB_HISTORY jh ON jh.EMPLOYEE_ID = e.EMPLOYEE_ID 
 Join JOBS j ON j.JOB_ID = e.JOB_ID 
WHERE e.EMPLOYEE_ID = 101
  AND jh.START_DATE = '97/09/21';  
 
/*
 * JOIN-ON
 * -중복컬럼은 테이블명을 붙여야 함
 * -테이블명과 테이블명 사이에 콤마(,)대신 JOIN을 사용하고
 * -공통으로 존재하는 키를 비교(조인조건)하는 WHERE대신에 ON을 사용한다.
 * -다른 검색이나 필터조건은 WHERE절에서 분리해서 기술한다.
  */
 SELECT e.EMPLOYEE_ID 
	 , e.EMAIL 
	 , e.DEPARTMENT_ID 
	 , d.DEPARTMENT_NAME 
	 , d.MANAGER_ID 
	 , d.LOCATION_ID 
FROM EMPLOYEES e JOIN DEPARTMENTS d ON d.DEPARTMENT_ID  = e.DEPARTMENT_ID
 WHERE e.EMPLOYEE_ID = 105; 
  
  /*232 SQL-99표준문법으로 배우는 조인
 * NATURAL JOIN
 * - 기준열은 테이블명을 붙이면 안 됨
 * - 중복열은 테이블명을 붙이면 안됨
 * - WHERE절이 아닌 FROM절에서 조인
 */
SELECT e.EMPLOYEE_ID 
	 , e.EMAIL 
	 , DEPARTMENT_ID 
	 , d.DEPARTMENT_NAME 
	 , MANAGER_ID 
	 , d.LOCATION_ID 
FROM EMPLOYEES e 
 NATURAL JOIN DEPARTMENTS d 
 WHERE EMPLOYEE_ID = 105;
   
/*p233 SQL-99 표준문법으로 배우는 조인
 * JOIN~USING
 * - 기준열은 테이블명을 붙이면 안 됨
 * - WHERE절이 아닌 FROM절에서 조인
 */
 SELECT e.EMPLOYEE_ID 
	 , e.EMAIL 
	 , DEPARTMENT_ID 
	 , d.DEPARTMENT_NAME 
	 , d.MANAGER_ID 
	 , d.LOCATION_ID 
FROM EMPLOYEES e 
 JOIN DEPARTMENTS d USING (DEPARTMENT_id)
 WHERE EMPLOYEE_ID = 103; 
  
  
  /*면접
  OUTER JOIN 
  p228, 235
  두테이블간의 어느 한쪽이 null이어도 강제로 출력하는 방식을 outer join이라고 한다.
  -왼쪽 외부 조인(left Outer Join) 오른쪽이 null
  -오른쪽 외부 조인(Right Outer Join) 왼쪽이 null
  -전체 외부 조인(Full Outer Join) 양쪽이 null
  */
 
  
  --부서ID:사원테이블
SELECT DISTINCT DEPARTMENT_ID 
  FROM EMPLOYEES
 ORDER BY DEPARTMENT_ID;
--12건
 
--부서 ID : 부서테이블(10~270)27건
SELECT department_id
  FROM DEPARTMENTS
 ORDER BY DEPARTMENT_ID;

--120~270번 부서가 신설부서
--부서정보를 출력, 사원테이블의 부서코드가 null이어도 부서테이블의 부서정보를 출력
--10~110+120~270

--방법1. 기존방식
--왼쪽 컬럼이 기준(모든 데이터를 가지고 있음) 오른쪽 컬럼은 null을 가지고 있음.

SELECT e.EMPLOYEE_ID  
	 , d.DEPARTMENT_ID 
	 , d.DEPARTMENT_NAME 
  FROM EMPLOYEES e 
     , DEPARTMENTS d
--WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID  --10~110
 WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID(+);  --부족한 정보가 있는 e에 +를 붙여 null이어도 포함해서 출력한다
ORDER BY d.DEPARTMENT_ID;
-- OUTER JOIN p235

 
--LEFT OUTER JOIN:왼쪽 테이블이 기준(모든 데이터를 가지고 있음) 오른쪽 테이블은 null을 가지고 있음.
--방법2 SQL-99
SELECT e.EMPLOYEE_ID  
	 , d.DEPARTMENT_ID 
	 , d.DEPARTMENT_NAME 
  FROM DEPARTMENTS d  left OUTER JOIN  EMPLOYEES e
 --WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID  --10~110
    on d.DEPARTMENT_ID = e.DEPARTMENT_ID;   --10~110+120~270  
 ORDER BY d.DEPARTMENT_ID;
 
--전체 부서 중 일하는 사람, 안하는 사람 알 수 있음.




----------------------------------------------------
--P225 셀프조인
-- 156번 사원의 사번, 사원명, 매니저ID와 매니저명
SELECT e.EMPLOYEE_ID  --사번
	 , e.LAST_NAME 	  --사원명
	 , e.MANAGER_ID   --매니저id
	 , m.employee_Id  --매니저사번
	 , m.last_name    --매니저명
  FROM EMPLOYEES e   --사원명
  	 , EMPLOYEES m   --매니저 테이블
 WHERE e.MANAGER_ID = m.employee_id --매니저 아이디가 사번과 같을 때 키비교
  AND e.EMPLOYEE_ID = 156;
 
--156	King	146	Partners
--3가지 방법
SELECT e.EMPLOYEE_ID  --사번
	 , e.LAST_NAME 	  --사원명
	 , e.MANAGER_ID   --매니저id
	 , m.employee_Id  --매니저사번
	 , m.last_name    --매니저명
  FROM EMPLOYEES e LEFT OUTER JOIN EMPLOYEES m ON e.DEPARTMENT_ID = m.DEPARTMENT_ID;  --매니저 테이블

SELECT e.EMPLOYEE_ID  --사번
	 , e.LAST_NAME 	  --사원명
	 , e.MANAGER_ID   --매니저id
	 , m.employee_Id  --매니저사번
	 , m.last_name    --매니저명
  FROM EMPLOYEES e right OUTER JOIN EMPLOYEES m ON e.DEPARTMENT_ID = m.DEPARTMENT_ID;  --매니저 테이블

SELECT e.EMPLOYEE_ID  --사번
	 , e.LAST_NAME 	  --사원명
	 , e.MANAGER_ID   --매니저id
	 , m.employee_Id  --매니저사번
	 , m.last_name    --매니저명
  FROM EMPLOYEES e full OUTER JOIN EMPLOYEES m ON e.DEPARTMENT_ID = m.DEPARTMENT_ID;  --매니저 테이블

  
  
 
 
 
 
 
 
 
 

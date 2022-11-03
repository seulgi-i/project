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
  
SELECT DEPARTMENT_ID AS 부서갯수
  FROM EMPLOYEES;   --중복+NULL포함 107건
 
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













 
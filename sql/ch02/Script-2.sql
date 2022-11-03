--ch02, 오라클함수 p128
/*
*06-2. 대소문자를 바꿔주는 UPPER, LOWER, INITCAP
*- UPPER : 대문자로 변환
*- LOWER : 소문자로 변환
*- INITCAP : 첫글자만 대문자로, 나머지 글자는 소문자로 변환한다.
*
*/
--사원테이블의 last_name이 'king'일 경우 last_name조회
SELECT last_name
FROM hr.EMPLOYEES 
WHERE last_name = 'King';  --첫글자가 대문자


SELECT employee_id, last_name, hire_date
FROM hr.EMPLOYEES 
WHERE last_name = INITCAP('king');  --첫글자가 소문자

SELECT UPPER(email)
FROM hr.EMPLOYEES 
WHERE email ='TFOX';

SELECT email
FROM hr.EMPLOYEES 
WHERE email = LOWER('tfox');


/*
 * 문자열 길이를 구하는 length함수 : 한글 한문자당 1byte
 * 문자열 길이를 구하는 lengthb함수 : 한글 한문자당 3byte
 */
SELECT LENGTH('한글') FROM dual;  --2
SELECT LENGTHb('한글') FROM dual;  --6
SELECT LENGTH('oracle') FROM dual;  --6
SELECT LENGTHb('oracle') FROM dual;  --6
DESC dual;

-- Dual 테이블 : 한 행으로 결과를 출력하기위해 오라클에서 제공되는 테이블
-- DUMMY Varchar2(1)라는 하나의 컬럼으로 구성되어 있고, 데이터는 'x'값으로 되어있다.
SELECT sysdate 오늘
	, sysdate + 1 내일 --2022-07-20 13:03:31.000
	, sysdate + 2 모레 --2022-07-21 13:03:31.000
FROM	dual;  --2022-07-19 13:02:51.000


--
/*
 * 6-3. 문자열 일부를 추출하는 subsse함수 p1234
 *  - substr(문자열 데이터, 시작위치, 추출 갯수):시작위치부터 추출갯수만큼 추출한다
 *    시작위치가 양수인경우 1부터 시작, 음수인경우 : 뒤쪽부터 시작
 * 	  추출갯수가 생략시 데이커끝까지 추출
 */
SELECT job_id
	, SUBSTR(job_id, 1, 2)
	, SUBSTR(job_id,-2,2)
	, SUBSTR(job_id,5)
FROM hr.employees;
--AC_ACCOUNT  AC NT CCOUNT




/*p 137
 * 6-4 INSTR - 문자열내에 특정문자 위치를 찾아주는 함수
 * 형식 - INSTR(대상, 찾을 글자, 시작위치, 몇번재 발견)
 *	  - 시작위치, 몇번째 발견 생략시 모두 1로 간주 
 */

SELECT INSTR ('HELLO, ORACLE!','L')AS instr_1 -- 3
	 , INSTR ('HELLO, ORACLE!','L',5)AS instr_2 -- 12
	 , INSTR ('HELLO, ORACLE!','L',2,2)AS instr_3 -- 4
FROM dual; 


/* p139
 * 6-5 REPLACE - 특정문자를 다른 문자로 바꾸는 ERPLACE 함수
 * - REPLACE([문자열 데이터 또는 열이름(필수),[찾는 문자(필수)],[대체할 문자(선택)])
 */
SELECT '010-9622-4146' AS REPLACE_BEFORE
	, REPLACE ('010-9622-4146','-',' ')AS REPLACA_1 
	, REPLACE ('010-9622-4146','-','/')AS REPLACA_2 
	, REPLACE ('010-9622-4146','-')AS REPLACA_3
 FROM dual;
--010-9622-4146	010 9622 4146	010/9622/4146	01096224146


/*p140
 * LPAD, RPAD
 */ 
 SELECT RPAD('971225-',14,'*') AS RPAD_JMNO
 		, RPAD('010-9622-',13,'*') AS RPAD_PHONE 
 FROM dual;
 -- 971225-*******	010-9622-****



/*P141
 * 6-7 CONCAT - 문자의 값을 연결한다 ('||'와 동일)
 */
SELECT employee_id 사번
		, hire_date 입사일  -- 2003-06-17 00:00:00.000
		, (FIRST_NAME ||' ' || LAST_NAME)이름
	FROM employees;

-- 입사년도가 04년도이거나 06년도인 사원의 사번, 입사일 (---년 ---월--일)조회, 입사일 순서로 정렬
-- 사번 입사일 별칭 사용

SELECT ('20'||substr(hire_date, 1, 2)||'년'||substr(hire_date, 4, 2)||'월'||substr(hire_date, 7, 2)||'일') 입사일
		, employee_id 사번
from hr.employees
WHERE substr(hire_date, 1, 2) In('04','06')
ORDER BY hire_date ASC;


/* p143 TRIM
 * 6-8. TRIM : 불필요한 공백제거
 *  - 컬럼이나 대상문자열에서 특정 문자가 첫 번째 글자이거나 마지막 글자이면 잘라내고 남은 문자열만 반환.
 */
SELECT ' ORACLE MANIA ' AS trim -- ORACLE MANIA 
		, LTRIM(' ORACLE MANIA ')AS l_trim --ORACLE MANIA 
		, RTRIM(' ORACLE MANIA ')AS r_trim -- ORACLE MANIA
FROM dual;


SELECT ' Oracle mania ' AS trim 
		, TRIM('O' FROM 'Oracle mania') AS l_trim --racle mania
FROM dual;

/*
 * p146 숫자 함수 - > 중요
 * ROUND
 * TRLACCN
 * CEIL
 * FLOOR
 */

-- 147P. 
-- P148
--celi :  지정한 숫자와 가까운 큰 정수
--floor : 지정한 숫자와 가까운  작은 정수 변환
SELECT CEIL(3.14)  --4
	, FLOOR (3.14) --3
	, CEIL (-3.14)  --3
	, FLOOR (-3.14) --2
	, FLOOR(34.5478)--34
	FROM DUAL;

--149P MOD함수
SELECT  MOD(15,6)
		, MOD(10,2)	
		, MOD(11,2)
		FROM dual;

/*
 * p150 날짜 함수
 * - 몇개월 이후 날짜를 구하는 ADD_MONTHS 함수
 */
	SELECT SYSDATE 
		, ADD_MONTHS(SYSDATE, 3) AS "3개월 후"-- 2022-07-19 16:53:25.000	2022-10-19 16:53:25.000
	FROM dual;
	

/*p154 날짜의 반올림 ROUND, 날짜버림 TRUNK함수
 * 형식 : TRUNK(date, format)
 * format이 'MONTH'인 경우, 달을 기준으로 자른다. 이번달 1일
 * ROUND => format이 'MONTH'인 경우, 일을 기준으로 16보다 작으면 이번달 1일, 16이상이면 다음달 1일
 */

--사원 테이블에서 사번, 입사일, TRUNC 입사일, ROUND반올림_근무일수, TRUNC_근무일수 구한다. 입사일 오름차순 정렬
SELECT employee_id AS 사번 --102
	 , hire_date as 입사일 --2001-01-13 
	 , TRUNC (hire_date, 'MONTH') AS TRUNC_입사일 --2001-01-01 그 달의 1일
	 , ROUND (hire_date, 'MONTH') AS ROUND_입사일
	 , sysdate - HIRE_DATE  AS 근무일수 -7857.71474537037037037037037037037037037
	 , ROUND(sysdate - HIRE_DATE )AS ROUND_근무일수 --반올림 7858
	 , TRUNC(sysdate - HIRE_DATE ) as TRUNC_근무일수 --버림7857
  FROM EMPLOYEES
 ORDER BY hire_date ASC;




/*p152 MONTH_BETWEEN함수
 * 두 날짜간의 개월수 차이를 구하는 함수
 */
--사원 테이블에서 사번, 입사일, TRUNC입사일, 근무개월수, ROUND반올림_근무개월수, TRUNC_근무개월수 구한다. 입사일 오름차순 정렬

SELECT employee_id AS 사번 -- 102
	 , hire_date as 입사일 					   -- 2001-01-13  
	 , TRUNC (hire_date, 'MONTH') AS TRUNC_입사일 -- 2001-01-01  
	 , MONTHS_BETWEEN(sysdate , HIRE_DATE) AS 근무개월수 -- 258.216722670250896057347670250896057348
	 , ROUND(MONTHS_BETWEEN(sysdate , HIRE_DATE)) AS ROUND_근무개월수 --반올림 258
	 , TRUNC(MONTHS_BETWEEN(sysdate , HIRE_DATE)) as TRUNC_근무개월수 --버림  258
  FROM EMPLOYEES
 ORDER BY hire_date ASC;


/*p153
 * NEXT_DAY : 돌아오는 요일 => NEXT_DAY([날짜, 데이터],[요일 문자])
			  요일 대신 숫자가 올 수 있다. 1:일요일 2:월요일 ...
 *  * LAST_DAY : 달의 마지막 날짜 반환 => LAST_DAY([날짜, 데이터])
 */
SELECT SYSDATE					    -- 2022-07-19 17:23:05.000
	 , NEXT_DAY(SYSDATE, '일요일') -- 2022-07-24 17:23:05.000
	 , NEXT_DAY(SYSDATE, '월요일') -- 2022-07-25 17:23:05.000
	 , NEXT_DAY(SYSDATE, '화요일') -- 2022-07-26 17:23:05.000
	 , NEXT_DAY(SYSDATE, '토요일') -- 2022-07-23 17:23:05.000
	 , NEXT_DAY(SYSDATE, 5) -- 2022-07-21 17:23:05.000
FROM DUAL;

SELECT EMPLOYEE_ID 사번 -- 102
	, HIRE_DATE 입사일 -- 2001-01-13 00:00:00.000
	, LAST_DAY(HIRE_DATE)   AS "입사한 달의 마지막 날" -- 2001-01-31 00:00:00.000
FROM EMPLOYEES 
ORDER BY HIRE_DATE;


/*P158
 * TO_CHAR : 숫자 또는 날짜 -> 문자 데이터로 변환
 * TO_NUMBER : 문자 -> 숫자 데이터로 변환
 * TO_DATE : 문자 -> 날짜 데이터로 변환
 */

/*
1-1. TO_CHAR
- 날짜형 혹은 숫자형을 문자형으로 변환한다. 
- 형식 : TO_CHAR(날짜데이터, '출력형식')
- 날짜 출력 형식
  종류    의미
  YYYY   년도표현(4자리)
  YY     년도표현(2자리)
  MM     월을 숫자로 표현       
  MON    월을 알파벳으로 표현
  DD     일을 숫자로 표현
  DAY    요일 표현
  DY     요일을 약어로 표현
  W      몇 번째 주
  CC     세기
*/
-- 1. TO_CHAR(날짜형) -> 문자형으로 변환한다.  
-- 형식 : TO_CHAR(날짜데이터, '출력형식')
SELECT SYSDATE -- 2022-07-19 18:13:18.000
		, TO_CHAR (SYSDATE, 'YY/MM/DD') --	22/07/19
		, TO_CHAR (SYSDATE, 'YY/MM/DD DAY') -- 22/07/19 화요일
		, TO_CHAR (SYSDATE, 'YY/MM/DD (DAY)') --22/07/19 (화요일)
		, TO_CHAR (SYSDATE, 'YY/MM/DD DY') -- 22/07/19 화
		, TO_CHAR (SYSDATE, 'YY/MM/DD (DY)') -- 22/07/19 (화)
	FROM dual;


-- 시간 표현
-- 오전 -> AM | 오후 -> PM
-- 12시간 -> HH:MI:SS		|	24시간 -> HH24:MI:SS
SELECT  TO_CHAR (SYSDATE, 'YYYY/MM/DD(DY), HH24:MI:SS') AS 날짜 --	2022/07/19(화), 18:17:33
	  , TO_CHAR (SYSDATE, 'YYYY/MM/DD(DY), HH24:MI:SS PM') AS 날짜2 --	2022/07/19(화), 18:17:33 오후
	FROM dual;


/*  
-- 1-2. TO_CHAR(숫자형) -> 문자형으로 변환한다.  
-- 형식 : TO_CHAR(숫자, '출력형식')  
- L : 각 지역별 통화기호를 앞에 표시 예)한국: ￦    --ㄹ+한자키   ==> 도구-환경설정 -> 검색(돋보기) -> NLS 창에 통화 : ￦으로 설정되어 있음
- , : 천단위 자리 구분을 표시
- . : 소수점을 표시
- 9 : 자리수를 나타내며, 자리수가 맞지 않아도 0으로 채우지 않는다.
- 0 : 자리수를 나타내며, 자리수가 맞지 않을 경우 0으로 채운다.
*/

SELECT EMPLOYEE_ID AS 사번
	 , SALARY -- 24000
	 , TO_CHAR (SALARY, 'L9,999,999') -- ￦24,000
	 , TO_CHAR (SALARY, 'L0,009,999') -- ￦0,024,000
	 , TO_CHAR (SALARY, '$9,999,999') -- $24,000
	 , TO_CHAR (SALARY, '$0,009,999') -- $0,024,000
FROM EMPLOYEES; 



/*
 * [3일차]
 * 2. TO_DATE
 * - 문자형을 날짜형으로 바꾼다.
 * - 형식 : TO_DATE('문자','날짜 FORMAT')
 */

--입사일이 03/06/17인 사원의 사번, 입사일(2003-06-17(화))조회, 입사일 오름차순 정렬
  
SELECT EMPLOYEE_ID AS 사번 						      --100
	 , HIRE_DATE  								      --2003-06-17
	 , TO_CHAR(HIRE_DATE, 'YYYY-MM-DD(DY)')    	      --DATE타입인 HIRE_DATE를 문자형으로 바꿔준다. 2003-06-17(화)
 FROM EMPLOYEES 
WHERE HIRE_DATE = TO_DATE('20030617', 'YYYY/MM/DD')   --입사일이 DATE형태이므로 비교대상('03/06/17')도 DATE형태여야 한다.
ORDER BY HIRE_DATE;
--100	2003-06-17 2003-06-17(화)



/* 
 * 3. TO_NUMBER
 * - 문자열을 숫자형으로 변환한다.
 */
SELECT '100,000' - '50,000'
  FROM DUAL;  --오류: 문자열은 산술 불가
  
 SELECT TO_NUMBER('100,000','999,999')-TO_NUMBER('50,000','999,999'	)
  FROM DUAL;   --50,000
 
 
  /*
   * P.167
   * 1. NVL
   * - NULL : 미확정, 값이 정해져있지 않아 알 수 없는 값을 의미하며, 연산, 할당, 비교가 불가능하다.
   * 		  연산시 관계 컬럼값도 NULL로 바뀐다.
   * - NVL : NULL일 경우 연산, 할당, 비교가 불가능하므로, NVL을 이용해 대체
   * 	   : NULL을 0또는 다른 값으로 변환한다.
   * 	문법 : NVL(컬럼값, 초기값)
   * 		단 두개의 값은 반드시 데이터 타입이 일치해야 한다.
   * 
   */
  
  --사원테이블에서 사번, LAST_NAME, SALARY, COMMISSION_PCT, 연봉(SALARY*12 + COMMISSION_PCT)구하기
  
  SELECT EMPLOYEE_ID                              -- 100
  	   , LAST_NAME 								  -- King
  	   , SALARY 								  -- 24000
  	   , COMMISSION_PCT 						  -- NULL
  	   , SALARY*12 + NVL(COMMISSION_PCT,0) AS 연봉 -- 288000
    FROM HR.EMPLOYEES;
  
  --LOCATION 테이블에서 LOCATION_ID, CITY, STATE_PROVINCE조회(단, STATE_PROVINCE가 NULL인 경우 '미정 주'로 출력)
  SELECT LOCATION_ID
  	   , CITY 
  	   , NVL (STATE_PROVINCE, '미정 주')
    FROM HR.LOCATIONS;
   
  --LOCATION 테이블에서 LOCATION_ID, CITY, STATE_PROVINCE조회(단, STATE_PROVINCE가 NULL이 아닌 경우)
  SELECT LOCATION_ID 
  	   , CITY
  	   , STATE_PROVINCE 
    FROM LOCATIONS
   WHERE STATE_PROVINCE IS NOT NULL;
 
  --LOCATION 테이블에서 LOCATION_ID, CITY, STATE_PROVINCE조회(단, STATE_PROVINCE가 NULL인 경우)
  SELECT LOCATION_ID 
  	   , CITY
  	   , STATE_PROVINCE 
    FROM LOCATIONS
   WHERE STATE_PROVINCE IS NULL;  --6건
  
  /*P.168
   * 2. NVL2함수
   * - 형식 : NVL1 (EXPR1, EXPR2, EXPR3)
   * - EXPR1이 NULL이면 EXPR3을 반환하고, NULL이 아니면 EXPR2을 반환
   */
   
   --사원테이블에서 사번, LAST_NAME, SALARY, COMMISSION_PCT, 연봉(SALARY*12 + COMMISSION_PCT)구하기
   --단 연봉 구할 때 
   --COMMISSION_PCT가 NULL이면 SALAY*12를 반환, NULL이 아니면 SALARY*12 + COMMISSION_PCT를 반환
   
   SELECT EMPLOYEE_ID  -- 100
   		, LAST_NAME    -- King
   		, SALARY 	   -- 24000
   		, COMMISSION_PCT -- NULL
   		, SALARY*12 + NVL (COMMISSION_PCT, 0) AS NVL연봉  -- 288,000
   		, NVL2 (COMMISSION_PCT, SALARY*12+COMMISSION_PCT, SALARY*12 ) AS NVL2연봉   --288,000
     FROM EMPLOYEES;
   
    
    
   /*
    * 3. NULLIF 함수
    * --형식 : NULLIF(EXPR1, EXPR2)
    * --두 표현식을 비교하여 동일하면 NULL, 동일하지 않으면 첫번째 표현식을 반환
    */
    
    SELECT NULLIF('A','A') --  NILL
    	 , NULLIF('A','B') --  A 
      FROM DUAL;
     
   /*
    * 4. COALESCE
    * -- 형식 : COALESCE(EXPR-1, EXPR-2, .... EXPR-N)
    * -- 인수중에서 NULL이 아닌 첫번째 인수를 반환하는 함수
    */ 
    
  SELECT EMPLOYEE_ID AS 사번 -- 100
   		, LAST_NAME    -- King
   		, SALARY 	   -- 24000
   		, COMMISSION_PCT -- NULL
   		, SALARY*12 + NVL (COMMISSION_PCT, 0) AS NVL연봉  -- 288,000
   		, NVL2 (COMMISSION_PCT, SALARY*12+COMMISSION_PCT, SALARY*12 ) AS NVL2연봉   --288,000
   		, COALESCE(COMMISSION_PCT, SALARY, 0) AS COR연봉 --둘 중에 NULL이 아닌 첫번째 값. 둘 다 NULL이면 0을 반환.
    FROM EMPLOYEES;
 	
    
   
  /*P171
   * DECOD함수 : 자바의 WITCH CASE문과 동일
   * - 조건에 따라 다양한 선택이 가능
   * - 형식 : DECODE(표현식, 
   * 				조건1, 결과1
   * 				조건2, 결과2
   * 				조건3, 결과3
   *  				..기본결과 N);
   */
  --사번, 이름, JOB_ID, SALARY 출력()
  --JOB_ID : AD_PRES   SALARY : SALARY*1.1
  --		 AD_VP	   SALARY : SALARY*1.2
  --		 IR_PROG   SALARY : SALARY*1.3
  --		 FI_MGR    SALARY : SALARY*1.4
  -- 	      그 외      SALARY : SALARY*1.5
 SELECT EMPLOYEE_ID
 	  , LAST_NAME 
 	  , JOB_ID 
 	  , SALARY 
	  , DECODE(JOB_ID,
		   'AD_PRES', SALARY*1.1,
		   'AD_VP', SALARY*1.2,
		   'IR_PROG ', SALARY*1.3,
		   'FI_MGR', SALARY*1.4,
		   SALARY*1.5) AS 수당
	FROM EMPLOYEES;
    
 /*P172
  * CASE문 : 자바의 IF ELSE문과 동일
  * - 형식 : CASE(표현식,
  * 			WHEN 조건1 THEN 결과1,
  * 			WHEN 조건2 THEN 결과2,
  * 			WHEN 조건3 THEN 결과3,
  * 			ELSE 결과N
  * 		END;
  */

--사번, 이름, JOB_ID, SALARY 출력()
-- COMM_TEXT : COMMISSION_PCT가 NULL이면 '해당사항 없음'
--			   COMMISSION_PCT가 0이면 '수당없음'
-- 			   COMMISSION_PCT가 0보다 크면 '수당 : '
SELECT EMPLOYEE_ID 
     , LAST_NAME 
     , JOB_ID 
     , SALARY 
     , CASE 
     		WHEN COMMISSION_PCT IS NULL THEN '해당사항 없음'
     		WHEN COMMISSION_PCT = 0 THEN '수당 없음'
     		WHEN COMMISSION_PCT > 0 THEN '수당 : '||COMMISSION_PCT 
     		END AS 수당
  FROM EMPLOYEES;
   /* DECODE함수, CASE문
  사원테이블의 부서ID가 10~60인 경우 부서ID와 '부서명' 출력
    그 외는 '부서미정'으로 출력
    부서ID로 정렬한다.
   단 부서ID는 중복되지 않아야 하며, 부서ID가 null이면 출력되지 않아야 한다.
    부서ID    부서명
    10       Administration
    20       Marketing
    30       Purchasing
    40       Human Resources
    50       Shipping
    60       IT
    70      부서미정  
*/
SELECT DEPARTMENT_ID ,
	DECODE(DEPARTMENT_ID ,
		   10, 'Administration',
		   20, 'Marketing',
		   30, 'Purchasing',
		   40, 'Human Resources',
		   50, 'Shipping',
		   60, 'IT',
		   '부서 미정' ) AS 부서
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID  IS NOT NULL
ORDER BY DEPARTMENT_ID ; 
   
 
  
SELECT DEPARTMENT_ID 
      , CASE 
	 		WHEN DEPARTMENT_ID  = 10 THEN 'Administration'
	 		WHEN DEPARTMENT_ID = 20 THEN 'Marketing'
	 		WHEN DEPARTMENT_ID = 30 THEN 'Purchasing'
	 		WHEN DEPARTMENT_ID = 40 THEN 'Human Resources'
	 		WHEN DEPARTMENT_ID = 50 THEN 'Shipping'
	 		WHEN DEPARTMENT_ID = 60 THEN 'IT'
	 		ELSE '부서 미정'
	 		END AS 부서
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID  IS NOT NULL
ORDER BY DEPARTMENT_ID ; 
   
 
 
 
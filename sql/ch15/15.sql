/*[10일차]
p 175 그룹화와 관련된 여러 함수
    ROLLUP, CUBE, GROUPING SETS 함수
	=> GROP BY절에 지정할 수 있는 특함수이다.
	ROLLUP, CUBE함수는 그룹화 데이터 합계를 출력할 때 유용하다.

	[형식]
	SELECT 컬럼1, 컬럼2, 그룹함수 ...
	  FROM 테이블명
	 WHERE절
	GROUP BY ROLLUP (그룹화 할 컬럼1, 컬럼2,...);
	
	
	SELECT 컬럼1, 컬럼2, 그룹함수 ...
	  FROM 테이블명
	 WHERE절
	GROUP BY CUBE (그룹화 할 컬럼1, 컬럼2,...);
	
	
	SELECT 컬럼1, 컬럼2, 그룹함수 ...
	  FROM 테이블명
	 WHERE절
	GROUP BY GROUPING SETS (그룹화 할 컬럼1, 컬럼2,...);
*/


--실습 7-24 기존GROUP  BY절만 사용한 그룹화
SELECT DEPARTMENT_ID  
	 , JOB_ID
	 , COUNT(*)
	 , MAX(SALARY)
	 , SUM(SALARY)
	 , ROUND(AVG(SALARY),2)
 FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID 
ORDER BY DEPARTMENT_ID, JOB_ID;
--실습 7-25 ROLLUP 함수를 적용한 그룹화
-- ROLLUP함수는 명시한 열을 소그룹별 결과를 출력하고, 마지막에 최종결과를 출력한다.
-- ROLLUP함수에 명시한 열에 한하여 결과를 출력하고, ROLLUP함수에는 그룹함수를 지정할 수 없다.
SELECT DEPARTMENT_ID  
	 , JOB_ID
	 , COUNT(*)
	 , MAX(SALARY)
	 , SUM(SALARY)
	 , ROUND(AVG(SALARY),2)
 FROM EMPLOYEES
GROUP BY ROLLUP (DEPARTMENT_ID, JOB_ID);
/*
10	AD_ASST	1	4400	4400	4400
10	소계	1	4400	4400	4400
20	MK_MAN	1	13000	13000	13000
20	MK_REP	1	6000	6000	6000
20	소계	2	13000	19000	9500
...
    총계	     107	24000	691416	6461.83
*/
--실습 7-26 CUBE 함수를 적용한 그룹화
-- ROLLUP결과가 동일하게 출력되며, 그 아래에 부서와 상관없이 직책별 결과가 함께 출력된다.
-- CUBE함수는 지정한 모든 열에서 가능한 조합의 결과를 모두 출력한다.
SELECT DEPARTMENT_ID  
	 , JOB_ID
	 , COUNT(*)
	 , MAX(SALARY)
	 , SUM(SALARY)
	 , ROUND(AVG(SALARY),2)
 FROM EMPLOYEES
GROUP BY CUBE (DEPARTMENT_ID, JOB_ID)
ORDER BY DEPARTMENT_ID, JOB_ID;
/*
10	AD_ASST	1	4400	4400	4400
10		1	4400	4400	4400
20	MK_MAN	1	13000	13000	13000
20	MK_REP	1	6000	6000	6000
20		2	13000	19000	9500
30	PU_CLERK	5	3100	13900	2780
30	PU_MAN	1	11000	11000	11000
30		6	11000	24900	4150    --ROLUP소계들
	AC_ACCOUNT	1	8300	8300	8300
	AC_MGR	1	12008	12008	12008
	AD_ASST	1	4400	4400	4400
	AD_PRES	1	24000	24000	24000
	AD_VP	2	17000	34000	17000
	FI_ACCOUNT	5	9000	39600	7920
	FI_MGR	1	12008	12008	12008
	HR_REP	1	6500	6500	6500--CUBE 직무별로 한 번 더 나옴
총계		107	24000	691416	6461.83
*/


/*
 * P201
 * -- GROUPING SETS함수를 사용하여 컬럼별로 그룹으로 묶어 출력하기
 * -- 지정한 모든 열을 각각 대그룹으로 처리하여 출력
 */

--7-29
SELECT DEPARTMENT_ID  
	 , JOB_ID
	 , COUNT(*)
 FROM EMPLOYEES
GROUP BY GROUPING SETS (DEPARTMENT_ID, JOB_ID)
ORDER BY DEPARTMENT_ID, JOB_ID;

/*
10		1
20		2
30		6
40		1
50		45
60		5
70		1
80		34
90		3
100		6
110		2
	AC_ACCOUNT	1
	AC_MGR	1
	AD_ASST	1
	AD_PRES	1
	AD_VP	2
	FI_ACCOUNT	5
	FI_MGR	1
	HR_REP	1
	IT_PROG	5
	MK_MAN	1
	MK_REP	1
	PR_REP	1
	PU_CLERK	5
	PU_MAN	1
	SA_MAN	5
	SA_REP	30
	SH_CLERK	20
	ST_CLERK	20
	ST_MAN	5
		1
*/ --따로따로 지정. 따로국밥

--P202 그룹화 함수 : 그룹화(0), 비그룹화(1)
--	   각 한 컬럼씩만 GROUPING 할 수 있다.
--7-30 부서와 직무의 그룹화 결과 여부를 GROUPING 함수로 확인하기
SELECT DEPARTMENT_ID  
	 , JOB_ID
	 , COUNT(*)
	 , MAX(SALARY)
	 , SUM(SALARY)
	 , ROUND(AVG(SALARY),2)
	 , GROUPING(DEPARTMENT_ID)
	 , GROUPING (JOB_ID)
 FROM EMPLOYEES
GROUP BY CUBE (DEPARTMENT_ID, JOB_ID)
ORDER BY DEPARTMENT_ID, JOB_ID;   --52건

--7-31 DECODE문으로 부서와 직무의 그룹화 결과 여부를 GROUPING함수를 적용하기
--그룹화가 안되어 있으면(1) '*~~'출력
SELECT DECODE(GROUPING(DEPARTMENT_ID),1,'*ALL_DEPT', 'DEPT_GR') AS DEPTNO
	 , DECODE(GROUPING(JOB_ID),1,'*ALL_JOB', 'JOB_GR') AS JOB_ID
	 , COUNT(*)
	 , MAX(SALARY)
	 , SUM(SALARY)
	 , ROUND(AVG(SALARY),2)
 FROM EMPLOYEES
GROUP BY CUBE (DEPARTMENT_ID, JOB_ID)
ORDER BY DEPARTMENT_ID, JOB_ID;   --52건

/*
 * GROUPING_ID함수
 * -ROLLUP 또는 CUBE함수로 연산할 때 특정열이 그룹화되었는지를 출력하는 함수
 * -한번에 여러열을 지정할 수 있다.
 * -그룹화된 열 | 그룹화 비트 벡터 | 최종결과
 *  a, b	 | 0 0		   | 0
 *  a		     | 0 1		   | 1
 * 	b		 | 1 0		   | 2
 * 없음	 | 1 1		   | 3
 */
--7-32 GROUPING_ID함수를 사용하기

SELECT COUNT(*)
	 , MAX(SALARY)
	 , SUM(SALARY)
	 , ROUND(AVG(SALARY),2)DEPARTMENT_ID  
	 , GROUPING(DEPARTMENT_ID)
	 , GROUPING(JOB_ID)
	 , GROUPING_ID (DEPARTMENT_ID, JOB_ID)
 FROM EMPLOYEES
GROUP BY CUBE (DEPARTMENT_ID, JOB_ID)
ORDER BY DEPARTMENT_ID, JOB_ID;

/*
	p206 LISTAGG 함수	: LISTAGG-WITHIN GROUP
	그룹에 속해 있는 데이터를 가로로 나열할 때 사용
*/

SELECT DEPARTMENT_ID
	 , LISTAGG(LAST_NAME, ',')
	   WITHIN GROUP(ORDER BY SALARY DESC) AS LAST_NAME 
 FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;
/*
10	Whalen
20	Hartstein,Fay
30	Raphaely,Khoo,Baida,Tobias,Himuro,Colmenares
40	Mavris
50	Fripp,Weiss,Kaufling,Vollman,Mourgos,Sarchand,Bull,Bell,Everett,Chung,Dilly,Ladwig,Rajs,Dellinger,Bissot,Mallin,McCain,Nayer,Stiles,Taylor,Davies,Fleaur,Walsh,Cabrio,Feeney,Gates,Rogers,Atkinson,Geoni,Jones,Mikkilineni,Seo,Grant,Matos,OConnell,Marlow,Patel,Perkins,Sullivan,Vargas,Gee,Landry,Markle,Philtanker,Olson
60	Hunold,Ernst,Austin,Pataballa,Lorentz
70	Baer
80	Russell,Partners,Errazuriz,Ozer,Abel,Cambrault,Vishney,Zlotkey,Bloom,King,Tucker,Fox,Bernstein,Greene,Sully,Hall,McEwen,Hutton,Taylor,Livingston,Olsen,Smith,Cambrault,Doran,Smith,Bates,Marvins,Sewall,Tuvault,Lee,Ande,Banda,Johnson,Kumar
90	King,De Haan,Kochhar
100	Greenberg,Faviet,Chen,Urman,Sciarra,Popp
110	Higgins,Gietz
	GRANT
*/


/*
P208 PIVOT, UNPIVOT 함수
 	 PIVOT - 기본 테이블 행을 열로 바꾼다 (세로 > 가로)
   UNPIVOT - 기본 테이블 열을 행로 바꾼다 (가로 > 세로)
*/
--7-35 부서별, 직무별로 그룹화 최고 급여 데이터 출력 
SELECT DEPARTMENT_ID, JOB_ID, MAX(SALARY)
 FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
ORDER BY DEPARTMENT_ID, JOB_ID;
--7-36 PIVOT을 사용한 직무별, 부서별 최고 급여를 2차원 표 형태로 출력
SELECT *
 FROM (SELECT DEPARTMENT_ID, JOB_ID, SALARY
 		 FROM EMPLOYEES)
 PIVOT(MAX(SALARY)
 	   FOR DEPARTMENT_ID IN (10, 20, 30)
 	   )
ORDER BY JOB_ID;
--7-37 PIVOT을 사용한  부서별, 직무별 최고 급여를 2차원 표 형태로 출력
SELECT *
 FROM (SELECT JOB_ID, DEPARTMENT_ID, SALARY
 		 FROM EMPLOYEES)
 PIVOT(MAX(SALARY)
 	   FOR JOB_ID IN ('AD_ASST' AS ASST,
 	   			  'MK_MAN' AS MAN,
 	   			  'MK_REP' AS MK_REP,
 	   			  'PU_CLERK' AS CLERK,
 	   			  'PU_MAN' AS PU,
 	   			  'HR_REP' AS HR,
 	   			  'SH_CLERK' AS SH,
 	   			  'ST_CLERK' AS ST,
 	   			  'ST_MAN' AS SM)
 	   )
ORDER BY DEPARTMENT_ID;
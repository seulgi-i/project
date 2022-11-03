/* 중요 
 --1. 인라인 뷰를 이용해서 TOP_N 구하기
*/
--입사일 빠른 순서로 5명 출력(인라인 뷰)
--HR계정에서 실행
SELECT EMPLOYEE_ID 
	 , LAST_NAME 
	 , HIRE_DATE 
	 , SALARY 
	 , ROWNUM AS 순위 --ROWNUM : 행(ROW)의 고유번호, 넘버링
  FROM ( SELECT EMPLOYEE_ID 
			  , LAST_NAME 
			  , HIRE_DATE 
			  , SALARY 
  		   FROM EMPLOYEES e 
  		  ORDER BY HIRE_DATE ASC )  
 WHERE ROWNUM < 6
   AND HIRE_DATE IS NOT NULL;
-- 고액연봉 5명을 출력
SELECT EMPLOYEE_ID 
	 , LAST_NAME 
	 , HIRE_DATE 
	 , SALARY 
	 , ROWNUM AS 순위 --ROWNUM : 행(ROW)의 고유번호
  FROM ( SELECT EMPLOYEE_ID 
			  , LAST_NAME 
			  , HIRE_DATE 
			  , SALARY 
  		   FROM EMPLOYEES e 
  		  ORDER BY SALARY desc )  
 WHERE ROWNUM < 6
   AND SALARY IS NOT NULL;  
-- 가장 적은 연봉 5명 출력
SELECT EMPLOYEE_ID 
	 , LAST_NAME 
	 , HIRE_DATE 
	 , SALARY 
	 , ROWNUM AS 순위 --ROWNUM : 행(ROW)의 고유번호
  FROM ( SELECT EMPLOYEE_ID 
			  , LAST_NAME 
			  , HIRE_DATE 
			  , SALARY 
  		   FROM EMPLOYEES e 
  		  ORDER BY SALARY asc )  
 WHERE ROWNUM < 6
   AND SALARY IS NOT NULL;    
   
  
  
/* 중요
 --2. 분석함수
 - 테이블에 있는 데이터를 특정용도로 분석하여 결과를 반환하는 함수
 - partition by : 계산 대상을 그룹으로 정한다.
 - over : 분석함수임을 나타내는 키워드 
 - 분석함수는 그룹별 계산 결과를 행마다 보여주는 특징.		
 - 분석함수는 그룹함수와 그룹단위로 값을 계산한다는 점에서 유사하지만,
   그룹마다가 아니라 결과 set의 각 행마다 집계 결과를 보여준다.
*/
--각각의 동일부서의 급여합계
SELECT department_id
  	 , EMPLOYEE_ID
  	 , SALARY 
     , sum(SALARY) OVER (partition BY DEPARTMENT_ID) AS sum_sal
  FROM EMPLOYEES   
 ORDER BY DEPARTMENT_ID;
 /*
30	114	11000	24900   --그룹별 계산 결과를 행마다 보여주는 특징.
30	115	3100	24900	--sal합을 행마다 보여줌.
30	116	2900	24900
30	117	2800	24900
30	118	2600	24900
30	119	2500	24900
*/


/* 중요
 --3. 순위함수
 - RANK() 함수 - 순위를 부여하는 함수로 동일 순위 처리가 가능하다. 순위에 영향을 미친다.
 			  (중복 순위 다음 순서는 건너뜀 - 1,2,2,2,5)
 			  
 - DENSE_RANK() 함수 -RANK()함수와 동일하나, 동일 등수가 순위에 영향을 미치지 않는다.
  			  (중복 순위 다음 순서는 건너뛰지 않음 - 1,2,2,2,3)
  			  
 - ROW_NUMBER() 함수 - 특정순위로 일련번호를 제공하는 함수로, 동일 순위 처리가 불가능하다. (동점 없음)
  			  (중복 순위 없이 유일한 값 - 1,2,3,4) 
 - 순위 함수 사용시 ORDER BY가 필수이다.

 - NTILE(분류) 함수는 쿼리의 결과를 N계의 그룹으로 분류하는 기능을 제공한다.
 - NTILE(분류순자) 함수는 지정한 분류 숫자 만큼의 그룹으로 분류하는 기능을 제공한다.
*/

--순위함수 비교
-- RANK()
--급여가 높은 순서로 순위를 구하라. (분석)
SELECT department_id
  	 , EMPLOYEE_ID
  	 , RANK() OVER (ORDER BY SALARY DESC) AS 급여순위
  	 , DENSE_RANK() OVER (ORDER BY SALARY DESC) AS D_RAK
  	 , ROW_NUMBER() OVER (ORDER BY SALARY DESC) AS R_NUM
  FROM EMPLOYEES; 
 
/*     RANK    DENSE_RANK   ROW_NUMBER		 

90	100	1			1			1
90	101	2			2			2
90	102	2			2			3
80	145	4			3			4
80	146	5			4			5
20	201	6			5			6
100	108	7			6			7
110	205	7			6			8
80	147	9			7			9
80	168	10			8			10
30	114	11			9			11
*/

--순위함수 NTILE(분류)
SELECT EMPLOYEE_ID
  	 , NTILE(2) OVER (ORDER BY EMPLOYEE_ID DESC) AS GROUP2   --전체를 2등분 하여 1,2로 표현
  	 , NTILE(3) OVER (ORDER BY EMPLOYEE_ID DESC) AS GROUP3	 --전체를 3등분 하여 1,2,3으로 표현
  	 , NTILE(4) OVER (ORDER BY EMPLOYEE_ID DESC) AS GROUP4   --전체를 4등분 하여 1,2,3,4으로 표현
  FROM EMPLOYEES; 
--107건을 등분 하였음.
 

 
/* 중요
 --4. 윈도우 함수
 - 분석함수 중에서 윈도우절(WINDOWING)을 사용하는 함수를 윈도우함수라고 한다.
 - 윈도우절을 사용하게되면 partition BY절에 명시된 그룹을 좀 더 세부적으로 그룹핑할 수 있다.
 - 윈도우절은 분석함수 중에서 일부(그룹함수 AVG, SUM, MAX, MIN, COUNT)만 사용할 수 있다.
 - ROWS : 물리적인 ROW 단위로 행집함을 지정한다.
 - RANGE : 논리적인 상대번지로 행집합을 지정한다.
*/

--ROWS 사용예제
--부서별로 이전 ROW의 급여와 현재 ROW의 급여합계를 출력
--ROW 2 PRECEDING -> 현재 + 이전 + 그 이전 급여 합계
 SELECT EMPLOYEE_ID
 	  , LAST_NAME 
 	  , DEPARTMENT_ID 
 	  , SALARY 
 	  , SUM(SALARY) OVER (PARTITION BY DEPARTMENT_ID
   						  ORDER BY EMPLOYEE_ID 
   						  ROWS 2 PRECEDING) PRE_SUM
  FROM EMPLOYEES;
 
-- RANGE 사용예제
-- 영업정보 시스템에서 분석화면에 전월비교, 전년비교, 분기별 합계, 분기별 평균
-- PRECEDING : 이전 | FOLLOWING : 이후
WITH test AS  --test테이블
 (
	SELECT '202201' yyyymm, 100 amt FROM DUAL
 	UNION ALL SELECT '202202' yyyymm, 200 amt FROM DUAL
 	UNION ALL SELECT '202203' yyyymm, 300 amt FROM DUAL
 	UNION ALL SELECT '202204' yyyymm, 400 amt FROM DUAL
 	UNION ALL SELECT '202205' yyyymm, 500 amt FROM DUAL
 	UNION ALL SELECT '202206' yyyymm, 600 amt FROM DUAL
 	--UNION ALL SELECT '202207' yyyymm, 700 amt FROM DUAL
 	UNION ALL SELECT '202208' yyyymm, 800 amt FROM DUAL
 	UNION ALL SELECT '202209' yyyymm, 900 amt FROM DUAL
 	UNION ALL SELECT '202210' yyyymm, 1000 amt FROM DUAL
 	UNION ALL SELECT '202211' yyyymm, 1100 amt FROM DUAL
 	UNION ALL SELECT '202212' yyyymm, 1200 amt FROM DUAL
 )
 SELECT yyyymm
 	  , amt
 	  , SUM(amt)OVER(ORDER BY TO_DATE(yyyymm, 'yyyymm') 
 	  			 RANGE BETWEEN INTERVAL '3' MONTH PRECEDING 	--이전 3개월(현재달은 미포함)
 	  							AND INTERVAL '1' MONTH PRECEDING) amt_pre3
 	  , SUM(amt)OVER(ORDER BY TO_DATE(yyyymm, 'yyyymm') 
 	  			 RANGE BETWEEN INTERVAL '1' MONTH FOLLOWING  	--이후 3개월(현재달은 미포함)
 	  							AND INTERVAL '3' MONTH FOLLOWING) amt_post3
   FROM test; 
 
 
 
 
 
 
 
 
 
 
 
 
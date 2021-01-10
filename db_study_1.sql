

/* 
    예제 테이블 생성
    사원 테이블, 부서테이블, 급여(등급)테이블
*/




-- 사원 테이블
CREATE TABLE EMP (  
 EMPNO NUMBER(4) NOT NULL,  -- 사원번호
 ENAME VARCHAR2(10),        -- 사원이름
 JOB VARCHAR2(9),           -- 사원직업
 MGR NUMBER(4),             -- 관리자(번호)
 HIREDATE DATE,             -- 입사날짜
 SAL NUMBER(7, 2),          -- 급여
 COMM NUMBER(7, 2),         -- 커미션
 DEPTNO NUMBER(2)           -- 부서번호
 );

-- 부서 테이블
CREATE TABLE DEPT ( 
 DEPTNO NUMBER(2),          -- 부서번호
 DNAME VARCHAR2(14),        -- 부서이름
 LOC VARCHAR2(13)           -- 부서위치
 );

-- 급여(등급)테이블
CREATE TABLE SALGRADE (
 GRADE NUMBER,              -- 등급번호
 LOSAL NUMBER,              -- 등급최저급여
 HISAL NUMBER               -- 등급최고급여
 );


-- 사원 더미데이터
INSERT INTO EMP VALUES (7369, 'SMITH','CLERK',7902, TO_DATE('17-12-1980', 'DD-MM-YYYY'),  800, NULL, 20);
INSERT INTO EMP VALUES (7499, 'ALLEN','SALESMAN',7698, TO_DATE('20-02-1981', 'DD-MM-YYYY'), 1600,  300, 30);
INSERT INTO EMP VALUES (7521, 'WARD','SALESMAN',7698, TO_DATE('22-02-1981', 'DD-MM-YYYY'), 1250,  500, 30);
INSERT INTO EMP VALUES (7566, 'JONES','MANAGER',7839, TO_DATE('02-04-1981', 'DD-MM-YYYY'),  2975, NULL, 20);
INSERT INTO EMP VALUES (7654, 'MARTIN','SALESMAN',7698, TO_DATE('28-09-1981', 'DD-MM-YYYY'), 1250, 1400, 30);
INSERT INTO EMP VALUES (7698, 'BLAKE','MANAGER',7839, TO_DATE('01-05-1981', 'DD-MM-YYYY'),  2850, NULL, 30);
INSERT INTO EMP VALUES (7782, 'CLARK','MANAGER',7839, TO_DATE('09-06-1981', 'DD-MM-YYYY'),  2450, NULL, 10);
INSERT INTO EMP VALUES (7788, 'SCOTT','ANALYST',7566,TO_DATE('09-12-1982', 'DD-MM-YYYY'), 3000, NULL, 20);
INSERT INTO EMP VALUES (7839, 'KING','PRESIDENT',NULL, TO_DATE('17-11-1981', 'DD-MM-YYYY'), 5000, NULL, 10);
INSERT INTO EMP VALUES (7844, 'TURNER','SALESMAN',7698,TO_DATE('08-09-1981', 'DD-MM-YYYY'),  1500, NULL, 30);
INSERT INTO EMP VALUES (7876, 'ADAMS','CLERK',7788,TO_DATE('12-01-1983', 'DD-MM-YYYY'), 1100, NULL, 20);
INSERT INTO EMP VALUES (7900, 'JAMES','CLERK',7698,TO_DATE('03-12-1981', 'DD-MM-YYYY'),   950, NULL, 30);
INSERT INTO EMP VALUES (7902, 'FORD','ANALYST',7566,TO_DATE('03-12-1981', 'DD-MM-YYYY'),  3000, NULL, 20);
INSERT INTO EMP VALUES (7934, 'MILLER','CLERK',7782,TO_DATE('23-01-1982', 'DD-MM-YYYY'), 1300, NULL, 10);


-- 부서 더미데이터
INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS','BOSTON');

-- 급여(등급)테이블
INSERT INTO SALGRADE VALUES (1,  700, 1200);
INSERT INTO SALGRADE VALUES (2, 1201, 1400);
INSERT INTO SALGRADE VALUES (3, 1401, 2000);
INSERT INTO SALGRADE VALUES (4, 2001, 3000);
INSERT INTO SALGRADE VALUES (5, 3001, 9999);



/*
 사원테이블, 부서테이블, 급여테이블을 조회하세요.
 -> 전체 데이터
*/

SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT * FROM SALGRADE;

/*
 사원테이블에서 직업을 출력하세요.
 -> 항목이 중복되지 않도록 출력하세요.
*/

SELECT DISTINCT(JOB) FROM EMP;

/*
 급여가 2850 이상인 사원의 이름, 급여를 출력하세요.
*/

SELECT ENAME, SAL
FROM EMP
WHERE SAL >= 2850;

/*
 급여가 1500이상 2850이하의 범위에 속하는 사원의 이름, 급여를 출력하세요.
*/

SELECT ENAME, SAL
FROM EMP
WHERE SAL BETWEEN 1500 AND 2850;

/*
 1981년 2월 20일~ 1981년 5월 1일에 입사한 사원의 이름, 직업,입사일을 출력하세요.
 -> 입사일을 기준으로 오름차순으로 출력하세요.
*/

SELECT ENAME, JOB, HIREDATE
FROM EMP
WHERE HIREDATE BETWEEN '1981-02-20' AND '1981-05-01'
ORDER BY HIREDATE ASC;

/*
 10번 및 30번 부서에 속하는 모든 사원 중 급여가 1500을 넘는 사원의 이름 및 급여를 출력하세요.
 -> 컬럼명을 각각 employee 및 Monthly Salary로 지정하세요.
*/

SELECT ENAME AS "Employee", SAL "Monthly Salary" 
FROM EMP 
WHERE DEPTNO IN(10,30) AND SAL>1500;

/*
 관리자가 없는 모든 사원의 이름 및 직위를 출력하세요.
*/

SELECT ENAME, JOB 
FROM EMP 
WHERE MGR IS NULL;

/*
 이름의 세 번째 문자가 A인 모든 사원의 이름을 출력하세요.
*/

SELECT ENAME
FROM EMP
WHERE ENAME LIKE '__A%';

/*
 이름에 L이 두 번 들어가며 부서 30에 속해있는 사원의 이름을 출력하세요.
*/

SELECT ENAME
FROM EMP
WHERE ENAME LIKE '%L%L%' AND
      DEPTNO = 30;
      

/*
 사원번호, 이름, 급여 그리고 15%인상된 급여를 정수로 표시하되 컬럼명을
 New Salary로 지정하여 출력하세요.   
*/

SELECT EMPNO, ENAME, ROUND(SAL+(SAL* 0.15),0) AS "New Salary"
FROM EMP;

/*
 모든 사원의 이름(첫 글자는 대문자로, 나머지 글자는 소문자로 표시) 및 이름 길이를
 표시하는 쿼리를 작성하고 컬럼 별칭은 적당히 넣어서 출력하세요.
*/

SELECT initcap(ENAME) AS "ENAME", LENGTH(ENAME) AS "ENAME_LENG"
FROM EMP; 
  
/*
 사원의 이름과 커미션을 출력하되, 커미션이 책정되지 않은
 사원의 커미션은 'no commission'으로 출력하세요.
*/ 

SELECT ENAME, NVL(TO_CHAR(COMM),'no commision') AS "COMM"
FROM EMP;

-- 테스트1





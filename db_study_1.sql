

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

SELECT ENAME, NVL(TO_CHAR(COMM),'No Commision') AS "COMM"
FROM EMP;

/*
 모든 사원의 이름,부서번호,부서이름을 표시하는 질의를 작성하세요.(DECODE)
*/

SELECT ENAME,DEPTNO,
       DECODE(DEPTNO,10,'ACCOUNTING',20,'RESEARCH',30,'SALES',40,'OPERATIONS') AS DNAME
FROM EMP;

       
/*
 30번 부서에 속한 사원의 이름과 부서번호 그리고 부서이름을 출력하세요.
*/

SELECT E.ENAME,E.DEPTNO,D.DNAME
FROM EMP E,DEPT D
WHERE E.DEPTNO = D.DEPTNO AND
      E.DEPTNO = 30;
/*
 30번 부서에 속한 사원들의 모든 직업과 부서위치를 출력하세요.
 (단, 직업 목록이 중복되지 않게 하라.)
*/

SELECT DISTINCT E.JOB, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND
      E.DEPTNO = 30;
      

/*
 이름에 A가 들어가는 모든 사원의 이름과 부서 이름을 출력하세요.
*/

SELECT E.ENAME, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND
      E.ENAME LIKE '%A%';      
      
/*
 Dallas에서 근무하는 모든 사원의 이름, 직업, 부서번호 및 부서이름을 출력하세요.
*/

SELECT E.ENAME, E.JOB, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND
      D.LOC = 'DALLAS';
      
/*
 사원이름 및 사원번호, 해당 관리자이름 및 관리자 번호를 출력하되,
 각 컬럼명을 employee,emp#,manager,mgr#으로 표시하여 출력하세요.
*/

SELECT E.ENAME AS "employee", E.EMPNO AS "emp#", M.ENAME AS "manager", M.EMPNO AS "mgr#"
FROM EMP E, EMP M
WHERE E.MGR = M.EMPNO;

/*
 모든 사원의 이름,직업,부서이름,급여 및 등급을 출력하세요.
*/   

SELECT E.ENAME,E.JOB,D.DNAME,E.SAL,S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO AND
      E.SAL BETWEEN S.LOSAL AND S.HISAL;

/*
 Smith보다 늦게 입사한 사원의 이름 및 입사일을 출력하세요.
*/

SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE > (
    SELECT HIREDATE 
    FROM EMP
    WHERE ENAME = 'SMITH'
);

/*
 모든 사원의 급여 최고액,최저액,총액 및 평균액을 출력하되
 각 컬럼명을 Maximum, Minimum, Sum, Average로 지정하여 출력하세요.
*/

SELECT MAX(SAL) AS Maximum,
       MIN(SAL) AS Minimum,
       SUM(SAL) AS Sum,
       AVG(SAL) AS Average
FROM EMP

/*
 각 직업별로 급여 최저액.최고액,총액 및 평균액을 출력하세요.
*/

SELECT JOB,
       MIN(SAL) AS "최저액",
       MAX(SAL) AS "최고액",
       SUM(SAL) AS "총액",
       AVG(SAL) as "평균액"
FROM EMP
GROUP BY JOB;

/*
 직업이 동일한 사람 수를 직업과 같이 출력하세요.
*/

SELECT JOB, COUNT(*)
FROM EMP
GROUP BY JOB;

/*
 사원번호가 7566인 사원의 이름 및 부서번호를 표시하는 출력하세요.
*/

SELECT ENAME, DEPTNO
FROM EMP
WHERE EMPNO = 7566;

/*
 관리자의 수를 출력하되, 관리자 번호가 중복되지 않게하세요. 그리고,
 컬럼명을 Number of Manager로 지정하여 출력하세요.
*/

SELECT COUNT(DISTINCT MGR) AS "Number of Manager"
FROM EMP;

/*
 최고 급여와 최저 급여의 차액을 출력하세요.
*/

SELECT MAX(SAL)-MIN(SAL)
FROM EMP;

/*
 관리자 번호 및 해당 관리자에 속한 사원들의 최저 급여를 출력하세요.
 단, 관리자가 없는 사원 및 최저 급여가 1000 미만인 그룹은 제외시키고 급여를 기준으로 출력 결과를 내림차순으로 정렬하세요.
*/

SELECT MGR AS "관리자 번호", MIN(SAL) AS "최저 급여"
FROM EMP
WHERE MGR IS NOT NULL
GROUP BY MGR
HAVING MIN(SAL)>=1000
ORDER BY MIN(SAL) DESC;

/*
 부서별로 부서이름, 부서위치, 사원 수 및 평균 급여를 출력하세요.
 그리고 각각의 컬럼명을 부서명,위치,사원의 수,평균급여로 표시하세요.
*/

SELECT E.DEPTNO,D.DNAME,D.LOC,COUNT(E.EMPNO),AVG(E.SAL) 
FROM DEPT D,EMP E
WHERE D.DEPTNO = E.DEPTNO
GROUP BY E.DEPTNO,D.DNAME,D.LOC;

/*
 Smith와 동일한 부서에 속한 모든 사원의 이름 및 입사일을 출력하세요.
 단, Smith는 제외하고 출력하세요.
*/

SELECT ENAME,HIREDATE
FROM EMP
WHERE ENAME != 'SMITH' AND
      DEPTNO IN (
        SELECT DEPTNO
        FROM EMP
        WHERE ENAME = 'SMITH'
);

/*
 자신의 급여가 평균 급여보다 많은 모든 사원의 사원 번호, 이름, 급여를
 표시하는 질의를 작성하고 급여를 기준으로 결과를 내림차순으로 정렬하세요.
*/

-- 전체 직원테이블의 사원번호,이름,급여 출력
SELECT EMPNO,ENAME,SAL
FROM EMP
ORDER BY SAL;





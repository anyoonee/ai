select * from emp;
select * from student;
select * from dept;
select dname from dept;

select empno,ename,sal from emp;

/* 여러줄 주석 */
-- 한줄 주석
-- 대소문자 구분없이 탐색 가능

select stu_id, stu_name, sex from student;

-- 산술연산자 숫자 컬럼(열)만 할 수 있다.
select empno, ename, sal, sal*12 job from emp;
select empno, ename, sal, sal*12*0.33, job from emp;
--컬럼명 [as] 별칭
select empno as 사원번호, ename as 사원명, sal as 급여, sal*12*0.33 as 연세금, job as 직급 from emp;
select empno  사원번호, ename  사원명, sal  급여, sal*12*0.33  연세금, job  직급 from emp;


select * from salgrade;

--산술연산 Hisal + 1000  Losal + 1500 더해서 출력
select grade, losal, losal+1500, hisal, hisal+1000 from salgrade;
-- null이란?0 아님, 빈공간아니다, 미확정
select * from emp;

--comm 보너스를 +100씩 지급 null은 null
select comm, comm+100 from emp;

-- 문자열 연결 || '' 따옴표 안에 넣기, ""따옴표는 에러
select ename ||'의 직급은' || job || '입니다.' 직급 from emp;

-- 문종헌의 나이는 24살입니다.
select stu_name ||'의 직급은' || age || '입니다.' 나이 from student;

-- 부서명의 종류는?(중복제거)
select distinct deptno from emp;

-- 부서명이 20인 사원들 보기
select * from emp where deptno=20;

-- job이 사원이거나 과장
select * from emp where job = '사원' or job = '과장';

-- sal 400이상인 사람의 사원번호, 이름, 급여 보기
select empno 사원번호, ename 이름, sal 급여 from emp where sal >= 400;

select empno 사원번호, ename 이름, sal 급여 from emp where sal >= 400 and job = '부장';

-- 입사일 2006~2007년 사이 입사한 사람
select * from emp where '06/01/01'<= hiredate and hiredate <='07/12/31';

-- 이씨 성을 가진 사람만
select * from emp where ename like'이%';

--job 사원이거나 과장이거나 부장인사람(= in ~안에)
select * from emp where job='사원' or job='부장' or job='과장';
select * from emp where job in('사원','부장','과장');

--칼럼명 between 시작수 and 끝수
select * from emp where sal between 300 and 600;

--comm이 null인사람 출력
select * from emp where comm is null;

-- 이름 오름차순
select * from emp order by ename asc;
select * from emp order by ename;

--급여 내림차순
select * from emp order by sal desc;

select * from emp order by deptno;
select * from emp order by job desc;

-- 부서번호 오름차순, 만약 동일하면 sal 내림차순
select * from emp order by deptno, sal desc;

-- deptno가 10이거나 30인 사람의 mgr 오름차순, deptno오름차순으로
select * from emp where deptno=10 or deptno=30 order by mgr, deptno ;

--합집합 (중복제거)
select * from single_star
union 
select * from group_star;

--합집합 
select * from single_star
union all
select * from group_star;

--교집합 
select * from single_star
INTERSECT
select * from group_star;

--차집합 싱글활동만 하는 그룹
select * from single_star
INTERSECT
select * from group_star;

select empno 사원번호, ename 이름, sal 급여 from emp where sal <=300;
select empno 사원번호, ename 이름, sal 급여 from emp where ename ='오지호';
select empno 사원번호, ename 이름, sal 급여 from emp where sal in (250 ,300 ,500);
select * from emp where sal not in(250 ,300 ,500);
select empno 사원번호, ename 이름 from emp where ename='김기%';
select * from emp where MGR is null;
select * from emp order by deptno, hiredate;





select 24*60 as 계산 from dual;
select * from dual; -- dual 오라클에 제공하는 테이블 용도 계산용

select sign(10) from dual;
select round(3.456,2) from dual;
select trunc(3.4567,-1) from dual;-- 소수점자리에서 숫자대로 앞으로 가 나타냄
select mod(25,4) from dual; -- 25%4나머지

select * from student;

select upper(stu_email) from student;
select lower(stu_email), initcap(stu_email), upper(stu_email) from student;

select length('oracle'),length('오라클')from dual;
select lengthb('oracle'),lengthb('오라클')from dual;

-- substr(대상,시작위치, 추출갯수)
select substr('Welcome to Oracle',4,3)from dual; -- 1번부터 탐색
select substr(stu_email,1,4) from student where stu_name='문종헌';

--stuid가 101~110까지의 사람들의 이메일 com 추출하기
select substr(stu_email,-3,3 )from student where stu_id between 101 and 110;

--instr(대상,찾는문자) 대상에서 찾는 문자와 위치를 숫자로 반환
select instr('Welcome to Oracle',e) from dual;

-- 모든 학생의 이메일 @위치알기
select instr(stu_email,'@') from student;

-- 모든 학생의 id를 구하기 결과
select substr(stu_email,1,instr(stu_email,'@')-1) id from student;

--LPAD left padding
--RPAD right padding
select lpad('oracle',20,'#') from dual;
select rpad('oracle',20,'#') from dual;

select * from emp;
select lpqd(job,10,'') from emp;

--3.형변환함수
-- to_char() to_date() to_number()

-- 현재시간을 구해준다
select sysdate from dual;

select sysdate, to_char(sysdate,'yyyy/dd/yy/')from dual;
select * from emp;
select hiredate,to_char(hiredate,'yyyy-mm-dd dy')from emp;

select to_char(12345678, '000,000,000')from dual;
select to_char(12345678, '000,000')from dual;--에러

select to_char(12345678, '999,999,999')from dual;
select to_char(12345678, '999,999')from dual;--에러

--to_date()날짜형으로바꾸기--
--오라클에서 기본날짜형은'mm/dd/yy'
--to_date('문자','형식') 문자가 형식을 바꿔서 날짜형이 된다
select * from emp;
--select * from emp where hiredate=20070402; 에러
select * from emp where hiredate=to_date(20070402,'yyyymmdd');

--날짜함수
--어제오늘내일
select sysdate -1 어제, sysdate 오늘, sysdate +1 내일 from dual;

select to_char(sysdate -1,'yyyy-mm-dd day')어제, sysdate오늘, sysdate+1 내일 from dual;

--months_between
select months_between(sysdate,'2023/12/31') from dual;
select add_months('2023/10/01',3) from dual;
select round(to_date('20/07/17','yy/mm/dd'),'month')from dual;
select hiredate, trunc(hiredate,'month') from emp;

select ename 사원명,sysdate 현재일, hiredate 입사일, months_between(sysdate,hiredate) 근무달수 from emp;
-- years_between()함수는 없다
select ename 사원명,sysdate 현재일, hiredate 입사일, trunc(months_between(sysdate,hiredate)/12,0) 근무년수 from emp;

select hiredate 입사일,sysdate 현재날짜,trunc(months_between(sysdate,hiredate)/12,0) 근무년수, trunc(months_between(sysdate,hiredate),0) 근무월수, trunc(months_between(sysdate,hiredate),0)*30 근무일수 from emp;

--오늘 날짜를 기준으로 최초로 도래하는 수요일의 날짜는?
select next_day(sysdate,'수요일')from dual;
select to_char(next_day(sysdate,'수'),'yyyy/mm/dd')from dual;
select * from emp;

--nvl(comm,0)
select * from emp where hiredate is null;

--입사일이 null이면 오늘날짜 넣어주기
select hiredate,nvl(hiredate,sysdate) where hiredate is null;

--nvl2(식1,식2,식3) 만약에 식1이 null이 아니면 식2를 반환하고 null이면 식3을반환
select * from emp;
select ename,sal,nvl2(comm,sal*12+comm,sal*12) 연봉 from emp;
--coalesce(식1,식2,...,식n)
--식1이 null이 아니면 식1값출력,식2가 null이 아니면 식2출력,모두다null이면 식n출력

--급여가 null인 자료 삽입
insert into emp values(1020,null,'대리',1003,sysdate,null,null,20);
insert into emp values(1021,null,'대리',1003,sysdate,null,100,20);

select comm,sal,coalesce(comm,sal,0)from emp;

--선택을 위한 decode 함수 (switch~case문과 비슷)
/*decode(표현식, 조건1,결과1,
                조건2,결과2,
                조건3,결과3,
                기본결과n
*/
--ex) deptno가 10이면 '경리부',20이면인사부 30이면 영업부 40이면 전산부로 출력
select * from emp;

select deptno, decode(deptno,10,'경리부',
                             20,'인사부',
                             30,'영업부',
                             '전산부')
from emp;

select * from student;

select sex, decode(sex,'M','남자','여자')from student;

--각 부서별로 제일 높은 급여 출력
select deptno, max(sal) from emp group by deptno oreder by deptno;

--job 별로 급여가 제일 낮은 급여 출력하기
select job,min(sal) from emp group by job;
select * from emp order by job;

--job별로 급여 평균 출력하기
--사원이거나 대리이거나 과장의 급여합계를 구하시오
--1단계 사원, 대리,과장 출력
select * from emp where job in('사원','대리','과장');
--2단계 그룹으로 지정
select job,round(avg(sal)) from emp where job in('사원','대리','과장') group by job;
--최대급여가 700초과 하는 부서에 대해 최대급여와 최소급여 구하기
select deptno,max(sal) from emp group by deptno;
--2단계 최대 급여가 700이 넘는것은?- 그룹함수 조건
select deptno,max(sal) from emp group by deptno having max(sal) >700;

--직급별로 급여의 평균이 500이상인 직급,급여평균,부서명 출력하기
--1단계 직급별 그룹하기
select job,avg(sal) from emp group by job;
--2단계 급여의 평균이 500이상 출력하기
select job, avg(sal)from emp group by job having avg(sal)>=500;
--평균급여 오름차순출력
select job,avg(sal) from emp group by job having avg(sal) >= 500 order by avg(sal) asc;

-- 최대, 최소, 평균 나이?
select * from student;
select max(age) from student;
select min(age) from student;
select avg(age) from student;

-- 남자 최대, 여자 최대
select sex,max(age) from student group by sex;

-- cou_id별 평균나이
select cou_id,avg(age) from student group by cou_id;
--cou_id별 평균나이 25이상코스와 나이 구하기
select cou_id,avg(age)from student group by cou_id having avg(age) >=25;
-- 남자인경우
select cou_id,avg(age)from student where sex = 'M' group by cou_id having avg(age) >=25;






--테이블 만들기
--형식 create table 테이블명 (컬럼명 자료형 제약조건);
create table dept_mission( 
                no number(2),
                dname varchar2(14), -- 가변형문자형으로 실제자리수만큼 바이트 잡는다.
                loc varchar2(13)
                );
                
create table emp_mission( 
                eno number(4), -- 정수형 4자리
                ename varchar2(10), -- 가변형문자형으로 실제자리수만큼 바이트 잡는다.
                dno number(2)
                );
create table emp01(
        empno number(4),
        ename varchar2(14),
        sal number(7,3)); --숫자7자리 소수점 3자리
        
-- 테이블 구조 변경하기
-- 구조를 바꾸면 테이블 자료 삭제          
alter table emp01 add (birth date);
alter table emp_mission add (deptno number(4), addr varchar2(20));
alter table emp01 modify (ename varchar2(25));
alter table emp01 drop column birth ; 
alter table emp_mission drop column deptno;


-- 테이블 구조 보기
desc emp01;

-- 테이블명의 이름 변경하기
rename emp_mission to emp_mi;
-- 테이블 삭제하기
-- drop table 테이블명
drop table emp_mi;

select * from emp;

-- 다른 이름으로 이전 테이블 복사 하기
create table emp_copy as select * from emp;

desc emp;
desc emp_copy;

-- emp_copy comm컬럼 삭제하기
alter table emp_copy drop column comm;

alter table emp_copy rename hiredate to hir;

-- 모든 데이터 제거
delete from emp_copy;



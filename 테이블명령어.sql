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


-- 
select table_name from user_tables;

--딕셔너리 : db 서버에서 제공해주는 테이블
--딕셔너리는 수정이 안된고 읽기만 가능
--용도: 해당 데이터베이스를 관리할때 주로 사용

select * from user_tables ; -- 데이터베이스안의 테이블목록 모두 본다.
select * from user_views;

select * from all_tables;
select * from all_tables where table_name = 'EMP';

select * from dba_tables; --데이터베이스관리자는 오라클에서 이름 지정 sys(장치관리자-하드웨어, 논리적장치 -소프트웨어)
                          --system 논리적장치관리 -소프트웨어, 필요에 따라 사용자 생성
                          
-- dml문 insert,update,delete문 레코드 삽입, 수정, 삭제하기
select * from emp01;

--레코드 삽입하기
--형식 insert into 테이블명(컬럼명,컬럼명) values(값1,값2);
--전체행에 다넣는다.
insert into emp01 values(1000,'홍길동',123.5);
--특정 열만 넣는다.
insert into emp01 (ename, empno, sal) values('이순신',1001,256.7);
--번호, 이름 넣기
insert into emp01 (empno,ename) values(1002,'김수민');
--이름을 공백으로 넣기
insert into emp01 (empno,ename,sal) values(1004, ' ' ,50);

desc emp01;
alter table emp01 add hire date;
insert into emp01 (ename, empno, sal,hire) values('박수미',1010,80,'23/01/29');


--수정하기
--update 테이블명 set 컬럼명 = 새로운 값 where 조건절
update emp01 set sal=200 where ename='홍길동';
update emp01 set sal=sal+100, hire='22/10/25' where empno=1010;

select * from emp01;
--delete from 테이블명 where 조건절
delete from emp01 where sal >= 500;

--트랜잭션
delete from emp01;
rollback;
select * from emp01;
commit;
update emp01 set sal = nvl(sal+200,200);

-- 모든 사람의 입사일 오늘 날짜 수정하기
update emp01 set hire = sysdate;
rollback; --방금전에 한 update취소됨
commit; -- 트랜잭션에 만들어진 dml(insert,update,delete)가 확정됨

--제약조건
select * from dept;
select * from pTab;
--insert into dept values(10,'test','test'); 10은 primary key로 구조를 만들어 유일(unique)하여야해 오류
--insert into dept values(null,'test','test'); null은 primary key로 구조를 만들어 null이 아니어야 하므로 오류

create table pTab(
        code number(4) primary key,
        name varchar2(14)
        );
select * from user_constraints where table_name='PTAB'; --pTab의 제약조건을 보기

--name 컬럼 제약조건을 not null로 고치기
alter table pTab
    modify name varchar(14) not null;
    
--데이터 삽입하기
insert into ptab(code,name)values(1010,'a');
--insert into ptab(code,name)values(1010,'b'); 1010때문에 에러
--insert into ptab(code,name)values(1010,null); null대문에 에러

alter table ptab add id varchar2(10);
desc ptab;

select * from user_constraints where table_name='PTAB';

insert into ptab(code,name,id)values(1012,'c','a100');





                          



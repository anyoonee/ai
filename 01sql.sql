-- dept 데이터 넣기
insert into dept (deptno,dname,loc) values(10,'경리부','서울');
insert into dept (deptno,dname,loc) values(20,'영업부','경기');
select * from dept;
update dept set loc='서울' where deptno=40;
rollback;
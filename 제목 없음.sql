--���̺� �����
--���� create table ���̺�� (�÷��� �ڷ��� ��������);
create table dept_mission( 
                no number(2),
                dname varchar2(14), -- ���������������� �����ڸ�����ŭ ����Ʈ ��´�.
                loc varchar2(13)
                );
                
create table emp_mission( 
                eno number(4), -- ������ 4�ڸ�
                ename varchar2(10), -- ���������������� �����ڸ�����ŭ ����Ʈ ��´�.
                dno number(2)
                );
create table emp01(
        empno number(4),
        ename varchar2(14),
        sal number(7,3)); --����7�ڸ� �Ҽ��� 3�ڸ�
        
-- ���̺� ���� �����ϱ�
-- ������ �ٲٸ� ���̺� �ڷ� ����          
alter table emp01 add (birth date);
alter table emp_mission add (deptno number(4), addr varchar2(20));
alter table emp01 modify (ename varchar2(25));
alter table emp01 drop column birth ; 
alter table emp_mission drop column deptno;


-- ���̺� ���� ����
desc emp01;

-- ���̺���� �̸� �����ϱ�
rename emp_mission to emp_mi;
-- ���̺� �����ϱ�
-- drop table ���̺��
drop table emp_mi;

select * from emp;

-- �ٸ� �̸����� ���� ���̺� ���� �ϱ�
create table emp_copy as select * from emp;

desc emp;
desc emp_copy;

-- emp_copy comm�÷� �����ϱ�
alter table emp_copy drop column comm;

alter table emp_copy rename hiredate to hir;

-- ��� ������ ����
delete from emp_copy;



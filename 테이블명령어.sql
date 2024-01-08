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


-- 
select table_name from user_tables;

--��ųʸ� : db �������� �������ִ� ���̺�
--��ųʸ��� ������ �ȵȰ� �б⸸ ����
--�뵵: �ش� �����ͺ��̽��� �����Ҷ� �ַ� ���

select * from user_tables ; -- �����ͺ��̽����� ���̺��� ��� ����.
select * from user_views;

select * from all_tables;
select * from all_tables where table_name = 'EMP';

select * from dba_tables; --�����ͺ��̽������ڴ� ����Ŭ���� �̸� ���� sys(��ġ������-�ϵ����, ������ġ -����Ʈ����)
                          --system ������ġ���� -����Ʈ����, �ʿ信 ���� ����� ����
                          
-- dml�� insert,update,delete�� ���ڵ� ����, ����, �����ϱ�
select * from emp01;

--���ڵ� �����ϱ�
--���� insert into ���̺��(�÷���,�÷���) values(��1,��2);
--��ü�࿡ �ٳִ´�.
insert into emp01 values(1000,'ȫ�浿',123.5);
--Ư�� ���� �ִ´�.
insert into emp01 (ename, empno, sal) values('�̼���',1001,256.7);
--��ȣ, �̸� �ֱ�
insert into emp01 (empno,ename) values(1002,'�����');
--�̸��� �������� �ֱ�
insert into emp01 (empno,ename,sal) values(1004, ' ' ,50);

desc emp01;
alter table emp01 add hire date;
insert into emp01 (ename, empno, sal,hire) values('�ڼ���',1010,80,'23/01/29');


--�����ϱ�
--update ���̺�� set �÷��� = ���ο� �� where ������
update emp01 set sal=200 where ename='ȫ�浿';
update emp01 set sal=sal+100, hire='22/10/25' where empno=1010;

select * from emp01;
--delete from ���̺�� where ������
delete from emp01 where sal >= 500;

--Ʈ�����
delete from emp01;
rollback;
select * from emp01;
commit;
update emp01 set sal = nvl(sal+200,200);

-- ��� ����� �Ի��� ���� ��¥ �����ϱ�
update emp01 set hire = sysdate;
rollback; --������� �� update��ҵ�
commit; -- Ʈ����ǿ� ������� dml(insert,update,delete)�� Ȯ����

--��������
select * from dept;
select * from pTab;
--insert into dept values(10,'test','test'); 10�� primary key�� ������ ����� ����(unique)�Ͽ����� ����
--insert into dept values(null,'test','test'); null�� primary key�� ������ ����� null�� �ƴϾ�� �ϹǷ� ����

create table pTab(
        code number(4) primary key,
        name varchar2(14)
        );
select * from user_constraints where table_name='PTAB'; --pTab�� ���������� ����

--name �÷� ���������� not null�� ��ġ��
alter table pTab
    modify name varchar(14) not null;
    
--������ �����ϱ�
insert into ptab(code,name)values(1010,'a');
--insert into ptab(code,name)values(1010,'b'); 1010������ ����
--insert into ptab(code,name)values(1010,null); null�빮�� ����

alter table ptab add id varchar2(10);
desc ptab;

select * from user_constraints where table_name='PTAB';

insert into ptab(code,name,id)values(1012,'c','a100');





                          



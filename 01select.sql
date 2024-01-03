select * from emp;
select * from student;
select * from dept;
select dname from dept;

select empno,ename,sal from emp;

/* ������ �ּ� */
-- ���� �ּ�
-- ��ҹ��� ���о��� Ž�� ����

select stu_id, stu_name, sex from student;

-- ��������� ���� �÷�(��)�� �� �� �ִ�.
select empno, ename, sal, sal*12 job from emp;
select empno, ename, sal, sal*12*0.33, job from emp;
--�÷��� [as] ��Ī
select empno as �����ȣ, ename as �����, sal as �޿�, sal*12*0.33 as ������, job as ���� from emp;
select empno  �����ȣ, ename  �����, sal  �޿�, sal*12*0.33  ������, job  ���� from emp;


select * from salgrade;

--������� Hisal + 1000  Losal + 1500 ���ؼ� ���
select grade, losal, losal+1500, hisal, hisal+1000 from salgrade;
-- null�̶�?0 �ƴ�, ������ƴϴ�, ��Ȯ��
select * from emp;

--comm ���ʽ��� +100�� ���� null�� null
select comm, comm+100 from emp;

-- ���ڿ� ���� || '' ����ǥ �ȿ� �ֱ�, ""����ǥ�� ����
select ename ||'�� ������' || job || '�Դϴ�.' ���� from emp;

-- �������� ���̴� 24���Դϴ�.
select stu_name ||'�� ������' || age || '�Դϴ�.' ���� from student;

-- �μ����� ������?(�ߺ�����)
select distinct deptno from emp;

-- �μ����� 20�� ����� ����
select * from emp where deptno=20;

-- job�� ����̰ų� ����
select * from emp where job = '���' or job = '����';

-- sal 400�̻��� ����� �����ȣ, �̸�, �޿� ����
select empno �����ȣ, ename �̸�, sal �޿� from emp where sal >= 400;

select empno �����ȣ, ename �̸�, sal �޿� from emp where sal >= 400 and job = '����';

-- �Ի��� 2006~2007�� ���� �Ի��� ���
select * from emp where '06/01/01'<= hiredate and hiredate <='07/12/31';

-- �̾� ���� ���� �����
select * from emp where ename like'��%';

--job ����̰ų� �����̰ų� �����λ��(= in ~�ȿ�)
select * from emp where job='���' or job='����' or job='����';
select * from emp where job in('���','����','����');

--Į���� between ���ۼ� and ����
select * from emp where sal between 300 and 600;

--comm�� null�λ�� ���
select * from emp where comm is null;

-- �̸� ��������
select * from emp order by ename asc;
select * from emp order by ename;

--�޿� ��������
select * from emp order by sal desc;

select * from emp order by deptno;
select * from emp order by job desc;

-- �μ���ȣ ��������, ���� �����ϸ� sal ��������
select * from emp order by deptno, sal desc;

-- deptno�� 10�̰ų� 30�� ����� mgr ��������, deptno������������
select * from emp where deptno=10 or deptno=30 order by mgr, deptno ;

--������ (�ߺ�����)
select * from single_star
union 
select * from group_star;

--������ 
select * from single_star
union all
select * from group_star;

--������ 
select * from single_star
INTERSECT
select * from group_star;

--������ �̱�Ȱ���� �ϴ� �׷�
select * from single_star
INTERSECT
select * from group_star;

select empno �����ȣ, ename �̸�, sal �޿� from emp where sal <=300;
select empno �����ȣ, ename �̸�, sal �޿� from emp where ename ='����ȣ';
select empno �����ȣ, ename �̸�, sal �޿� from emp where sal in (250 ,300 ,500);
select * from emp where sal not in(250 ,300 ,500);
select empno �����ȣ, ename �̸� from emp where ename='���%';
select * from emp where MGR is null;
select * from emp order by deptno, hiredate;





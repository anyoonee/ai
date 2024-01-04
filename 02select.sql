select 24*60 as ��� from dual;
select * from dual; -- dual ����Ŭ�� �����ϴ� ���̺� �뵵 ����

select sign(10) from dual;
select round(3.456,2) from dual;
select trunc(3.4567,-1) from dual;-- �Ҽ����ڸ����� ���ڴ�� ������ �� ��Ÿ��
select mod(25,4) from dual; -- 25%4������

select * from student;

select upper(stu_email) from student;
select lower(stu_email), initcap(stu_email), upper(stu_email) from student;

select length('oracle'),length('����Ŭ')from dual;
select lengthb('oracle'),lengthb('����Ŭ')from dual;

-- substr(���,������ġ, ���ⰹ��)
select substr('Welcome to Oracle',4,3)from dual; -- 1������ Ž��
select substr(stu_email,1,4) from student where stu_name='������';

--stuid�� 101~110������ ������� �̸��� com �����ϱ�
select substr(stu_email,-3,3 )from student where stu_id between 101 and 110;

--instr(���,ã�¹���) ��󿡼� ã�� ���ڿ� ��ġ�� ���ڷ� ��ȯ
select instr('Welcome to Oracle',e) from dual;

-- ��� �л��� �̸��� @��ġ�˱�
select instr(stu_email,'@') from student;

-- ��� �л��� id�� ���ϱ� ���
select substr(stu_email,1,instr(stu_email,'@')-1) id from student;

--LPAD left padding
--RPAD right padding
select lpad('oracle',20,'#') from dual;
select rpad('oracle',20,'#') from dual;

select * from emp;
select lpqd(job,10,'') from emp;

--3.����ȯ�Լ�
-- to_char() to_date() to_number()

-- ����ð��� �����ش�
select sysdate from dual;

select sysdate, to_char(sysdate,'yyyy/dd/yy/')from dual;
select * from emp;
select hiredate,to_char(hiredate,'yyyy-mm-dd dy')from emp;

select to_char(12345678, '000,000,000')from dual;
select to_char(12345678, '000,000')from dual;--����

select to_char(12345678, '999,999,999')from dual;
select to_char(12345678, '999,999')from dual;--����

--to_date()��¥�����ιٲٱ�--
--����Ŭ���� �⺻��¥����'mm/dd/yy'
--to_date('����','����') ���ڰ� ������ �ٲ㼭 ��¥���� �ȴ�
select * from emp;
--select * from emp where hiredate=20070402; ����
select * from emp where hiredate=to_date(20070402,'yyyymmdd');

--��¥�Լ�
--�������ó���
select sysdate -1 ����, sysdate ����, sysdate +1 ���� from dual;

select to_char(sysdate -1,'yyyy-mm-dd day')����, sysdate����, sysdate+1 ���� from dual;

--months_between
select months_between(sysdate,'2023/12/31') from dual;
select add_months('2023/10/01',3) from dual;
select round(to_date('20/07/17','yy/mm/dd'),'month')from dual;
select hiredate, trunc(hiredate,'month') from emp;

select ename �����,sysdate ������, hiredate �Ի���, months_between(sysdate,hiredate) �ٹ��޼� from emp;
-- years_between()�Լ��� ����
select ename �����,sysdate ������, hiredate �Ի���, trunc(months_between(sysdate,hiredate)/12,0) �ٹ���� from emp;

select hiredate �Ի���,sysdate ���糯¥,trunc(months_between(sysdate,hiredate)/12,0) �ٹ����, trunc(months_between(sysdate,hiredate),0) �ٹ�����, trunc(months_between(sysdate,hiredate),0)*30 �ٹ��ϼ� from emp;

--���� ��¥�� �������� ���ʷ� �����ϴ� �������� ��¥��?
select next_day(sysdate,'������')from dual;
select to_char(next_day(sysdate,'��'),'yyyy/mm/dd')from dual;
select * from emp;

--nvl(comm,0)
select * from emp where hiredate is null;

--�Ի����� null�̸� ���ó�¥ �־��ֱ�
select hiredate,nvl(hiredate,sysdate) where hiredate is null;

--nvl2(��1,��2,��3) ���࿡ ��1�� null�� �ƴϸ� ��2�� ��ȯ�ϰ� null�̸� ��3����ȯ
select * from emp;
select ename,sal,nvl2(comm,sal*12+comm,sal*12) ���� from emp;
--coalesce(��1,��2,...,��n)
--��1�� null�� �ƴϸ� ��1�����,��2�� null�� �ƴϸ� ��2���,��δ�null�̸� ��n���

--�޿��� null�� �ڷ� ����
insert into emp values(1020,null,'�븮',1003,sysdate,null,null,20);
insert into emp values(1021,null,'�븮',1003,sysdate,null,100,20);

select comm,sal,coalesce(comm,sal,0)from emp;

--������ ���� decode �Լ� (switch~case���� ���)
/*decode(ǥ����, ����1,���1,
                ����2,���2,
                ����3,���3,
                �⺻���n
*/
--ex) deptno�� 10�̸� '�渮��',20�̸��λ�� 30�̸� ������ 40�̸� ����η� ���
select * from emp;

select deptno, decode(deptno,10,'�渮��',
                             20,'�λ��',
                             30,'������',
                             '�����')
from emp;

select * from student;

select sex, decode(sex,'M','����','����')from student;

--�� �μ����� ���� ���� �޿� ���
select deptno, max(sal) from emp group by deptno oreder by deptno;

--job ���� �޿��� ���� ���� �޿� ����ϱ�
select job,min(sal) from emp group by job;
select * from emp order by job;

--job���� �޿� ��� ����ϱ�
--����̰ų� �븮�̰ų� ������ �޿��հ踦 ���Ͻÿ�
--1�ܰ� ���, �븮,���� ���
select * from emp where job in('���','�븮','����');
--2�ܰ� �׷����� ����
select job,round(avg(sal)) from emp where job in('���','�븮','����') group by job;
--�ִ�޿��� 700�ʰ� �ϴ� �μ��� ���� �ִ�޿��� �ּұ޿� ���ϱ�
select deptno,max(sal) from emp group by deptno;
--2�ܰ� �ִ� �޿��� 700�� �Ѵ°���?- �׷��Լ� ����
select deptno,max(sal) from emp group by deptno having max(sal) >700;

--���޺��� �޿��� ����� 500�̻��� ����,�޿����,�μ��� ����ϱ�
--1�ܰ� ���޺� �׷��ϱ�
select job,avg(sal) from emp group by job;
--2�ܰ� �޿��� ����� 500�̻� ����ϱ�
select job, avg(sal)from emp group by job having avg(sal)>=500;
--��ձ޿� �����������
select job,avg(sal) from emp group by job having avg(sal) >= 500 order by avg(sal) asc;

-- �ִ�, �ּ�, ��� ����?
select * from student;
select max(age) from student;
select min(age) from student;
select avg(age) from student;

-- ���� �ִ�, ���� �ִ�
select sex,max(age) from student group by sex;

-- cou_id�� ��ճ���
select cou_id,avg(age) from student group by cou_id;
--cou_id�� ��ճ��� 25�̻��ڽ��� ���� ���ϱ�
select cou_id,avg(age)from student group by cou_id having avg(age) >=25;
-- �����ΰ��
select cou_id,avg(age)from student where sex = 'M' group by cou_id having avg(age) >=25;






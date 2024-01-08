create table card(
    cardNumber number(10) not null PRIMARY KEY,
    accountNumber number(12) not null,
    cardKind varchar2(8),
    orderDate date,
    limitAmount number(15),
    
    paymentDate date
);

insert into card values(
    1001,556677,'����',sysdate,5000,'24/01/27'
    
);
insert into card values(
    1002,556677,'����',sysdate,5000,'24/01/27'
    
);
insert into card values(
    1003,556677,'master',sysdate,10000,'24/01/20'
    
);
insert into card values(
    1004,556677,'check',sysdate,null,null
    
);
insert into card values(
    1005,556681,'check',sysdate,null,null
    
);

select * from card;

--����121��
create table userTbl(
    userName varchar2(10) not null primary key,
    birthYear date not null,
    addr varchar2(20) not null,
    mobile varchar2(15)
    
    );
    
    drop table userTbl;
    
create table buyTbl(
    userName varchar2(10) not null primary key,
    prodName varchar2(20) not null,
    prioce number(10) not null,
    amount number(5) not null,
    constraint userName_fk foreign key(userName) references userTbl(userName)
    );
    
    drop table buyTbl;
    
    insert into userTbl values('�̽±�','87/12/10','����','011-111-1111');
    insert into userTbl values('���ȣ','71/12/10','����','011-122-1111');
    
    insert into buyTbl values('�̽±�','�ȭ',10000,1);
    insert into buyTbl values('���ȣ','��Ʈ��',1000000,2);
    
-- ���� �θ�, master, ��
create table bank(
    bankName varchar2(20) not null primary key,
    jijum varchar2(20) not null);

insert into bank values('����','����');
insert into bank values('����','����');
insert into bank values('�츮','����');

--���ݰ��� ���̺��ڽ�, sub,
create table deAcc(
    bankName varchar2(20) not null primary key,
    accKind varchar2(20),
    constraint bankName_fk foreign key(bankName) references bank(bankName) 
--  constraint  �ܷ�Ű��  foreign key(�ܷ�Ű���Į����) references �θ����̺��                        
  );  
    
insert into deAcc values('�츮','�Ϲݰ���');
insert into deAcc values('����','�������');
insert into deAcc values('����','���ǰ���');

-- �����̺� -�θ�,��,master
create table custom(
    cardNumber number(10) not null primary key,
    cName varchar2(20)
     
);

--ī�����̺� - �ڽ�, sub, ��
create table cardTbl(
    cardNumber number(10) not null primary key,
    limitPrice number(10),
    constraint cardNumber_fk foreign key(cardNumber) references custom(cardNumber)
    );
    
insert into custom values(1234,'ȫ�浿');
insert into custom values(1235,'�̼���');
insert into custom values(1236,'�����');

    
select * from custom;
select * from buyTbl;

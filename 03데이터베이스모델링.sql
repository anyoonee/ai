create table card(
    cardNumber number(10) not null PRIMARY KEY,
    accountNumber number(12) not null,
    cardKind varchar2(8),
    orderDate date,
    limitAmount number(15),
    
    paymentDate date
);

insert into card values(
    1001,556677,'비자',sysdate,5000,'24/01/27'
    
);
insert into card values(
    1002,556677,'비자',sysdate,5000,'24/01/27'
    
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

--교재121쪽
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
    
    insert into userTbl values('이승기','87/12/10','서울','011-111-1111');
    insert into userTbl values('김경호','71/12/10','전남','011-122-1111');
    
    insert into buyTbl values('이승기','운동화',10000,1);
    insert into buyTbl values('김경호','노트북',1000000,2);
    
-- 은행 부모, master, 주
create table bank(
    bankName varchar2(20) not null primary key,
    jijum varchar2(20) not null);

insert into bank values('국민','강동');
insert into bank values('신한','강남');
insert into bank values('우리','송파');

--예금계좌 테이블자식, sub,
create table deAcc(
    bankName varchar2(20) not null primary key,
    accKind varchar2(20),
    constraint bankName_fk foreign key(bankName) references bank(bankName) 
--  constraint  외래키명  foreign key(외래키대상칼럼명) references 부모테이블명                        
  );  
    
insert into deAcc values('우리','일반계좌');
insert into deAcc values('신한','대출계좌');
insert into deAcc values('국민','증권계좌');

-- 고객테이블 -부모,주,master
create table custom(
    cardNumber number(10) not null primary key,
    cName varchar2(20)
     
);

--카드테이블 - 자식, sub, 종
create table cardTbl(
    cardNumber number(10) not null primary key,
    limitPrice number(10),
    constraint cardNumber_fk foreign key(cardNumber) references custom(cardNumber)
    );
    
insert into custom values(1234,'홍길동');
insert into custom values(1235,'이순신');
insert into custom values(1236,'김명자');

    
select * from custom;
select * from buyTbl;

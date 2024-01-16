use employees;

create table backup_userTbl 
 (
  userID     CHAR(8) NOT NULL PRIMARY KEY, -- 사용자 아이디(PK)
  name       VARCHAR(10) NOT NULL, -- 이름
  birthYear   INT NOT NULL,  -- 출생년도
  addr        CHAR(2) NOT NULL, -- 지역(경기,서울,경남 식으로 2글자만입력)
  mobile1   CHAR(3), -- 휴대폰의 국번(011, 016, 017, 018, 019, 010 등)
  mobile2   CHAR(8), -- 휴대폰의 나머지 전화번호(하이픈제외)
  height       SMALLINT,  -- 키
  mDate       DATE,  -- 회원 가입일
  modType char(2), -- 변경된 타입, '수정' 또는 '삭제'
  modDate date, -- 변경된 날짜
  modUser varchar(256) -- 변경한 사용자 
 ) ;

 -- 트리거 작성
 delimiter //
 create trigger but
	after update
    on userTbl
    for each row
begin
	insert into backup_userTbl
    values(OLD.userId,OLD.name, OLD.birthYear, old.addr, old.mobile1,old.mobile2,old.height,old.mDate,'수정', curdate(), current_user());
    
end //
delimiter ;

select * from userTbl;
update userTbl set birthYear = 1977 where userId='BBK';
update userTbl set addr = '서울' where userId='EJW';
select * from backup_userTbl;

use employees;
-- 467쪽
-- 삭제가 발생했을때
delimiter //
	create trigger bud -- 언제 누구에게
		after delete  
        on usertbl
        for each row -- 각각의 행위
	begin
		insert into backup_userTbl
        values(OLD.userId,OLD.name, OLD.birthYear, old.addr, old.mobile1,old.mobile2,
			   old.height,old.mDate,'삭제', curdate(), current_user());
    end //
    
delimiter ;

select * from usertbl;
delete from usertbl where userid = 'YJS';

select * from backup_userTbl;

drop trigger bud;
-- 469쪽
-- 삽입 후 경고오류 발생 시키고 경고메세지 
delimiter //
	create trigger bud -- 언제 누구에게
		after insert 
        on usertbl
        for each row -- 각각의 행위
	begin
		signal sqlstate '45000'
			set message_text = '데이터에 입력을 시도했습니다. 귀하의 정보가 서버에 기록되었습니다.';
    end //
delimiter ;
select * from usertbl;

insert into usertbl values('CCC','에비씨',1977,'서울','011','1111111',181,'2019-12-25','잠재고객');

-- before 트리거
drop trigger ubi;
-- old 변경되기 전에 자료, new 변경되고 난 후 자료
-- 요구사항 - 입력할 때 생일 잘못입력되지 않도록 1900 이전 입력하면 0 입력 또는 올해 년도보다 이후의 년도 입력되었으면 0
delimiter //
	create trigger ubi -- 언제 누구에게
		before insert 
        on usertbl
        for each row -- 각각의 행위
	begin
		if new.birthyear < 1900 then
			set new.birthYear = 0;
		elseif new.birthYear > year(curdate()) then
			set new.birthYear = year(curdate());
		end if;
    end //
delimiter ;

insert into usertbl values('DDD','디디디',1877,'서울','011','1111111',182,'2019-12-25','잠재고객');
insert into usertbl values('EEE','이디디',2877,'서울','011','1111111',182,'2019-12-25','잠재고객');
select * from usertbl;

-- 주소가 = 평양 이면  외국인
-- 전화번호가 999 면 010으로 바꾸기
delimiter //
	create trigger ubi2 -- 언제 누구에게
		before insert 
        on usertbl
        for each row -- 각각의 행위
	begin
		if new.addr = '평양' then
			set new.addr = '외국인';
		elseif new.mobile1 = '999' then
			set new.mobile1 = '010';
		end if;
    end //
delimiter ;
insert into usertbl values('FFF','에디디',2000,'서울','011','1111111',183,'2019-12-25','잠재고객');
insert into usertbl values('GGG','지디디',2010,'서울','011','1111111',185,'2019-12-25','잠재고객');
select * from usertbl;

show triggers from employees;

-- 다중 트리거
-- 구매 1 물품테이블 -1 배송테이블 +1
-- 478
drop database if exists triggerDb;
create database if not exists triggerDb;
use triggerDb;

create table orderTbl ( 
	orderNo int auto_increment primary key,
    userId varchar(5),
    prodName varchar(5),
    orderamount int);
-- 물품테이블
create table prodTbl(
	prodName varchar(5),
	account int);
-- 배송테이블
create table deliberTbl(
	deliverNo int auto_increment primary key,
    prodName varchar(5),
    account int);
-- 물품테이블에 물건을 삽입하기
insert into prodTbl values ('사과',100);
insert into prodTbl values ('배',100);
insert into prodTbl values ('귤',100);

select * from prodTbl;

drop trigger orderTg;
-- 트리거
delimiter //
create trigger orderTg
	after insert
    on orderTbl
    for each row
begin
	update prodTbl set account = account - new.orderamount where prodName = new.prodName;
end //
delimiter //

-- 요구사항 물품테이블을 업데이트 된 후에 배송테이블에 삽입하기
delimiter //
create trigger prodTg
	after update
    on prodTbl
    for each row
begin
	declare orderAmount int; -- 변수선언
    set orderAmount = OLD.account - New.account; -- 100 -95 =5
    insert into deliverTbl values (null, new.prodName, orderAmount);
end //
delimiter ;

--
select * from ordertbl;
desc ordertbl;
insert into ordertbl values(null,'BBK','사과',5);

show triggers;

-- stored procedure progranm
-- 설계 --> 인스턴스화 --> 사용
use employees;
-- 기본적인 형식
delimiter $$
create procedure userProc()
begin
	select * from usertbl where addr = '서울';
end $$
delimiter ;

call userProc();

drop procedure userProc1;
desc usertbl;
delimiter $$
create procedure userProc1(in _addr char(2))
begin
	select * from usertbl where addr = _addr;
end $$
delimiter ;

call userProc1('서울');

drop procedure userProc2;
-- userId DDB또는 LJB 검색하기
delimiter $$
create procedure userProc2(in _UserId1 varchar(10), in _UserId2 varchar(10))
begin
	select * from usertbl where userId in( _UserId1, _UserId2);
end $$
delimiter ;

call userProc2('BBK','LJB');

drop procedure userProc3;
-- 파라미터 값을 내보내기
-- 서울에 사는 사람이 몇명인지 변수에 담아 외부로 내보내기
delimiter $$
create procedure userProc3(in _addr char(2), out _result int)
begin
	select count(addr) into _result from usertbl where addr= _addr;
end $$
delimiter ;

call userProc3('서울', @_result);
select @_result;

select * from buytbl;

drop procedure buyProc1;

-- groupName을 입력하면 price 값이 가장 큰것을 찾기, 변수로 받기
delimiter $$
create procedure buyProc1(in _gN char(10), out _price int)
begin
	select max(price) into _price from buytbl where groupName = _gN;
end $$
delimiter ;

call buyProc1('전자', @priceVar);
call buyProc1('의류', @priceVar);
select @priceVar 

delimiter $$
create procedure buyProc2(in _gN char(4),out _pN char(6), out _price int)
begin
	/* 여러개의 출력값은 select 문 여러개 사용 */
	select distinct prodName into _pN from buytbl where groupName = _gN;
	select max(price) into _price from buytbl where groupName = _gN;
end $$
delimiter ;

call buyProc2('의류', @pNVar, @priVar);
select @pNVar, @priVar; 

drop procedure  buyPro2;

delimiter $$
create procedure  buyPro2( in _gN  char(4), out _pN char(6),  out _price int )
begin 
  /* 여러개의 출력값을 얻으려면 select문을 여러개 쓰기 */ 
  select prodName into _pN from buytbl where groupName = _gN 
       group by prodName 
       order by max(price) desc limit 1;
  select  max(price) into _price from buytbl where  groupName = _gN ;
   
end $$
delimiter ;

call buyPro2( '전자', @pNVar, @priVar) ;
select @pNVar, @priVar; 

call buyPro2( '의류', @pNVar, @priVar) ;
select @pNVar, @priVar; 

call buyPro2( '서적', @pNVar, @priVar) ;
select @pNVar, @priVar; 

-- 2) procedure function 함수 결과 1개 나온다 return 452p
-- 주의사항: 사전에 해야되는 작업 - 함수 생성권한 제한 풀기
set global log_bin_trust_function_creators =1;
-- 기본예
delimiter $$ 
create function userFun1(v1 int, v2 int) -- 입력 해줄 자료형
returns int -- 출력해 줄 자료형 선언
begin
	return v1 + v2;
end $$;
delimiter ;

select userFun1(100,200); -- 실행은 select 문으로 하기

-- 요구사항 출생년도를 입력하면 나이가 생성되는 함수 만들기
delimiter $$
create function ageF(birth int)
returns int
begin
	declare age int;
    set age = year (curdate()) - birth;
    return age;
end $$
delimiter ;

select ageF(2000) into @age2000;
select ageG(2020) into @age2020;
select @age2000 - @age2020;

drop table cUserTbl;
create table cUserTbl
as
select * from usertbl;

select * from cUserTbl;

alter table cUserTbl
	add column years int; -- 칼럼 추가

-- 요구사항 mDate를 이용해 근무년수를 구하는 함수
-- 1단계 함수를 만든다.
drop function yearsFun;

delimiter $$
create function yearsFun(y1 date) -- mDate 컬럼 입력받기
	returns int
begin
	declare yy int;
    set yy = year(curdate()) - year(y1); -- 2024-2013 = 11
    return yy;
end $$
delimiter ;

desc cUserTbl;

-- 2단계 함수를 호출해서 근무년수를 구한다.
select mDate into @mDate from cUserTbl where userId='BBK';
select @mDate;

select yearsFun(@mDate) into @years;
select @years;

-- 3단계를 years 컬럼 update하기
update cUserTbl set years = @years where userId = 'BBK';

select * from cUserTbl;

-- 'EJW' 업데이트하기
select mDate into @mDate from cUserTbl where userId ='EJW';
select @mDate;

select yearsFun (@mDate) into @years;
select @years;

update cUserTbl set years = @years where userId ='EJW';
select * from cUserTbl;

-- 'KBS' 업데이트하기
select mDate into @mDate from cUserTbl where userId ='KBS';
select @mDate;

select yearsFun (@mDate) into @years;
select @years;

update cUserTbl set years = @years where userId ='KBS';
select * from cUserTbl;

-- 3) cursor 반복처리
-- 포인터 : 가르키다. 자동으로 한행을 읽으면 아래로 내려간다
-- 파일 시작 BOF : begin of File, EOF: End of file
-- 처리 순서 1단계 파일을 연다 2단계 파일을 읽는다 3단계 파일 끝 4단계 닫는다
-- fetch
-- 형식
-- delimiter $$
-- create procedure cursorProc()
-- begin
-- 	-- 변수 선언 6~10줄
--     -- 커서 선언 12줄
--     -- 반복 조건 15줄
-- 	-- 커서 열기 
--     -- 반복문
--     -- 결과 출력 
--     -- 커서 닫기
-- end $$
-- delimiter ;

-- 호출하기

delimiter $$
create procedure cursorProc()
begin
	-- 변수 선언 6~10줄
    declare userHeight int; -- 고객의 키
    declare cnt int default 0; -- 고객의 인원수
    declare totalHeight int default 0; -- 키의 합계
    declare endOfRow boolean default false;
    -- 커서 선언 12줄
    de
    -- 반복 조건 15줄
	-- 커서 열기 
    open userCursor;
    -- 반복문
    cursor_loop : Loop
		fetch userCursor into userHeight;
        if endOfRow then
			leave cursor_loop; -- leave 반복문에 빠져라
		end if;
        set cnt = cnt +1;
        set totalHeight = totalHeight + userHeight;
	end loo cursor_loop;
    -- 결과 출력 
    select concat('고객 키의 평균 ===>',(totalHeight/cnt));
    -- 커서 닫기
    close userCursor;
end $$
delimiter ;

-- 호출하기
call cursorProc();

-- 
use employees;
select * from usertbl;
create table rankUt as select * from userTbl;

alter table rankUt
	add column r1 varchar(20); -- 컬럼 추가하기 r1안에 최우수고객/우수고객/일반고객/유령고객

drop procedure gP;

delimiter $$
create procedure gP()
begin
	-- 변수 선언 6~10줄
    declare id varchar(10); -- 사용자 id
    declare hap bigInt; -- 총구매합 1920
    declare userGrade varchar(20);	-- 등급'최우수고객'
    declare endOfRow boolean default false;
    
    -- 커서 선언 12줄
    declare userCursor cursor for
		select u.userid, sum(b.price * b.amount)
        from buytbl b
			right outer join rankUt u 
            on b.userid = u.userid
		group by u.userid, u.name;
        
    -- 반복 조건 15줄
    declare continue handler for not found set endOfRow = TRUE;
    
	-- 커서 열기 
    open userCursor;
    
    -- 반복문
    grade_loop : Loop
		fetch userCursor into id, hap;
        if endOfRow then 
			leave grade_loop;
		end if;
        
		case
			when (hap>=1500) then set userGrade='최우수고객';
			when (hap>=1000) then set userGrade='우수고객';
			when (hap>=1) then set userGrade='일반고객';
			else set userGrade='잠재고객';
		end case;
        
    update userTbl set r1 = userGrade where userId = id;
	end Loop grade_loop;
    -- 결과 출력 
    
    -- 커서 닫기
    close userCursor;
end $$
delimiter ;

call gP();
    
select * from userTbl;

alter table userTbl add column r1 varchar(20);
    
-- 4) 트리거
-- 예) 인적사항이 자동으로 입력 , 급여 지급된 후 세금 테이블에 자동 저장
-- 사용은 insert update delete
-- 이벤트 발생시 직접 실행 안됨

create database if not exists testDB;
use testDB;

create table if not exists testTbl (id int, txt varchar(10));
insert into testTbl values (1,'레드벨벳');
insert into testTbl values (2,'잇지');
insert into testTbl values (3,'블랙핑크');
select * from testTbl;

drop trigger if exists testTrg;

delimiter //
	create trigger testTrg
		after delete
        on testTbl
        for each now
	begin
		set @msg = '가수 그룹이 삭제됩니다';
	end
delimiter ;

set @msg='';
insert into testTbl values(4,'마마무');
select @msg;

update testTbl set txt = '마마마무' where id =4;
select @msg;

delete from testTbl where id =4;
select @msg;

--
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
create table deliverTbl(
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
insert into ordertbl values(null,'KBS','배',10);
show triggers;


-- 596 14장 지리 정보 시스템
-- mysql 5.0이후 geometry 자료형 지원함

DROP DATABASE IF EXISTS GisDB;
CREATE DATABASE GisDB;
USE GisDB;

CREATE TABLE StreamTbl (
   MapNumber CHAR(10),  -- 지도일련번호
   StreamName CHAR(20),  -- 하천이름
   Stream GEOMETRY ); -- 공간데이터(하천개체)

INSERT INTO StreamTbl VALUES ( '330000001' ,  '한류천', 
   ST_GeomFromText('LINESTRING (-10 30, -50 70, 50 70)'));
INSERT INTO StreamTbl VALUES ( '330000001' ,  '안양천', 
   ST_GeomFromText('LINESTRING (-50 -70, 30 -10, 70 -10)'));
INSERT INTO StreamTbl VALUES ('330000002' ,  '일산천', 
   ST_GeomFromText('LINESTRING (-70 50, -30 -30, 30 -60)'));
select * from StreamTbl;

CREATE TABLE BuildingTbl (
   MapNumber CHAR(10),  -- 지도일련번호
   BuildingName CHAR(20),  -- 건물이름
   Building GEOMETRY ); -- 공간데이터(건물개체)

INSERT INTO BuildingTbl VALUES ('330000005' ,  '하나은행', 
   ST_GeomFromText('POLYGON ((-10 50, 10 30, -10 10, -30 30, -10 50))'));
INSERT INTO BuildingTbl VALUES ( '330000001' ,  '우리빌딩', 
   ST_GeomFromText('POLYGON ((-50 -70, -40 -70, -40 -80, -50 -80, -50 -70))'));
INSERT INTO BuildingTbl VALUES ( '330000002' ,  '디티오피스텔', 
   ST_GeomFromText('POLYGON ((40 0, 60 0, 60 -20, 40 -20, 40 0))'));
select * from BuildingTbl;

SELECT * FROM StreamTbl WHERE ST_Length(Stream) > 140 ;
SELECT BuildingName, ST_AREA(Building) FROM BuildingTbl 
   WHERE ST_AREA(Building) < 500;
   
SELECT * FROM StreamTbl
UNION ALL
SELECT * FROM BuildingTbl;

SELECT StreamName, BuildingName, Building, Stream
   FROM BuildingTbl , StreamTbl 
   WHERE ST_Intersects(Building, Stream) = 1   AND StreamName = '안양천';
SELECT ST_Buffer(Stream,5) FROM StreamTbl;

DROP DATABASE IF EXISTS KingHotDB;
CREATE DATABASE KingHotDB;

USE KingHotDB;

-- [왕매워 짬뽕] 체인점 테이블 (총 매출액 포함)
CREATE TABLE Restaurant
(restID int auto_increment PRIMARY KEY,  -- 체이점 ID
 restName varchar(50),           -- 체인점 이름
 restAddr varchar(50),           -- 체인점 주소
 restPhone varchar(15),           -- 체인점 전화번호
 totSales  BIGINT,              -- 총 매출액         
 restLocation geometry ) ;           -- 체인점 위치
 
 -- [왕매워 짬뽕] 1호점~9호점 입력
INSERT INTO Restaurant VALUES
 (NULL, '왕매워 짬뽕 1호점', '서울 강서구 방화동', '02-111-1111', 1000, ST_GeomFromText('POINT(-80 -30)')),
 (NULL, '왕매워 짬뽕 2호점', '서울 은평구 증산동', '02-222-2222', 2000, ST_GeomFromText('POINT(-50 70)')),
 (NULL, '왕매워 짬뽕 3호점', '서울 중랑구 면목동', '02-333-3333', 9000, ST_GeomFromText('POINT(70 50)')),
 (NULL, '왕매워 짬뽕 4호점', '서울 광진구 구의동', '02-444-4444', 250, ST_GeomFromText('POINT(80 -10)')),
 (NULL, '왕매워 짬뽕 5호점', '서울 서대문구 북가좌동', '02-555-5555', 1200, ST_GeomFromText('POINT(-10 50)')),
 (NULL, '왕매워 짬뽕 6호점', '서울 강남구 논현동', '02-666-6666', 4000, ST_GeomFromText('POINT(40 -30)')),
 (NULL, '왕매워 짬뽕 7호점', '서울 서초구 서초동', '02-777-7777', 1000, ST_GeomFromText('POINT(30 -70)')),
 (NULL, '왕매워 짬뽕 8호점', '서울 영등포구 당산동', '02-888-8888', 200, ST_GeomFromText('POINT(-40 -50)')),
 (NULL, '왕매워 짬뽕 9호점', '서울 송파구 가락동', '02-999-9999', 600, ST_GeomFromText('POINT(60 -50)'));

SELECT restName, ST_Buffer(restLocation, 3) as '체인점' FROM Restaurant;

-- 지역 관리자 테이블
CREATE TABLE Manager
 (ManagerID int auto_increment PRIMARY KEY,   -- 지역관리자 id
  ManagerName varchar(5),                 -- 지역관리자 이름
  MobilePhone varchar(15),                 -- 지역관리자 전화번호
  Email varchar(40),                      -- 지역관리자 이메일
  AreaName varchar(15),                 -- 담당지역명
  Area geometry SRID 0) ;                       -- 담당지역 폴리곤
  
  INSERT INTO Manager VALUES
 (NULL, '존밴이', '011-123-4567', 'johnbann@kinghot.com',  '서울 동/북부지역',
   ST_GeomFromText('POLYGON((-90 0, -90 90, 90 90, 90 -90, 0 -90, 0  0, -90 0))')) ,
 (NULL, '당탕이', '019-321-7654', 'dangtang@kinghot.com', '서울 서부지역',
   ST_GeomFromText('POLYGON((-90 -90, -90 90, 0 90, 0 -90, -90 -90))'));

SELECT ManagerName, Area as '당탕이' FROM Manager WHERE ManagerName = '당탕이';
SELECT ManagerName, Area as '존밴이' FROM Manager WHERE ManagerName = '존밴이';


-- 서울시의 도로 테이블
CREATE TABLE Road
 (RoadID int auto_increment PRIMARY KEY,  -- 도로 ID
  RoadName varchar(20),           -- 도로 이름
  RoadLine geometry );              -- 도로 선
  
  INSERT INTO Road VALUES
 (NULL, '강변북로',
   ST_GeomFromText('LINESTRING(-70 -70 , -50 -20 , 30 30,  50 70)'));

SELECT RoadName, ST_BUFFER(RoadLine,1) as '강변북로' FROM Road;

SELECT ManagerName, Area as '당탕이' FROM Manager WHERE ManagerName = '당탕이';
SELECT ManagerName, Area as '존밴이' FROM Manager WHERE ManagerName = '존밴이';
SELECT restName, ST_Buffer(restLocation, 3) as '체인점' FROM Restaurant;
SELECT RoadName, ST_BUFFER(RoadLine,1) as '강변북로' FROM Road;

SELECT ManagerName, AreaName, ST_Area(Area) as "면적 m2" FROM Manager;

SELECT M.ManagerName,
       R.restName,
       R.restAddr,
       M.AreaName 
FROM Restaurant R, Manager M
WHERE ST_Contains(M.AREA, R.restLocation) = 1 
ORDER BY M.ManagerName;

SELECT R2.restName,
       R2.restAddr,
       R2.restPhone, 
       ST_Distance(R1.restLocation, R2.restLocation) AS "1호점에서 거리"
FROM Restaurant R1, Restaurant R2
WHERE R1.restName='왕매워 짬뽕 1호점'
ORDER BY ST_Distance(R1.restLocation, R2.restLocation) ;

SELECT Area INTO @eastNorthSeoul FROM Manager WHERE AreaName = '서울 동/북부지역';
SELECT Area INTO @westSeoul FROM Manager WHERE AreaName = '서울 서부지역';
SELECT ST_Union(@eastNorthSeoul, @westSeoul) AS  "모든 관리지역을 합친 범위" ;
-- ST_Union() 두 도형을 합한 결과 좌표 집합을 구한다.

SELECT  Area INTO @eastNorthSeoul FROM Manager WHERE ManagerName = '존밴이';
SELECT  Area INTO @westSeoul FROM Manager WHERE ManagerName = '당탕이';
SELECT  ST_Intersection(@eastNorthSeoul, @westSeoul) INTO @crossArea ;
SELECT DISTINCT R.restName AS "중복 관리 지점"
    FROM Restaurant R, Manager M
    WHERE ST_Contains(@crossArea, R.restLocation) = 1;


SELECT  ST_Buffer(RoadLine, 30) INTO @roadBuffer FROM Road;
SELECT R.restName AS "강변북로 30M 이내 지점"
   FROM Restaurant R
   WHERE ST_Contains(@roadBuffer,R.restLocation) = 1;

SELECT  ST_Buffer(RoadLine, 30) INTO @roadBuffer FROM Road;
SELECT  ST_Buffer(RoadLine, 30) as '강변북로 30m' FROM Road;
SELECT  ST_Buffer(R.restLocation, 5) as '체인점' -- 지점을 약간 크게 출력
   FROM Restaurant R
   WHERE ST_Contains(@roadBuffer, R.restLocation) = 1;
SELECT RoadLine as '강변북로' FROM Road;

-- </실습 3> --





  
  











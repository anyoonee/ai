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














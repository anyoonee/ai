use employees;
drop table if exists testtbl4;
select * from buytbl;
-- 요구사항 : 상품명 , 가격 테이블 만들기
-- 1.테이블 생성
create table if not exists testtbl4 (prodName varchar(40) not null, price int not null);
-- 2. 삽입
select distinct prodName, price from buytbl;
insert into testtbl4 select distinct prodName, price from buytbl;

select * from testtbl4;

select * from testtbl4 order by price desc;
-- 청바지 가격을 100으로 수정하기
update testtbl4 set price=100 where prodName='청바지';
-- 가장 높은 가격을 찾아서 10%인하하기
-- update 시 동일테이블 서브쿼리 사용불가능
update testtbl4 set price = price - price * 0.1 where price=(select price from (select price from testtbl4 order by price desc limit 0,1)as t);
with tempTbl(price1) as(select price from testtbl4 order by price desc limit 1) update testtbl4 set price = price - price * 0.1;
-- delete문
select * from buytbl;
-- buytbl amount가 제일작은것 삭제하기
delete from buytbl where amount = min(mount) and num=2;

create table copyBuy select * from buytbl;

-- copyBuy amount가 제일작은것 찾아서 삭제
select amount from copyBuy order by amount asc limit 1;
delete from copyBuy where amount=(select amount from (select amount from copyBuy order by amount asc limit 1) as t);

select * from copyBuy;

-- 1. with절 사용하기 229
-- 뷰, 파생테이블, 임시테이블, 가상테이블 : 잠깐 쓰고 버리기(메모리에서 삭제)
select * from usertbl;
select * from buytbl;

-- 이름 총 구매액(price * amount)
select userid, sum(price)* sum(amount) as '총구매액' from buytbl group by userID;
select name from usertbl;

with t (tid,total) as (select userid, sum(price)* sum(amount) as '총구매액' from buytbl group by userID) select * from t ;

with  t( tid, total ) as (select userid, sum( price  * amount) from buytbl group by userId) select tid, total from t ; 

select * from usertbl, buytbl; -- usertbl, buytbl 행이 모두 곱해져 나옴
select * from usertbl, buytbl where usertbl.userid = buytbl.userid; -- 교집합

-- userid, name, amount, price 두개 테이블에 각각 다른 항목 검색
select usertbl.userid, usertbl.name, buytbl.amount, buytbl.price from usertbl, buytbl where usertbl.userid = buytbl.userid;
-- select usertbl.name, buytbl.amount*buytbl.price from usertbl, buytbl where usertbl.userid = buytbl.userid group by buytbl.userid; 에러발생
-- 위 쿼리 가상테이블 만들기
with t(id,name,total) as (select u.userid, u.name, b.amount * b.price from usertbl u, buytbl b where u.userid = b.userid) select name, sum(total) from t group by name;

-- 각지역별로 가장 큰키를 1명씩 뽑아 그사람들의 키평균
select addr,max(height) from  usertbl group by addr;
with t(avgHeight) as (select max(height) from usertbl group by addr) select avg(avgHeight) from t;

with t(minprice) as (select min(price) from buytbl group by groupName) select avg(minprice) from t;

-- 7장 SQL 고급 238--
select cast('2020-10-19 12:35:29.123' as date) ; -- cast() 형변환 함수
select cast('2020-10-19 12:35:29.123' as time) ;
select cast('2020-10-19 12:35:29.123' as datetime) ;

set @var1 =10;
set @var2='제품판매처 : 삼성';
select @var2,@var1;
select @var2, prodName from buytbl;

-- 데이터 형 변환 cast(), convert()
select * from buytbl;
select avg(amount) from buytbl;
-- 실수형을 정수형으로 변환하기
select cast(avg(amount) as signed integer) from buytbl;
select convert(avg(amount) , signed integer) from buytbl;

-- 정수형을 실수형으로 변환
set @var3 =3;
select cast(@var3 as Float);
select convert(@var3, Float);
-- 정수형을 문자형으로 변환
select cast(@var3 as Float);
select convert(@var3, Float);

-- 246
select '100' + '200';
select concat('100','200');
select concat(100,'200');
select 1>'2mega'; -- 거짓이여서 0
select 3>'2mega'; -- 참이니까1
select 0 = 'mega0'; -- 문자는 0으로 바뀌므로 0=0

-- if 함수alter
-- select if(조건, 참, 거짓)

set @v1 =10;
set @v2 =20;
set @v3 =0;

-- 가장 큰 수 구하기 답 20
select if(@v1>@v2, if(@v1>@v3, @v1,@v3), if(@v2>@v3,@v2,@v3));
-- 가장 작은 수 구하기
select if(@v1 <@v2, if(@v1<@v3,@v1,@v3), if(@v2<@v3,@v2,@v3));
-- 중간 수 구하기
select if(@v1<@v2, if(@v1>@v3,@v1,@v3), if(@v2>@v3,@v2,@v3));

-- ifnull(수식1, 수식2)
select ifnull(null,100);
select ifnull(200,null);
select ifnull(200,300);
select ifnull(null,ifnull(null,300));
-- nullif(수식1, 수식2)
select nullif(100,100);
select nullif(200,100);

-- case when else end
select case 1 when 1 then'일' when 2 then '이' when 3 then '삼' else '1,2,3이 아님' end as 'case 연습';

-- 자바
-- switch @v1 {
-- 	case 1: print('일'); break;
--     case 2: print('이'); break;
--     case 3: print('삼'); break;
--     default : print('1,2,3이 아님');
-- }

select case userId when 'KBS' then '김범수' when 'JYP' then '조용필' else '모름' end as '이름', userId from buytbl;

-- 문자열 함수
-- concat()
-- concat_ws(구분자,문자열1,문자열2)
select concat_ws(',','100','200');
select elt(1,'하나','둘','셋');
select field('김','이','박','최','김');
select find_in_set('김','이,박,최,김,송');
select instr('이,박,최,김,송','김');
select locate('김','이,박,최,김,송');

select format(123456.123456,4);

select hex(10), oct(8), bin(15);

select insert('abcdefghi', 3,4,'0000');

select trim('        abc             ');

select substring('대한민국',3,2);
select substring_index('cafe.naver.com','.',2);

set @v = 'cafe.naver.com';
set @v2 = substring_index(@v,'.',4);
select @v2;

set @v3 = substring_index(@v2, '.',-2);
select @v3;
set @v4 = substring_index(@v3, '.',1);
select @v4;

set @v10 = 'a,b,c,d,e';
 -- b 출력
 set @v11 = substring_index(@v10,',',2);
 select @v11;
 set @v12 = substring_index(@v11,',',-1);
 
 -- 숫자함수
 select ceiling(4.1), floor(4.7), round(4.7);
 select pow(2,10);
 
-- 기억 공간 단위
-- bit < 8bit = 1byte < 1024byte = 1kb < 1024kb = 1 megaByte < 1024mb =1gb
-- 1024gb - 1tb(terabyte) < 1024tb = 1hb (herabyte)
select rand(), floor(1+(rand() * (7-1)));

-- 1,235,456,577 천원이하 절삭
select truncate(12345677,-3);

-- 날짜, 시간 함수
select mdate, adddate(mdate, interval 31 day) from usertbl;
select date(now()), time(now()), now();
select sysdate();
-- 261 대용량 파일 처리하기
create database moviedb;
use moviedb;
create table movietbl(movie_id int, movie_title varchar(30), movie_director varchar(20), movie_star varchar(20), movie_script longtext, -- 대본
					movie_film longblob) default charset=utf8mb4;
insert into movietbl values ( 1, '쉰들러리스트','스필버그','리암니슨',load_file('D:/ai/교육/오라클교재/movies/Schindler.txt'),load_file('D:/ai/교육/오라클교재/movies/Schindler.mp4'));
select * from movietbl;
-- movie_script와 movie_file 이 null이 나온 이유
show variables like 'max_allowed_packet'; -- 패킷 크기 확인
show variables like 'secure_file_priv'; -- mysql 지정경로 확인





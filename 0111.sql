-- 1단계: 데이터베이스 만들기
create database moviedb;
-- 2단계: 데이터베이스 사용
use moviedb;
-- 3단계: 테이블 만들기
create table movietbl (   
   movie_id int,
    movie_title varchar(20),
    movie_director varchar(20),
    movie_star varchar(20),
    movie_script longtext,
    movie_film longblob
);
-- 4단계: 행을 삽입
insert into movietbl values 
(1, '쇤들러리스트', '스필버그', '리암니슨', load_file('D:/ai/temp/movies/Schindler.txt'),load_file('D:/ai/temp/movies/Schindler.mp4'));
-- 5단계: select문으로 검색
select*from movietbl;
-- longtext, longblob가 null이 나오는 이유 
-- > 용량이 모자라서movietblmovietbl
show variables like 'max_allowed_packet';
-- > 경로가 잘못되서
show variables like 'secure_file_priv';
-- 환경설정하기

-- 피벗의 구현
use employees;
select * from usertbl;
select * from buytbl;

create table pivotTest( uName char(3), season char(2), amount int);
insert into pivotTest values ('김범수','겨울',10), ('윤종신','여름',15),('김범수','가을',25),('윤종신','가을',25),('김범수','여름',25),('윤종신','봄',5),('김범수','봄',15),('윤종신','겨울',35);
select * from pivotTest;
select uname 이름, sum(if(season='봄',amount,0)) '봄',
				  sum(if(season='여름',amount,0))'여름',
                  sum(if(season='가을',amount,0)) '가을',
                  sum(if(season='겨울',amount,0)) '겨울',
                  sum(amount)'합계'from pivotTest group by uName;

-- 270p
select season, sum(if(uname='김범수',amount,0)) '김범수' ,
			   sum(if(uname='윤종신',amount,0)) '윤종신',
               sum(amount) '합계' from pivotTest group by season;
               
-- json 파일 처리하기
-- json.array()
select json_array(1,"abc",Null,True,curtime());
-- json_object()
select json_object("score",87,"name","hong","age",25);

set @jsonDate=json_object("score",87,"name","hong","age",25);
select @jsonData;
use employees;
select * from usertbl;
-- 키 userid,addr 값 json 만들기
select json_object(userid,addr) from usertbl;
-- 키 userid,값[010,000000] 형태로 json만들기
select json_object(userid,json_array(mobile1,mobile2)) from usertbl into outfile 'D:/ai/study_temp/oracle/movies/jsonOutput.json';
-- 자료형이 json인지 판단하기
select @jsonData = json_object("score",87,"name","hong","age",25);
select json_valid(@jsonData); -- json

select if(json_valid(@jsonData)=1,
		'json자료다','json자료가 아니다');
        

-- json 자료안에 값을 검색하기
set @j = '["abc",[{"k":"10"},"def"],{"x":"abc"},{"y":"bcd"}]';

select json_search(@j,'all','10'); -- 못찾으면 null 반환, 찾으면 리스트 위치 알려준다.

-- json extract()

-- json_insert
set @j = '["a",{"b":[1,2]},[3,4]]';
select json_insert(@j,'$.a',10); -- 키가 새것이면 삽입
select json_insert(@j,'$.a',10); -- 키가 이미 있으면 삽입되지 않는다.
select json_insert(@j,'$.b',[2,3,4]); -- 

set @j='{"a":1,"b":[2,3]}';
select json_replace(@j,'$.a',10); -- 키가 있으면 수정하기
select json_replace(@j,'$.c',10); -- 키가 없으면 아무것도 안하기

-- 조인
select * from usertbl;
select * from buytbl;

select * from usertbl
	inner join buytbl
    on usertbl.userid = buytbl.userid;

select usertbl.name, buytbl.prodName from usertbl
	inner join buytbl
    where birthyear between 1970 and 1980;

select usertbl.name, buytbl.prodName from usertbl
	inner join buytbl
    where birthyear between 1970 and 1980 order by usertbl.name;
    
select u.name, b.prodName from usertbl u
		inner join buytbl b
        on u.userid = b.userid
        where u.userid='BBK';

-- 282
create table stdTbl(
stdName varchar(10) not null primary key,
addr char(4) not null
);
create table clubTbl(
clubName varchar(10) not null primary key,
roomNo char(4) not null
);
create table stdclubTbl(
num int auto_increment not null primary key,
stdName varchar(10) not null,
clubName varchar(10) not null,
foreign key(stdName) references stdTbl(stdName),
foreign key(clubName) references clubTbl(clubName)
);
insert into stdTbl values ('김범수','경남'),('성시경','서울'),('조용필','경기'),('은지원','경북'),('바비킴','서울');
insert into clubTbl values ('수영','101호'),('바둑','102호'),('축구','103호'),('봉사','104호');
insert into stdclubTbl values (null,'김범수','바둑'),(null,'김범수','축구'),(null,'조용필','축구'),(null,'은지원','봉사'),(null,'바비킴','봉사');
    
select * from stdTbl;
select * from clubTbl;
select * from stdclubTbl;

-- 학생 기준으로 학생 이름, 지역, 가입한 동아리, 동아리방 보기
select s.stdName, s.addr,c.clubName,c.roomNo from stdTbl s inner join stdclubTbl sc on s.stdName = sc.stdName inner join clubTbl c on sc.clubName = c.clubName;
-- 축구를 선택한 사람의 이름과 지역?
select s.stdName, s.addr from stdTbl s inner join stdclubTbl sc on s.clubName = sc.clubName inner join clubTbl c on sc.clubName=c.clubName where sc.clubName='축구';
-- 은지원이 선택한 동아리와 동아리방은?
select c.clubName,c.roomNo from clubTbl c inner join stdclubTbl sc on c.clubName = sc.clubName inner join stdTbl s on sc.stdName=s.stdName where sc.stdName='은지원';
-- 서울지역에 사는 사람이 선택한 동아리명은?
select s.stdName, sc.clubName from stdTbl s inner join stdclubTbl sc on s.stdName = sc.stdName inner join clubTbl c on sc.clubName=c.clubName where s.addr='서울';
-- 동아리방 101호, 102호를 사용한 사람들의 이름?
select c.roomNo, s.stdName from stdTbl s inner join stdclubTbl sc on s.stdName = sc.stdName inner join clubTbl c on sc.clubName = c.clubName where c.roomNo in('101호','102호');

-- outer join
-- 조인에 만족하지 않는 행까지 포함하기 null까지 포함하기
select * from stdTbl s left outer join stdclubTbl sc on s.stdName = sc.stdName;
select * from stdTbl s right outer join stdclubTbl sc on s.stdName = sc.stdName;
select * from stdTbl s left outer join stdclubTbl sc on s.stdName = sc.stdName left outer join clubtbl c on sc.clubName = c.clubName;
select  
   *
from stdtbl s
   left outer join stdclubtbl sc 
   on s.stdName = sc.stdName 
   left outer join clubtbl c 
   on sc.clubName = c.clubName 

union   

select  
   *
from stdtbl s
   left outer join stdclubtbl sc 
   on s.stdName = sc.stdName 
   right outer join clubtbl c 
   on sc.clubName = c.clubName;
   
   select s.stdNmae, sc.clubName from stdtbl s 
			left outer join stdclubTbl sc 
            on s.stdName = sc.stdName 
            left outer join clubTbl c 
            on sc.clubName=c.clubName where s.addr='서울';
            
select c.roomNo, s.stdName from stdTbl s 
		left outer join stdclubTbl sc 
        on s.stdName = sc.stdName 
        right outer join clubTbl c 
        on sc.clubName = c.clubName where c.roomNo in('101호','102호');
        
-- cross join 비강추
select * from stdTbl, stdclubTbl, clubTbl;

-- self 조인 
CREATE TABLE empTbl (emp CHAR(3), manager CHAR(3), empTel VARCHAR(8));

INSERT INTO empTbl VALUES('나사장',NULL,'0000');
INSERT INTO empTbl VALUES('김재무','나사장','2222');
INSERT INTO empTbl VALUES('김부장','김재무','2222-1');
INSERT INTO empTbl VALUES('이부장','김재무','2222-2');
INSERT INTO empTbl VALUES('우대리','이부장','2222-2-1');
INSERT INTO empTbl VALUES('지사원','이부장','2222-2-2');
INSERT INTO empTbl VALUES('이영업','나사장','1111');
INSERT INTO empTbl VALUES('한과장','이영업','1111-1');
INSERT INTO empTbl VALUES('최정보','나사장','3333');
INSERT INTO empTbl VALUES('윤차장','최정보','3333-1');
INSERT INTO empTbl VALUES('이주임','윤차장','3333-1-1');

select * from empTbl;

-- 우대리 연락처
select 
e1.empTel
from emptbl e 
inner join emptbl e1
on e.manager = e1.emp
where e.emp = '우대리';

select e2.empTel from empTbl e inner join emptbl e1 on e.manager = e1.emp inner join empTbl e2 on e1.manager = e2.emp where e.emp = '이주임';

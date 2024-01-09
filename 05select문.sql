use sqldb;
select * from usertbl;
-- userId 'BBK' 'JKW'
select * from usertbl where userid in ('BBK','JKW');
-- 김씨 성 가진사람 검색
select * from usertbl where name like'김%';
-- 은지원보다 나이가 어린사람?
select birthYear from usertbl where name ='은지원';
select * from usertbl where birthYear > (select birthYear from usertbl where name='은지원');
select * from buytbl;
-- prodName 노트북으 groupName 종류와 동일한 userId와 prodName,groupName검색
-- 결과는 kbs 노트북 전자/ jyp모니터 전자/ bbk모니터전자/ bbk 메모리전자
select gourpName from buytbl where prodName='노트북';
select userid,prodName,groupName from buytbl where groupName=(select groupName from buytbl where prodName='노트북');
-- 김범수가 산 물건은?
-- user_id?
select prodName,userid from buytbl where userId=(select userId from usertbl where name='김범수');
select * from usertbl;
-- 서울에 사는 사람의 키보다 작은 키를 가진 사람
select * from usertbl where addr ='서울';
select * from usertbl where height >= any(select height from usertbl where addr='서울');

select * from usertbl where addr ='서울'; -- all = and
select * from usertbl where height >= all(select height from usertbl where addr='서울');

select * from usertbl where addr ='서울'; 
select * from usertbl where height >= some(select height from usertbl where addr='서울');

-- 운동화산사람?
select name from usertbl where userid=any(select userId from buytbl where prodName='운동화');
-- 키가 제일큰사람 3명
select * from usertbl order by height desc limit 3;
-- 나이가 제일 많은 사람 5명
select * from usertbl order by birthyear asc limit 5;
-- 테이블 만들기 usertbl 동일한 테이블 생성
create table usertbl2(select * from usertbl);

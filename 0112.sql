use employees;
select * from usertbl;
select * from buytbl;

select userid, Name from usertbl union select userid,prodName from buytbl; -- 중복 제거
select userid, name from usertbl union all select userid, price from buytbl;
select * from usertbl where mobile1 is null;
select name, mobile1, mobile2 from usertbl where name not in (select * from usertbl where mobile1 is null);

-- SQL 구문을 프로그래밍처럼 가능
drop procedure if exists ifProc;
-- 스트어드 프로스저
delimiter $$
create procedure ifproc()
	begin declare var1 int;
		set var1=100;
		if var1=100 then 
	select '100입니다';
else
	select '아닙니다';
end if;
end $$
delimiter;

call ifProc();

use employees;
drop procedure if exists ifproc2;

delimiter $$
create procedure ifProc2()
begin
	declare hiredate date; -- 변수 선언 변수명 자료형
    declare curdate date;
    declare days int;
    
    select hire_date into hiredate from employees.employees
    where emp_no=1001;
    
    set curDate = current_date();
    set days = datediff(curDate, hiredate);
    
    if(days/365) <= 5 then
		select concat('입사한지',days,'일이나 지났습니다. 축하합니다');
        else 
        select concat('입사한지',days,'일밖에 안되었네요. 열심히 해요');
        end if;
end $$
delimiter ;

call ifProc();

-- 298, 299
drop procedure if exists ifProc3;
delimiter $$
create procedure ifProc3()
begin
declare point int;
set point=77;

if point >= 90 then
set credit = 'A';
elseif point >= 80 then
set credit = 'B';
elseif point >= 70 then
set credit = 'C';
elseif point >= 60 then
set credit = 'D';
else
set credit = 'F';
end if;
select concat('취득점수==>', point), concat('학점==>',credit);
end $$ 
delimiter ;
call ifProc3();

drop procedure if exists caseproc;
delimiter $$
create procedure caseproc()
begin
declare point int;
set point=77;

case
when point >= 90 then
set credit = 'A';
when point >= 80 then
set credit = 'B';
when point >= 70 then
set credit = 'C';
when point >= 60 then
set credit = 'D';
else
set credit = 'F';
end case;
select concat('취득점수==>', point), concat('학점==>',credit);
end $$ 
delimiter ;
call caseproc();

use employees;
select * from usertbl;
create view vuser
as 
select * from usertbl
inner join buytbl
on usertbl.userid = buytbl.userid;





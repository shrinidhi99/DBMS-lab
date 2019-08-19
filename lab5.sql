-- all about string operations in MySQL
create table student5(sid int, sname varchar(255));
alter table student5 add primary key(sid);
insert into student5 values(101, "shrinidhi");
insert into student5 values(102, "shreyas  ");
insert into student5 values(103, "shreyank");
insert into student5 values(104, "siddharth");
insert into student5 values(105, "shrinivas");
insert into student5 values(106, "aprameya");
insert into student5 values(107, "aaakash   ");
insert into student5 values(108, "avakash");
insert into student5 values(109, "deepak");
insert into student5 values(110, "keshav");

-- i)
select LEFT(sname, 3) as ExtractString from student5 where sid = 105;
-- ii)
select locate("aaa",sname) from student5;
-- iii)
select REVERSE(sname) FROM student5 where sid=107; 
-- iv)
select LENGTH(sname) as LengthOfName from student5;
update student5 set sname = RTRIM(sname);
-- v)
select LENGTH(sname) as LengthOfName from student5;
-- vi)
select UCASE(sname) as UppercaseStudentName from student5; 
update student5 set sname = UCASE(sname);
-- vii)
alter table student5 add IP_address varchar(20);
update student5 set IP_address = "10.1.0.14";
select SUBSTRING_INDEX(IP_address, ".", 1) from student5;
-- viii)
select REPLACE(sname, "AP", "XY") from student5;
-- ix)
select REPEAT(sname, 3) from student5 where sid = 108;
-- x)
select CONV(sid, 10, 16) from student5 where sid = 109; 
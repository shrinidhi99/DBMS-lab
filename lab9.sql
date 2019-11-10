create table student(SID varchar(5) primary key, Sname varchar(50), address varchar(100), DOB date);

create table registrations(SID varchar(5), CID varchar(5), FID varchar(5));

create table faculty(FID varchar(5) primary key, Fname varchar(50), Dept varchar(50));

insert into student values("S1", "Shrinidhi", "Blr", '1999-01-01');
insert into student values("S2", "Shrinidh", "Blra", '1999-02-01');
insert into student values("S3", "Shrinid", "Blrs", '1999-03-01');
insert into student values("S4", "Shrini", "Blrd", '1999-04-01');
insert into student values("S5", "Shrin", "Blrf", '1999-05-01');
insert into student values("S6", "Shri", "Blrg", '1999-06-01');
insert into student values("S7", "Shr", "Blrh", '1999-07-01');
insert into student values("S8", "Sh", "Blrj", '1999-08-01');
insert into student values("S9", "S", "Blrk", '1999-09-01');
insert into student values("S10", "Anonymous", "Blrl", '1999-10-01');

insert into registrations values("S1", "C1", "F1");
insert into registrations values("S2", "C2", "F2");
insert into registrations values("S3", "C3", "F3");
insert into registrations values("S4", "C4", "F4");
insert into registrations values("S5", "C7", "F5");
insert into registrations values("S6", "C8", "F6");
insert into registrations values("S7", "C7", "F7");
insert into registrations values("S8", "C6", "F8");
insert into registrations values("S9", "C4", "F9");
insert into registrations values("S10", "C3", "F10");
insert into registrations values("S1", "C7", "F1");
insert into registrations values("S1", "C6", "F2");
insert into registrations values("S2", "C5", "F3");
insert into registrations values("S3", "C2", "F4");
insert into registrations values("S4", "C2", "F5");
insert into registrations values("S5", "C8", "F6");
insert into registrations values("S10", "C1", "F7");

-- query 1

DELIMITER $$
 
create procedure query1(IN FID varchar(5))
BEGIN
    select CID from registrations where registrations.FID = FID;
END $$
 
DELIMITER ;

call query1("F2");

-- query 2

DELIMITER $$
 
create procedure query2()
BEGIN
    select student.SID, student.Sname from student inner join registrations on student.SID = registrations.SID where registrations.CID <> "C8";
END $$
 
DELIMITER ;

call query2();

-- query 3

create view v3 as select SID, CID from registrations;

-- query 4

create view NC8 as select student.SID, student.Sname from student inner join registrations on student.SID = registrations.SID where registrations.CID <> "C8";

-- query 5

DELIMITER $$

create procedure query5(IN FID varchar(5))
BEGIN
    select student.SID, student.Sname from student inner join registrations on student.SID = registrations.SID where registrations.FID = FID;
END $$
 
DELIMITER ;

call query5("F2");

-- query 6

drop view v3;

-- query 7

insert into v3 (SID, CID) values ("A1", "A2");
update v3 set CID = "C1" where SID = "A1";
-- YES

-- query 8

-- NO is the answer
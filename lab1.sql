-- Question i)
-- creating faculty information table
create table facultyInfo(fid char(4), name varchar(30), age int(2), address varchar(50), mobileNo int(10), dateOfJoining date);
-- creating student information table
create table studentInfo(sid char(4), name varchar(30), year int(4), age int(2), address varchar(50), pincode int(6));
-- creating course information table
create table courseInfo(cid char(5),courseName varchar(30));
-- creating courses offered table
create table courseOffered(fid char(4),facultyName varchar(30),course1 varchar(30), course2 varchar(30), course3 varchar(30));
-- creating course registration table
create table courseReg(cid char(5), sid char(4));

-- Question ii)
INSERT into studentInfo values("S101", "Shrinidhi", 2017, 20, "NITKMT3", 575025);
INSERT into studentInfo values("S102", "Shrinivas", 2017, 20, "NITKMT1", 575025);
INSERT into studentInfo values("S103", "Sai", 2017, 20, "NITKMT3", 575025);
INSERT into studentInfo values("S104", "Rahul", 2017, 20, "NITKMT1", 575025);
INSERT into studentInfo values("S105", "Rohan", 2017, 20, "NITKMT3", 575025);
INSERT into studentInfo values("S106", "Rohit", 2017, 20, "NITKMT1", 575025);
INSERT into studentInfo values("S107", "Vybhav", 2017, 20, "NITKMT3", 575025);
INSERT into studentInfo values("S108", "Avakash", 2017, 20, "NITKMT1", 575025);
INSERT into studentInfo values("S109", "Deepak", 2017, 20, "NITKMT1", 575025);
INSERT into studentInfo values("S110", "Nihal", 2017, 20, "NITKMT1", 575025);

select name from studentInfo where sid="S101";

-- Question iii)
select name from studentInfo where name LIKE 'S%';

-- Question iv)
update studentInfo set name="Mathews" where sid="S105";

-- Question v)
INSERT into courseReg values("CO200", "S101");
INSERT into courseReg values("CO201", "S101");
INSERT into courseReg values("CO202", "S101");
INSERT into courseReg values("CO203", "S101");
INSERT into courseReg values("CO204", "S101");

INSERT into courseReg values("CO200", "S102");
INSERT into courseReg values("CO201", "S102");
INSERT into courseReg values("CO202", "S102");
INSERT into courseReg values("CO203", "S102");
INSERT into courseReg values("CO204", "S102");
INSERT into courseReg values("CO205", "S102");

INSERT into courseReg values("CO200", "S103");
INSERT into courseReg values("CO201", "S103");
INSERT into courseReg values("CO202", "S103");
INSERT into courseReg values("CO203", "S103");
INSERT into courseReg values("CO204", "S103");

INSERT into courseReg values("CO200", "S104");
INSERT into courseReg values("CO201", "S104");
INSERT into courseReg values("CO202", "S104");
INSERT into courseReg values("CO203", "S104");
INSERT into courseReg values("CO204", "S104");


INSERT into courseReg values("CO200", "S110");
INSERT into courseReg values("CO201", "S110");
INSERT into courseReg values("CO202", "S110");
INSERT into courseReg values("CO203", "S110");

INSERT into courseReg values("CO200", "S109");
INSERT into courseReg values("CO201", "S109");
INSERT into courseReg values("CO202", "S109");
INSERT into courseReg values("CO203", "S109");

select * from courseReg where sid="S110";

-- Question vi)
delete from studentInfo where sid="S109"

-- Question vii)
alter table studentInfo add column hosteller char(3);

-- Question viii)
rename  table studentInfo to sdetails;

-- Question ix)
alter table sdetails modify address varchar(100);
alter table facultyInfo modify address varchar(100);

-- Question x)
alter table sdetails drop column age;
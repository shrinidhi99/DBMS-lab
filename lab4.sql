CREATE TABLE student(name varchar(40), rollno varchar(7), gender char(1), address varchar(50));
ALTER TABLE student ADD PRIMARY KEY (rollno); 
CREATE TABLE course(cid char(5), cname varchar(40), PRIMARY KEY (cid));
CREATE TABLE registration(rollno varchar(7), courseno char(5));

insert into student VALUES("xyz", "17CO100", "M", "surathkal");
insert into student VALUES("abc", "17CO101", "F", "surathkal");
insert into student VALUES("def", "17CO102", "F", "surathkal");
insert into student VALUES("ghi", "17CO103", "M", "surathkal");
insert into student VALUES("jkl", "17CO104", "F", "surathkal");
insert into student VALUES("jklaaa", "17CO105", "F", "surathkal");

insert into course VALUES("CO100", "C");
insert into course VALUES("CO101", "C-lab");
insert into course VALUES("CO200", "COA");
insert into course VALUES("CO254", "OS");
insert into course VALUES("CO262", "SP");
insert into course VALUES("CO300", "CN");
insert into course VALUES("CO303", "DBMS");

insert into registration VALUES("17CO100","CO100");
insert into registration VALUES("17CO100","CO101");
insert into registration VALUES("17CO100","CO200");
insert into registration VALUES("17CO100","CO300");
insert into registration VALUES("17CO100","CO303");
insert into registration VALUES("17CO101","CO300");
insert into registration VALUES("17CO102","CO300");
insert into registration VALUES("17CO103","CO300");
insert into registration VALUES("17CO104","CO300");
insert into registration VALUES("17CO101","CO303");
insert into registration VALUES("17CO102","CO303");
insert into registration VALUES("17CO101","CO262");
insert into registration VALUES("17CO102","CO254");
insert into registration VALUES("17CO103","CO254");
insert into registration VALUES("17CO104","CO101");

-- query 1
select student.name from ((student inner join registration on student.rollno = registration.rollno) inner join course on registration.courseno = course.cid and course.cname = "OS");
-- query 2
select student.name, registration.courseno from student left join registration on student.rollno = registration.rollno order by student.name;
-- query 3
select count(rollno) from student;
select student.gender, count(rollno) from student GROUP BY gender;
-- query 4
select student.name from student where student.rollno not in (select registration.rollno from registration);
-- query 5
select registration.courseno,count(rollno) from registration GROUP BY courseno;
-- query 6
select course.cname from ((course inner join registration on course.cid = registration.courseno) inner join student on student.rollno = registration.rollno and student.name = "xyz");
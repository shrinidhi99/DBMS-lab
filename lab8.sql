create table student8(id int primary key, studentName varchar(50), subjectName varchar(50));
insert into student8 values(1, "Shrinidhi", "DBMS");
insert into student8 values(2, "Keshav", "Economics");
insert into student8 values(3, "Chaitany", "ML");
-- query 1

DELIMITER $$
 
create procedure query1()
BEGIN
    SELECT studentName FROM student8;
END $$
 
DELIMITER ;

call query1();

-- query 2

DELIMITER $$
 
create procedure query2(IN id int)
BEGIN
    select studentName from student8 where student8.id = id;
END $$
 
DELIMITER ;

call query2(1);
call query2(3);

-- query 3

DELIMITER $$
 
create procedure query3(IN id int, IN studentName varchar(50))
BEGIN
    select subjectName from student8 where student8.id = id and student8.studentName = studentName;
END $$
 
DELIMITER ;

call query3(1, "Shrinidhi");
call query3(3, "Chaitany");

-- query 4
alter table student8 add column gender char(1);
insert into student8 values(1, "Shrinidhi", "DBMS", 'M');
insert into student8 values(2, "Keshav", "Economics", 'M');
insert into student8 values(3, "Chaitany", "ML", 'M');
insert into student8 values(4, "Disha", "English", 'F');

DELIMITER $$
 
create procedure query3(in gender char(1))
BEGIN
    select count(gender) from student8 where student8.gender = gender;
END $$
 
DELIMITER ;

call query3('M');
call query3('F');

-- query 5

DELIMITER $$
 
create procedure GetTotalNoOfStudents (OUT total INT)
BEGIN
    select count(id)
    into total
    from student8;
END$$
 
DELIMITER ;

call GetTotalNoOfStudents(@total);
select @total;
create database endsem1;

create table Instructor (Instructor_Id int primary key, Name varchar(50), Gender char(1), Age int(3), City varchar(50), Department_ID int, foreign key (Department_ID) references Department(Department_ID) on delete cascade on update cascade);
create table Department (Department_ID int primary key, Department_Name varchar(50));
create table Courses (Course_ID int primary key, Course_Name varchar(50));
create table Location (Department_ID int, Place varchar(50), foreign key (Department_ID) references Department(Department_ID) on delete cascade on update cascade);
create table Offerings (Instructor_Id int, Course_ID int, foreign key fk1 (Instructor_Id) references Instructor(Instructor_Id) on delete cascade on update cascade, foreign key fk2 (Course_ID) references Courses(Course_ID) on delete cascade on update cascade);

insert into Instructor values (1, "Shri", "M", 25, "Blr", 1);
insert into Instructor values (2, "Shrin", "M", 24, "Blr", 2);
insert into Instructor values (3, "Shrii", "M", 23, "Blr", 2);
insert into Instructor values (4, "Shrim", "M", 22, "Blr", 3);
insert into Instructor values (5, "Shrih", "M", 23, "Blr", 3);
insert into Instructor values (6, "Shrij", "M", 25, "Blr", 3);
insert into Instructor values (7, "Shrik", "M", 28, "Blr", 2);
insert into Instructor values (8, "Shril", "M", 29, "Blr", 4);
insert into Instructor values (9, "Shria", "M", 20, "Blr", 4);
insert into Instructor values (10, "Shris", "M", 35, "Blr", 5);
insert into Instructor values (11, "Shrid", "M", 45, "Blr", 6);
insert into Instructor values (12, "Shriz", "M", 55, "Blr", 7);
insert into Instructor values (13, "Shrix", "M", 45, "Blr", 8);
insert into Instructor values (14, "Shric", "M", 35, "Blr", 9);
insert into Instructor values (15, "Shriv", "M", 25, "Blr", 10);

insert into Department values (1, "CSE");
insert into Department values (2, "CSA");
insert into Department values (3, "physics");
insert into Department values (4, "ECE");
insert into Department values (5, "EEE");
insert into Department values (6, "MN");
insert into Department values (7, "Mech");
insert into Department values (8, "MT");
insert into Department values (9, "CH");
insert into Department values (10, "BIO");
insert into Department values (11, "LLB");
insert into Department values (12, "IT");
insert into Department values (13, "EP");
insert into Department values (14, "AGRI");
insert into Department values (15, "CV");

insert into Courses values (1, "ML");
insert into Courses values (2, "DS");
insert into Courses values (3, "DSA");
insert into Courses values (4, "TOC");
insert into Courses values (5, "OS");
insert into Courses values (6, "NTC");
insert into Courses values (7, "Semiconductors");
insert into Courses values (8, "BigData");
insert into Courses values (9, "IOT");
insert into Courses values (10, "DL");
insert into Courses values (11, "NLP");
insert into Courses values (12, "NLG");
insert into Courses values (13, "MATH-1");
insert into Courses values (14, "MATH-2");
insert into Courses values (15, "Probability");

insert into Location values (1, "Blr");
insert into Location values (2, "Mlr");
insert into Location values (3, "Dlr");
insert into Location values (4, "Glr");
insert into Location values (5, "Hlr");
insert into Location values (6, "Jlr");
insert into Location values (7, "Llr");
insert into Location values (8, "Alr");
insert into Location values (9, "Xlr");
insert into Location values (10, "Zlr");
insert into Location values (11, "Vlr");
insert into Location values (12, "Nlr");
insert into Location values (13, "Plr");
insert into Location values (14, "Qlr");
insert into Location values (15, "Rlr");

insert into Offerings values (1, 1);
insert into Offerings values (2, 7);
insert into Offerings values (3, 7);
insert into Offerings values (4, 2);
insert into Offerings values (5, 3);
insert into Offerings values (5, 4);
insert into Offerings values (6, 5);
insert into Offerings values (7, 6);
insert into Offerings values (8, 7);
insert into Offerings values (9, 8);
insert into Offerings values (9, 9);
insert into Offerings values (10, 10);
insert into Offerings values (11, 11);
insert into Offerings values (12, 12);
insert into Offerings values (13, 13);

-- query 1
select count(Instructor_Id) from Instructor join Department on Instructor.Department_ID = Department.Department_ID where Department.Department_Name = "physics";

-- query 2
delimiter $$

create procedure query2()
begin
    select Course_Name from Courses;
end $$

delimiter ;

call query2();

-- query 3

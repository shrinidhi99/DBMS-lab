create table Books(Book_Id int primary key, Price float, Number_of_Pages int, Publisher varchar(100));
create table Sales(Book_Id int, Quantity_Sold float, foreign key(Book_Id) references Books(Book_Id));
alter table Books add Book_name varchar(100);
alter table Sales add foreign key (Book_Id) references Books(Book_Id) on delete cascade on update cascade;
insert into Books values(1, 100, 120, "McGrawHill", "Maths");
insert into Books values(2, 110, 120, "Pearson", "Geography");
insert into Books values(3, 120, 120, "Ratna Sagar", "History");
insert into Books values(4, 130, 120, "Indian", "Civics");
insert into Books values(5, 140, 120, "French", "Chemistry");
insert into Books values(6, 150, 120, "LPE", "Physics");
insert into Books values(7, 160, 120, "GRB", "Biology");
insert into Books values(8, 170, 120, "Tata", "English");
insert into Books values(9, 180, 130, "Laxmi", "Sanskrit");
insert into Books values(10, 100, 30, "GRB", "OP Tandon");
insert into Books values(11, 110, 110, "XYZ", "Oggy");
insert into Books values(12, 120, 115, "Pinto", "Othello");


insert into Sales values(1, 2);
insert into Sales values(1, 2);
insert into Sales values(3, 25);
insert into Sales values(4, 23);
insert into Sales values(2, 32);
insert into Sales values(5, 23);
insert into Sales values(6, 21);
insert into Sales values(6, 21);
insert into Sales values(8, 20);
insert into Sales values(7, 21);

--Queries
-- i)
select Books.Book_name from Books where Books.Book_Id not in (select Sales.Book_Id from Sales);
-- ii) (not proper)
-- use left outer join and check the condition
-- iii)
select Book_Id, (select sum(Sales.Quantity_Sold) from Sales where Sales.Book_Id = Books.Book_Id) from Books;
-- iv)
select Book_name from Books order by Price desc limit 3, 1;
-- v)*
-- apply (iii)
select Sales.Quantity_Sold from Sales order by Sales.Quantity_Sold desc limit 9;
-- vi)
create table t as select * from Books;
select Book_name from Books where (select max(Books.Number_of_Pages) from Books where Books.Book_name like 'O%') < Books.Number_of_Pages;

-- vii)
-- use min() in the subquery and compare the value
-- viii)
set @cnt := 0;
select (@cnt := @cnt + 1) AS Rank, Books.Book_Id from Books order by Price desc;
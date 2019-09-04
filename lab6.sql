create table Books(Book_Id int primary key, Price float, Number_of_Pages int, Publisher varchar(100), Book_name varchar(100));
create table Sales(Book_Id int, Quantity_Sold float, foreign key(Book_Id) references Books(Book_Id));
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
insert into Books values(13, 100, 100, "Xavier", "OmgRofl");
insert into Books values(14, 150, 150, "Arihant", "Mathematics");
insert into Books values(15, 160, 170, "Arihant", "Physics past papers of 37 years");

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
insert into Sales values(9, 21);
insert into Sales values(9, 21);
insert into Sales values(8, 20);
insert into Sales values(15, 21);
insert into Sales values(11, 23);
--Queries
-- i)
select Books.Book_name from Books where Books.Book_Id not in (select Sales.Book_Id from Sales);
-- ii)
select distinct Books.Book_name from Books left join Sales on Books.Book_Id = Sales.Book_Id where Sales.Quantity_Sold is null;
-- iii)
select Book_Id, (select sum(Sales.Quantity_Sold) from Sales where Sales.Book_Id = Books.Book_Id) Quantity from Books;
-- iv)
select Book_name from Books where Price = (select distinct Price from Books order by Price desc limit 3, 1);
-- v) (still need to retrieve book name)
create table R as select (select sum(Sales.Quantity_Sold) from Sales where Sales.Book_Id = Books.Book_Id ) Quantity from Books;
select Quantity from R where Quantity > (select min(Quantity) from R);
-- select Books.Book_name from Books join Sales on Books.Book_Id = Sales.Book_Id where Sales.Quantity_Sold > (select min(select sum(Sales.Quantity_Sold) from Sales where Sales.Book_Id = Books.Book_Id));

-- vi)
select Book_name from Books where  Books.Number_of_Pages > (select max(Books.Number_of_Pages) from Books where Books.Book_name like 'O%');
-- vii)
select Book_name from Books where Price > (select min(Price) from Books);
-- viii)
set @cnt := 0;
select (@cnt := @cnt + 1) AS Rank, Books.Book_Id from Books order by Price desc;
-- select Book_Id, rank() over (order by Price desc) as rank from Books;  (supposed to be like this)
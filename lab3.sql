create table bookDetails(bookNo int, NoOfPages int, title varchar(50), authorId varchar(5), price int, publisher varchar(50));
create table authorDetails(authorId varchar(5), authorName varchar(40));
create table purchaserDetails(purchaserName varchar(40), bookNo int);
alter table bookDetails add PRIMARY KEY (bookNo);
alter table bookDetails add constraint FK FOREIGN KEY (authorId) REFERENCES authorDetails(authorId);
alter table authorDetails add PRIMARY KEY (authorId);

-- alter table bookDetails drop FOREIGN KEY (authorId);
-- alter table bookDetails MODIFY COLUMN authorId varchar(5) FOREIGN KEY REFERENCES authorDetails(authorId);

alter table bookDetails drop FOREIGN KEY FK;
alter table bookDetails add constraint FK FOREIGN KEY (authorId) REFERENCES authorDetails(authorId) on delete cascade on update cascade;

-- ALTER TABLE bookDetails DROP COLUMN authorId; 
-- alter table bookDetails add authorId varchar(5);

insert into bookDetails VALUES(100, 100, "Sage", 120, "Geeta", "A1");
insert into bookDetails VALUES(101, 200, "Monk", 130, "Beeta", "A2");
insert into bookDetails VALUES(102, 300, "Guru", 140, "Gaama", "A3");
insert into bookDetails VALUES(103, 400, "World", 150, "Alpha", "A4");
insert into bookDetails VALUES(104, 500, "Harry Potter", 160, "Peter", "A5");
insert into bookDetails VALUES(105, 600, "Mr E", 170, "France", "A6");
insert into bookDetails VALUES(106, 700, "Science", 180, "MII", "A7");
insert into bookDetails VALUES(107, 800, "Mystery", 190, "Gita", "A8");
insert into bookDetails VALUES(108, 900, "Mystic", 188, "GRB", "A9");
insert into bookDetails VALUES(109, 660, "Urban", 230, "Ratna Sagar", "A10");

insert into authorDetails VALUES("A1", "Shrinidhi");
insert into authorDetails VALUES("A2", "Shri");
insert into authorDetails VALUES("A3", "Shrinath");
insert into authorDetails VALUES("A4", "kherry perrie");
insert into authorDetails VALUES("A5", "pollard");
insert into authorDetails VALUES("A6", "vaughan");
insert into authorDetails VALUES("A7", "waugh");
insert into authorDetails VALUES("A8", "ruskin");
insert into authorDetails VALUES("A9", "johnson");
insert into authorDetails VALUES("A10", "Sachin");

insert into purchaserDetails VALUES("X", 100);
insert into purchaserDetails VALUES("ABC", 101);
insert into purchaserDetails VALUES("Xsd", 102);
insert into purchaserDetails VALUES("Xgfgf", 103);
insert into purchaserDetails VALUES("Xvsds", 104);
insert into purchaserDetails VALUES("fdv", 105);
insert into purchaserDetails VALUES("th", 106);
insert into purchaserDetails VALUES("jsa", 107);
insert into purchaserDetails VALUES("jsadjsd", 108);
insert into purchaserDetails VALUES("gfe", 109);

select distinct title from bookDetails;

select bookDetails.bookNo, bookDetails.authorId, authorDetails.authorName from bookDetails join authorDetails where bookDetails.authorId = authorDetails.authorId;

delete from authorDetails where authorId="A9";

select bookDetails.title from bookDetails join purchaserDetails where purchaserDetails.purchaserName = "ABC" and purchaserDetails.bookNo = bookDetails.bookNo;

alter table bookDetails drop FOREIGN KEY FK;

create database endsem3;

create table Items (Item_id varchar(4) primary key, item_Name varchar(50), Item_Price float, Item_qty float);
create table Customer (Customer_ID varchar(4) primary key, Customer_Name varchar(50));
create table Purchase (Store_ID varchar(4), Customer_ID varchar(4), Date_of_purchase date, Total_Amount float, foreign key fk1 (Store_ID) references Store(Store_ID) on delete cascade on update cascade, foreign key fk2 (Customer_ID) references Customer(Customer_ID) on delete cascade on update cascade);
create table Store (Store_ID varchar(4) primary key, Item_id varchar(4), Store_location varchar(100), foreign key fk (Item_id) references Items(Item_id) on delete cascade on update cascade);
create table Enroll (Customer_ID varchar(4), Store_ID varchar(4), foreign key fk1 (Customer_ID) references Customer(Customer_ID) on delete cascade on update cascade, foreign key fk2 (Store_ID) references Store(Store_ID) on delete cascade on update cascade);

insert into Items values ("I1", "item1", 1, 1);
insert into Items values ("I2", "item2", 2, 11);
insert into Items values ("I3", "item3", 3, 12);
insert into Items values ("I4", "item4", 11, 13);
insert into Items values ("I5", "item5", 12, 14);
insert into Items values ("I6", "item6", 13, 15);
insert into Items values ("I7", "item7", 14, 16);
insert into Items values ("I8", "item8", 15, 17);
insert into Items values ("I9", "item9", 16, 18);
insert into Items values ("I10", "item10", 17, 19);
insert into Items values ("I11", "item11", 16, 10);
insert into Items values ("I12", "item12", 14, 19);
insert into Items values ("I13", "item13", 13, 18);
insert into Items values ("I14", "item14", 12, 17);
insert into Items values ("I15", "item15", 11, 16);

insert into Customer values ("C1", "c1");
insert into Customer values ("C2", "c2");
insert into Customer values ("C3", "c3");
insert into Customer values ("C4", "c4");
insert into Customer values ("C5", "c5");
insert into Customer values ("C6", "c6");
insert into Customer values ("C7", "c7");
insert into Customer values ("C8", "c8");
insert into Customer values ("C9", "c9");
insert into Customer values ("C10", "c10");
insert into Customer values ("C11", "c11");
insert into Customer values ("C12", "c12");
insert into Customer values ("C13", "c13");
insert into Customer values ("C14", "c14");
insert into Customer values ("C15", "c15");

insert into Purchase values ("S1", "C1", "2019-01-01", 12);
insert into Purchase values ("S2", "C2", "2019-01-04", 122);
insert into Purchase values ("S1", "C2", "2019-01-03", 123);
insert into Purchase values ("S3", "C9", "2019-01-02", 124);
insert into Purchase values ("S4", "C10", "2019-01-05", 152);
insert into Purchase values ("S5", "C11", "2019-01-06", 125);
insert into Purchase values ("S6", "C12", "2019-01-07", 126);
insert into Purchase values ("S7", "C12", "2019-01-08", 127);
insert into Purchase values ("S8", "C13", "2019-01-09", 128);
insert into Purchase values ("S9", "C14", "2019-01-10", 129);
insert into Purchase values ("S10", "C15", "2019-01-11", 128);
insert into Purchase values ("S11", "C14", "2019-01-21", 126);
insert into Purchase values ("S12", "C13", "2019-01-31", 152);
insert into Purchase values ("S13", "C12", "2019-01-23", 124);
insert into Purchase values ("S14", "C11", "2019-01-22", 123);

insert into Store values ("S1", "I1", "l1");
insert into Store values ("S2", "I1", "l2");
insert into Store values ("S3", "I2", "l3");
insert into Store values ("S4", "I3", "l4");
insert into Store values ("S5", "I3", "l5");
insert into Store values ("S6", "I4", "l6");
insert into Store values ("S7", "I5", "l7");
insert into Store values ("S8", "I6", "l8");
insert into Store values ("S9", "I7", "l9");
insert into Store values ("S10", "I10", "l10");
insert into Store values ("S11", "I10", "l11");
insert into Store values ("S12", "I8", "l12");
insert into Store values ("S13", "I13", "l13");
insert into Store values ("S14", "I12", "l14");
insert into Store values ("S15", "I11", "l15");


insert into Enroll values ("C1", "S1");
insert into Enroll values ("C2", "S2");
insert into Enroll values ("C1", "S11");
insert into Enroll values ("C3", "S10");
insert into Enroll values ("C4", "S11");
insert into Enroll values ("C5", "S12");
insert into Enroll values ("C6", "S13");
insert into Enroll values ("C7", "S14");
insert into Enroll values ("C8", "S15");
insert into Enroll values ("C9", "S1");
insert into Enroll values ("C10", "S2");
insert into Enroll values ("C11", "S3");
insert into Enroll values ("C12", "S4");
insert into Enroll values ("C13", "S5");
insert into Enroll values ("C14", "S6");
insert into Enroll values ("C12", "S7");
insert into Enroll values ("C13", "S7");

-- query 1
select Customer.Customer_Name from Customer where Customer.Customer_ID in (select Enroll.Customer_ID from Enroll where Enroll.Store_ID = "S7" and Enroll.Customer_ID not in (select Customer_ID from Purchase where Store_ID = "S7"));

-- query 2
create view query2 as select Customer.Customer_ID, Customer.Customer_Name, sum(Total_Amount) as Amt from Customer join Purchase on Customer.Customer_ID = Purchase.Customer_ID group by Customer.Customer_ID; 
select * from query2;

-- query 3
delimiter $$

create procedure query3(in Customer_ID varchar(4))
begin
    select count(Store.Item_id) from Purchase join Store on Purchase.Store_ID = Store.Store_ID where Purchase.Customer_ID = Customer_ID group by Purchase.Store_ID;
end$$

delimiter ;

call query3("C1");

-- query 4
create view query4 as select Store_ID, sum(Total_Amount) as Total from Purchase group by Store_ID;
select * from query4;

-- query 5
create table PurchaseTrigger (Store_ID varchar(4), Customer_ID varchar(4), Date_of_purchase date, Total_Amount float);

drop trigger if exists update_amount;
delimiter $$
create trigger update_amount
after update on Purchase
for each row
begin
if (not(old.Total_Amount * 3 - new.Total_Amount)) then
    insert into PurchaseTrigger values (old.Store_ID, old.Customer_ID, old.Date_of_purchase, old.Total_Amount);
end if;
end$$
delimiter ;

update Purchase set Total_Amount = 3 * Total_Amount where Store_ID = "S14";
select * from PurchaseTrigger;

-- query 6
select Customer.Customer_Name, Customer.Customer_ID, count(Purchase.Customer_ID) as cnt from Customer join Purchase on Customer.Customer_ID = Purchase.Customer_ID group by Customer_ID order by cnt desc limit 1;

-- query 7
alter table Enroll drop foreign key fk1;
alter table Enroll drop foreign key fk2;

-- query 8
-- cursor
drop procedure query8;
delimiter $$
create procedure query8(in Store_ID varchar(4), inout purchases varchar(1000))
begin
declare finished integer default 0;
declare temp_SID varchar(4) default "";
declare temp_CID varchar(4) default "";
declare temp_amount float default 0;
declare cursor_name cursor for select Purchase.Store_ID, Purchase.Customer_ID, Purchase.Total_Amount from Purchase where Purchase.Store_ID = Store_ID;
declare continue handler 
    for not found set finished = 1;
open cursor_name;
getDetails: loop
    fetch cursor_name into temp_SID, temp_CID, temp_amount;
    if finished = 1 then
        leave getDetails;
    end if;
    set purchases = concat(temp_SID,";",purchases);
    set purchases = concat(temp_CID,";",purchases);
    set purchases = concat(temp_amount,";",purchases);
end loop getDetails;
close cursor_name;
end$$

delimiter ;

set @purchases = "";
call query8("S1", @purchases);
select @purchases;
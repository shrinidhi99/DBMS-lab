create database endsem2;

create table Doctor (Doctor_ID varchar(4) primary key, Doctor_Name varchar(50), Doctor_Gender char(1), Doctor_Age int(3), Department varchar(50));
create table Patient (Patient_ID varchar(4) primary key, Patient_Name varchar(50), Patient_Gender char(1), Patient_Age int(3));
create table Hospital (Hospital_ID varchar(4) primary key, Hospital_Name varchar(50), City varchar(50), Pincode int(6), No_of_beds int(3));
create table Treatment (Hospital_ID varchar(4), Doctor_ID varchar(4), Patient_ID varchar(4), foreign key fk1 (Hospital_ID) references Hospital(Hospital_ID), foreign key fk2 (Doctor_ID) references Doctor(Doctor_ID), foreign key fk3 (Patient_ID) references Patient(Patient_ID));

insert into Doctor values ("D11", "Shri", "M", 25, "C");
insert into Doctor values ("D12", "Shrin", "F", 25, "F");
insert into Doctor values ("D13", "Shrim", "M", 25, "D");
insert into Doctor values ("D14", "Shrib", "F", 25, "S");
insert into Doctor values ("D15", "Shriv", "M", 25, "A");
insert into Doctor values ("D16", "Shric", "F", 25, "Q");
insert into Doctor values ("D17", "Shrix", "M", 25, "W");
insert into Doctor values ("D18", "Shriz", "F", 25, "E");
insert into Doctor values ("D19", "Shria", "M", 25, "R");
insert into Doctor values ("D20", "Shris", "F", 25, "T");
insert into Doctor values ("D21", "Shrid", "M", 25, "Y");
insert into Doctor values ("D22", "Shrif", "F", 25, "U");
insert into Doctor values ("D23", "Shrig", "M", 25, "I");
insert into Doctor values ("D24", "Shrih", "F", 25, "O");
insert into Doctor values ("D25", "Shrij", "M", 25, "P");

insert into Patient values ("P11", "Sh", "F", 23);
insert into Patient values ("P12", "Sa", "M", 23);
insert into Patient values ("P13", "Ss", "F", 23);
insert into Patient values ("P14", "Sd", "F", 23);
insert into Patient values ("P15", "Sf", "M", 23);
insert into Patient values ("P16", "Sg", "F", 23);
insert into Patient values ("P17", "Sj", "M", 23);
insert into Patient values ("P18", "Sk", "F", 23);
insert into Patient values ("P19", "Sl", "M", 23);
insert into Patient values ("P20", "Sz", "F", 23);
insert into Patient values ("P21", "Sx", "M", 23);
insert into Patient values ("P22", "Sc", "F", 23);
insert into Patient values ("P23", "Sv", "M", 23);
insert into Patient values ("P24", "Sb", "F", 23);
insert into Patient values ("P25", "Sn", "M", 23);

insert into Hospital values ("H11", "Ha", "XL", 560061, 5);
insert into Hospital values ("H12", "Hb", "XL", 560061, 15);
insert into Hospital values ("H13", "Hc", "XL", 560061, 52);
insert into Hospital values ("H14", "Hd", "XL", 560061, 35);
insert into Hospital values ("H15", "Hf", "XL", 560061, 54);
insert into Hospital values ("H16", "Hg", "XL", 560061, 55);
insert into Hospital values ("H17", "Hh", "XL", 560061, 65);
insert into Hospital values ("H18", "Hj", "XL", 560061, 15);
insert into Hospital values ("H19", "Hk", "XL", 560061, 25);
insert into Hospital values ("H20", "Hr", "XL", 560061, 35);
insert into Hospital values ("H21", "He", "XL", 560061, 45);
insert into Hospital values ("H22", "Hy", "XL", 560061, 55);
insert into Hospital values ("H23", "Hu", "XL", 560061, 65);
insert into Hospital values ("H24", "Hl", "XL", 560061, 75);
insert into Hospital values ("H25", "Hq", "XL", 560061, 85);

insert into Treatment values ("H11", "D11", "P11");
insert into Treatment values ("H11", "D12", "P12");
insert into Treatment values ("H13", "D11", "P13");
insert into Treatment values ("H14", "D16", "P17");
insert into Treatment values ("H15", "D13", "P11");
insert into Treatment values ("H21", "D14", "P20");
insert into Treatment values ("H20", "D11", "P18");
insert into Treatment values ("H23", "D16", "P11");
insert into Treatment values ("H24", "D23", "P21");
insert into Treatment values ("H11", "D11", "P19");
insert into Treatment values ("H25", "D24", "P22");
insert into Treatment values ("H12", "D11", "P18");
insert into Treatment values ("H13", "D25", "P23");
insert into Treatment values ("H14", "D11", "P19");
insert into Treatment values ("H15", "D22", "P25");

-- query 1
select Patient.Patient_ID, Patient.Patient_Name from Patient join Treatment on Patient.Patient_ID = Treatment.Patient_ID where Treatment.Doctor_ID = "D11" and Patient.Patient_Gender = "F" group by Patient.Patient_ID;

-- query 2
-- select Hospital.Hospital_Name from Hospital where Hospital.Hospital_ID in (select Treatment.Hospital_ID from Treatment join Patient on Treatment.Patient_ID = Patient.Patient_ID where Patient.Patient_Gender = "M");
select H.Hospital_Name, count(H.Hospital_ID) as cnt from Hospital H, Treatment T, Patient P where H.Hospital_ID = T.Hospital_ID and T.Patient_ID = P.Patient_ID and P.Patient_Gender = "M" group by H.Hospital_ID order by cnt;

-- query 3
delimiter $$

create procedure query3()
begin
    select Hospital.Hospital_Name, count(Hospital.Hospital_ID) as cnt from Hospital join Treatment on Hospital.Hospital_ID = Treatment.Hospital_ID group by Hospital.Hospital_ID order by cnt;
end$$

delimiter ;

call query3();

-- query 4
delimiter $$

create procedure query4(in Doctor_ID varchar(4))
begin
    select count(distinct(Treatment.Hospital_ID)) as associations from Treatment where Treatment.Doctor_ID = Doctor_ID;
end$$

delimiter ;

call query4("D11");

-- query 5
create view query5 as select D.Doctor_Name, P.Patient_Name from Doctor D, Patient P, Treatment T where D.Doctor_ID = T.Doctor_ID and P.Patient_ID = T.Patient_ID;
select * from query5;

-- query 6
delimiter $$

create procedure query6()
begin
    create view query6v as select D.Doctor_ID, D.Doctor_Name, P.Patient_ID, P.Patient_Name from Doctor D, Patient P;
    select * from query6v;
end$$

delimiter ;

call query6();
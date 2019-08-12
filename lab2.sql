create table studentInfo2(sid char(5) NOT NULL UNIQUE, name varchar(30) NOT NULL, age int(3), address varchar(50), state varchar(30), emailID varchar(40));

create table facultyInfo2(fid char(5) NOT NULL UNIQUE, name varchar(30) NOT NULL, address varchar(50), emailID varchar(40));

create table studentIssue(sid char(5) NOT NULL, bookNo char(5) NOT NULL, dateOfIssue date, dateOfReturn date, foreign key(sid) REFERENCES studentInfo2(sid));

create table facultyIssue(fid char(5) NOT NULL, bookNo char(5) NOT NULL, dateOfIssue date, dateOfReturn date, foreign key(fid) REFERENCES facultyInfo2(fid));

create table studentReturn(bookNo char(5) NOT NULL, sid char(5) NOT NULL);

create table facultyReturn(bookNo char(5) NOT NULL, fid char(5) NOT NULL);

ALTER TABLE studentIssue
MODIFY COLUMN bookNo char(4);

ALTER TABLE facultyIssue
MODIFY COLUMN bookNo char(4);

ALTER TABLE facultyReturn
MODIFY COLUMN bookNo char(4);

ALTER TABLE studentReturn
MODIFY COLUMN bookNo char(4);

INSERT INTO studentIssue VALUES ('S1120', 'B110', '2019-07-29', '2019-08-15', 20);
INSERT INTO studentIssue VALUES ('S1121', 'B111', '2019-07-30', '2019-08-16', 20);
INSERT INTO studentIssue VALUES ('S1122', 'B112', '2019-07-29', '2019-08-14', 20);
INSERT INTO studentIssue VALUES ('S1123', 'B113', '2019-07-30', '2019-08-13', 20);
INSERT INTO studentIssue VALUES ('S1124', 'B114', '2019-07-29', '2019-08-12', 20);
INSERT INTO studentIssue VALUES ('S1145', 'B110', '2019-07-29', '2019-08-15', 20);
INSERT INTO studentIssue VALUES ('S1146', 'B111', '2019-07-30', '2019-08-16', 20);
INSERT INTO studentIssue VALUES ('S1147', 'B112', '2019-07-29', '2019-08-14', 20);
INSERT INTO studentIssue VALUES ('S1148', 'B113', '2019-07-30', '2019-08-13', 20);
INSERT INTO studentIssue VALUES ('S1149', 'B114', '2019-07-29', '2019-08-12', 20);

INSERT INTO studentInfo2 VALUES ('S1145', 'Shrinidhi', 20, 'Bangalore', 'Karnataka', 's.v@gmail.com');
INSERT INTO studentInfo2 VALUES ('S1146', 'Siddharth', 20, 'Delhi', 'Delhi', 's.s@gmail.com');
INSERT INTO studentInfo2 VALUES ('S1147', 'Ayush', 21, 'Mumbai', 'Maharashtra', 'a.d@gmail.com');
INSERT INTO studentInfo2 VALUES ('S1148', 'Raunak', 20, 'Jaipur', 'Rajasthan', 'r.r@gmail.com');
INSERT INTO studentInfo2 VALUES ('S1149', 'Raina', 31, 'Moradabad', 'UP', 's.r@gmail.com');

INSERT INTO facultyInfo2 VALUES ('F1000', 'Deepak', 'Kavoor', 'd.k@gmail.com');
INSERT INTO facultyInfo2 VALUES ('F1001', 'Avakash', 'Mysore', 'a.b@gmail.com');
INSERT INTO facultyInfo2 VALUES ('F1002', 'Srinivas', 'Tumkur', 's.r@gmail.com');
INSERT INTO facultyInfo2 VALUES ('F1003', 'Rahul', 'Bangalore', 'r.l@gmail.com');
INSERT INTO facultyInfo2 VALUES ('F1004', 'Rohit', 'Mangalore', 'r.r@gmail.com');

INSERT INTO facultyIssue VALUES ('F1000', 'B120', '2019-07-29', '2019-08-15');
INSERT INTO facultyIssue VALUES ('F1001', 'B121', '2019-07-30', '2019-08-16');
INSERT INTO facultyIssue VALUES ('F1002', 'B122', '2019-07-29', '2019-08-14');
INSERT INTO facultyIssue VALUES ('F1003', 'B123', '2019-07-30', '2019-08-13');
INSERT INTO facultyIssue VALUES ('F1004', 'B124', '2019-07-29', '2019-08-12');

INSERT INTO studentReturn VALUES('B111', 'S1146');
INSERT INTO studentReturn VALUES('B110', 'S1145');
INSERT INTO studentReturn VALUES('B112', 'S1147');
INSERT INTO studentReturn VALUES('B113', 'S1148');
INSERT INTO studentReturn VALUES('B114', 'S1149');

INSERT INTO facultyReturn VALUES('B120', 'F1000');
INSERT INTO facultyReturn VALUES('B121', 'F1001');
INSERT INTO facultyReturn VALUES('B122', 'F1002');
INSERT INTO facultyReturn VALUES('B123', 'F1003');
INSERT INTO facultyReturn VALUES('B124', 'F1004');

ALTER TABLE studentIssue
ADD age int(3);

ALTER TABLE studentIssue
MODIFY COLUMN age int(3) FOREIGN KEY REFERENCES studentInfo2(age);

ALTER TABLE studentInfo2
MODIFY COLUMN PhNo int(10) UNIQUE;

ALTER TABLE studentInfo2
ADD pincode int(6);

ALTER TABLE studentIssue
ADD PhNo int(3) FOREIGN KEY REFERENCES studentInfo2(PhNo);

ALTER TABLE studentInfo2
DROP COLUMN address;

select state from studentInfo2;

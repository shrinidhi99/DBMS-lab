select title from course where dept_name = 'Comp. Sci.' and credits = 3;
select distinct student.ID from (student join takes using(ID)) join (instructor join teaches using (ID)) using (course_id, sec_id, semester, year) where instructor.name = 'Einstein';
select max(salary) from instructor;
select ID, name from instructor where salary = (select max(salary) from instructor);
select course_id, sec_id, count(ID) from section natural join takes where semester = 'Autumn' and year = 2009 group by course_id, sec_id;
with sec_enrollment as (select course_id, sec_id, count(ID) as enrollment from section natural join takes where semester = 'Autumn' and year = 2009 group by course_id, sec_id) select course_id, sec_id from sec_enrollment where enrollment = (select max(enrollment) from sec_enrollment);
select sum(credits * points) from (takes natural join course) natural join grade points where ID = ’12345’) union (select 0 from student where takes.ID = ’12345’ and not exists ( select * from takes where takes.ID = ’12345’);
select sum(credits * points) / sum(credits) as GPA from (takes natural join course) natural join grade points where ID = ’12345’) union (select null as GPA from student where takes.ID = ’12345’ and not exists ( select * from takes where takes.ID = ’12345’);
update instructor set salary = salary * 1.10 where dept_name = 'Comp. Sci.';
delete from course where course_id not in (select course_id from section);
insert into instructor select ID, name, dept_name, 10000 from student where tot_cred > 100;

-- person (driver id, name, address)
-- car (license, model, year)
-- accident (report number, date, location)
-- owns (driver id, license)
-- participated (report number, license, driver id, damage amount)

select count(distinct name) from accident , participated, person where accident.report_number = participated.report_number and person.driver_id = participated.driver_id and date between date '2009-00-00' and date '2009-12-31';
insert into accident values(1234, '2019-01-01', 'NYC');
insert into participated select o.driver_id, c.license, 1234, 3000 from person p, owns o, car c where p.name = 'Joe' and p.driver_id = o.driver_id and o.license = c.license and c.model = 'Toyota';
-- we need to join car owns person 
delete car where model = 'Mazda' and license in (select license from person p, owns o where p.driver_id = o.driver_id and p.name = 'John Smith');
select ID,
            case
                when score < 40 then 'F'
                when score < 60 then 'C'
                when score < 80 then 'B'
                else 'A'
            end
        from marks;

with grades as( 
    select ID,
        case
            when score < 40 then 'F'
            when score < 60 then 'C'
            when score < 80 then 'B'
            else 'A'
        end as grade
    from marks;
)
select grade, count(ID) from grades group by grade;

select dept_name from department where lower(dept_name) like '%sci%';

-- branch(branch name, branch city, assets)
-- customer (customer name, customer street, customer city)
-- loan (loan number, branch name, amount)
-- borrower (customer name, loan number)
-- account (account number, branch name, balance )
-- depositor (customer name, account number)

select customer_name from depositor where customer_name not in (select distinct customer_name from borrower);
select customer_name from customer where customer.customer_street = (select customer_street from customer where customer_name = "Smith") and customer.customer_city = (select customer_city from customer where customer_name = "Smith") and customer.customer_name <> "Smith";
-- or
select F.customer_name from customer F join customer S using (customer_street, customer_city) where S.customer_name = 'Smith';


select distinct branch_name from account join depositor on account.account_number = depositor.account_number 
select customer_name from customer where customer_city = "Harrison";

select distinct branch_name from account natural join depositor natural join customer where customer.customer_city = "Harrison";

select employee_name, city from employee natural join works using (employee_name) where works.company_name = "First Bank Corporation";
select * from employee where employee_name in (select employee_name from works where company_name = "First Bank Corporation" and salary > 10000);
select employee_name from employee where employee_name not in (select employee_name from works where company_name = "First Bank Corporation");
select employee_name from employee natural join works using (employee_name) where works.salary >(select MAX(salary) from works where company_name = "Small Bank Corporation");

with emp_total_salary as (select employee_name, sum(salary) as total_salary from works group by employee_name) select employee_name from emp_total_salary where total_salary > all (select total_salary from emp_total_salary, works where works.employee_name = emp_total_salary.employee_name and works.company_name = "Small Bank Corporation");
select company_name from company where city = all (select city from company where company_name = "Small Bank Corporation") and company_name <> "SBC";
select S.company_name from company S where not exists ((select city from company where company_name = "Small Bank Corporation") except (select city from company T where S.company_name = T.company_name));
select company_name from works group by company_name having count(distinct employee_name) >= all (select count(distinct employee_name) from works group by company_name);
select company_name from works group by company_name having avg(salary) > (select avg(salary) from works where company_name = "First Bank Corporation");
update employee set city = "Newtown" where employee_name = "Jones";
update works T set T.salary = T.salary * (case
                                                when (T.salary*1.1 > 100000) then 1.03
                                                else 1.1)
                                        where T.employee_name in (select manager_name from manages) and T.company_name = "First Bank Corporation";
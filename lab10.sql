create table student(id int, name varchar(50));
insert into student values(1, "shri");
insert into student values(2, "shrinidhi");
insert into student values(3, "chaitany");
insert into student values(4, "chaitanya");

DELIMITER $$ 
create procedure openCursor(inout name_list varchar(50))
BEGIN
    declare names varchar(50);
    declare cursor_name cursor for select name from student;
    open cursor_name;
    get_list: loop
    fetch cursor_name into names;
    set name_list = concat(names, ";", name_list);
    end loop get_list;
    close cursor_name;
END $$ 
DELIMITER ;

set @name_list = "";
call openCursor(@name_list);
-- delimiter //
-- create function percent_change(new_value decimal(10,2), old_value decimal(10,2), decimal_places int)
-- returns decimal(10,2)
-- deterministic
-- begin
-- 	declare result decimal(10,2);
--     set result = round(((new_value - old_value)/old_value)*100, decimal_places);
--     return result;
-- end //


-- create table teachers 
-- (
-- 	first_name varchar(45),
--     last_name varchar(45),
--     hire_date varchar(45),
--     personal_days int
-- );

-- insert into teachers values ('Janet','Smith','2020-10-30',NULL), 
-- ('Leel','Reynolds','2019-05-22',NULL), ('Samuel','Cole','2018-08-01',NULL),
-- ('Samantha','Bush','2020-10-30',NULL), ('Betty','Diaz','2019-08-30',NULL),
-- ('Kathleen','Roush','2021-10-22',NULL);



-- delimiter //
-- create procedure update_personal_days()
-- begin 
-- 	update teachers
--     set personal_days = 
-- 		case
-- 			when timestampdiff(year, hire_date, NOW()) between 5 and 10 then 4
--             when timestampdiff(year, hire_date, NOW()) >10 then 5
--             else 3
-- 		end;
-- 	select 'personal_days updated !' as message;
-- end //
-- delimiter ;

-- delimiter //
-- create function pymax(a int, b int)
-- returns int
-- deterministic
-- begin
-- 	declare result int;
--     
--     if a > b then
-- 		set result = a;
-- 	else 
-- 		set result = b;
-- 	end if;
--     
--     return result;
-- end //
-- delimiter ;

-- create table employee (
-- 	emp_id int,
--     first_name varchar(45),
--     last_name varchar(45),
--     salary int,
--     dept_id int
-- );
-- insert into employee values(1,'Nancy','Jones',62500,1), (2,'Lee','Smith',59300,1),
-- (3,'Soo','Nguyen',83000,2), (4,'Janet','King',95000,2);
-- create or replace view employee_tax_dept as 
-- select emp_id, first_name, last_name, dept_id from employee
-- where dept_id = 1
-- order by emp_id
-- with local check option;

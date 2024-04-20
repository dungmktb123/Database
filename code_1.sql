-- create table person (
-- 	name varchar(45),
--     age int
-- );
-- insert into person values ('Matthew', 25), ('Mark',20);
-- create table average_age (average double);
-- insert into average_age select avg(age) from person;
-- create table person_archive (
-- 	name varchar(45),
--     age int,
--     time timestamp default now()
-- );

-- delimiter //
-- create trigger person_bi before insert
-- on person 
-- for each row
-- if new.age < 18 then 
-- signal sqlstate '50001' set message_text = "Person not 18 years old";
-- end if; //
-- delimiter ;

-- insert into person values ('John',14)

-- delimiter //
-- create trigger person_ai after insert
-- on person
-- for each row
-- update average_age set average = (select avg(age) from person); //
-- delimiter ;


-- insert into person values ('John',19)

-- delimiter //
-- create trigger person_bu before update
-- on person 
-- for each row
-- if new.age < 18 then
-- signal sqlstate '50002' set message_text = 'Person must be older tham 18';
-- end if; //
-- delimiter ;

-- update person set age = 17 where name = 'John';

-- delimiter //
-- create trigger person_au after update
-- on person
-- for each row
-- update average_age set average = (select avg(age) from person); //
-- delimiter ;

-- update person set age = 21 where name = 'John';

-- delimiter //
-- create trigger person_bd before delete
-- on person
-- for each row
-- insert into person_archive (name, age)
-- values (old.name, old.age); //
-- delimiter ;

-- delete from person where name = 'John';

-- create trigger person_ad after delete
-- on person
-- for each row
-- update average_age set average = (select avg(person.age) from person); //
-- delimiter ;

-- show triggers; 
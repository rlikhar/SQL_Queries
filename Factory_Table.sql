show databases;
use SQL_Practice;

show tables;

select * from Factory;

insert into Factory values
(1002, 'Anuj', 'Srivastav', 25, 9000, 'HR'),
(1003, 'Vikram', 'Batra', 35, 7000, 'Security'),
(1004,'Dinesh','Singh',29,9500, 'Labour'),
(1005,'Raju','Kheda', 42,10050,'Manager'),
(1006,'Deepak','Singh',30,9500, 'Labour'),
(1007,'Madhur','Chaturvedi',29,7500, 'Labour'),
(1008,'Deepin','Rawat',31,9000, 'Accountant'),
(1009,'Omkar','Kale',25,7500, 'Data Entry'),
(1010,'Chandu','Tiwari',29,7000, 'Labour'),
(1011,'Sandeep','Pathak',30,8500, 'Accountant'),
(1012,'Saurabh','Tidke',28,7500, 'Data Entry'),
(1013,'Kartik','Mande',30,10500,'IT');

select max(salary) from Factory;

select * from Factory Order by salary DESC;


insert into Factory values
(1014, 'Anup', 'Vastav', 27, 11000, 'HR'),
(1015, 'Bunty','Keda', 45, 7200, 'Security'),
(1016,'Azim','Khatri',25,6500, 'Labour');


# third highest salary
select *
From(
select * From Factory order by salary DESC limit 3) as emp_salary
Order by salary ASC limit 1;
# another method
select * from Factory 
order by salary Desc
limit 2, 1;
# without limit nth highest salary (3rd)
select * from Factory f1
where 3 -1 = (select count(Distinct salary) from Factory f2 
where f2.salary > f1.salary);

## duplicate rows
select *
from Factory
group by position;

# Working in same position
select Distinct e.emp_id , e.f_name, e.l_name, e.position
from Factory e, Factory f
where e.position = f.position
and e.emp_id != f.emp_id; 



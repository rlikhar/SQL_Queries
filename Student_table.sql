use SQL_Practice;

create table student
(Date date,
Name varchar(25),
Present varchar(20));

insert into student (Date, Name, Present) values
('2021-09-06', 'user_01', 'Yes');


insert into student values 
('2021-09-06', 'user_02', 'Yes'),
('2021-09-06', 'user_03', 'Yes'),
('2021-09-06', 'user_04', 'Yes'),
('2021-09-06', 'user_05', 'Yes'),
('2021-09-07', 'user_01', 'No'),
('2021-09-07', 'user_02', 'Yes'),
('2021-09-07', 'user_03', 'Yes'),
('2021-09-07', 'user_04', 'No'),
('2021-09-07', 'user_05', 'Yes'),
('2021-09-08', 'user_01', 'Yes'),
('2021-09-08', 'user_02', 'Yes'),
('2021-09-08', 'user_03', 'No'),
('2021-09-08', 'user_04', 'Yes'),
('2021-09-08', 'user_05', 'Yes'),
('2021-09-09', 'user_01', 'Yes'),
('2021-09-09', 'user_02', 'Yes'),
('2021-09-09', 'user_03', 'Yes'),
('2021-09-09', 'user_04', 'No'),
('2021-09-09', 'user_05', 'Yes'),
('2021-09-10', 'user_01', 'Yes'),
('2021-09-10', 'user_02', 'No'),
('2021-09-10', 'user_03', 'Yes'),
('2021-09-10', 'user_04', 'Yes'),
('2021-09-10', 'user_05', 'Yes'),
('2021-09-11', 'user_01', 'Yes'),
('2021-09-11', 'user_02', 'No'),
('2021-09-11', 'user_03', 'Yes'),
('2021-09-11', 'user_04', 'Yes');

select * from student;

# Write a query to identify students (Names) who have attended classes 
#for at least 3 consecutive days (Attendance of 3 or more consecutive days)?

select Name
from student
where Date = (Select Date, 
(case
when Present = 'Yes' then count(1)
else count(0)
End) as cnt from student group by Date);


# count od present/absent
Select Date, Name, 
case
	when Present = 'Yes' then 1
	else 0
End as cnt 
from student;

Select Name,
case
	when Present = 'Yes' then 1
	else 0
End as cnt 
from student
group by Name;





with cte as
(Select Date, Name, 
case
	when Present = 'Yes' then 1
	else 0
End as cnt 
from student) 
select *
from cte 
group by Name, Date;

select sysdate() - 1 as previous_date from Dual;

SELECT DATE_SUB(SYSDATE(), INTERVAL 1 DAY) as previous_day;


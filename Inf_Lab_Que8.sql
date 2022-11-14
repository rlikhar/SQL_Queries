use SQL_Practice;

SELECT * FROM SQL_Practice.student;

## To find number of student present for 3 consecutive days in student table


# using window function Row_Number found the row number for student who are present
select S.*,
Row_Number() over (partition by Name order by Date) as rn
from student;

# using date_sub function found the start date
select x.*, date_sub(Date, Interval x.rn Day) as Start_date
from (select S.*,
Row_Number() over (partition by Name order by Date) as rn
from student S
where S.Present = 'Yes') x;

# with cte find the final answer gy grouping the cte table with c.Name and Start_date column
# and giveng condition of having 3<= count

with cte as
(	select x.*, date_sub(Date, Interval x.rn Day) as Start_date
	from (select S.*,
	Row_Number() over (partition by Name order by Date) as rn
	from student S
	where S.Present = 'Yes') x )
select c.Name , count(*) as Cons_Day_Present
from cte c
group by c.Name, c.Start_date
having count(*) >=3;


use SQL_Practice;

create table files
(id int primary key,
date_modified date,
file_name varchar(50)
);

insert into files values (1	,   to_date('2021-06-03','yyyy-mm-dd'), 'thresholds.svg');
insert into files values (1, '2021-06-01', 'thresholds.svg');

select * from files;

insert into files values (2	,'2021-06-01', 'redrag.py'), 
(3	,'2021-06-03', 'counter.pdf');

select * from files;

insert into files values
(4	,'2021-06-06', 'reinfusion.py'),
(5	,'2021-06-06', 'tonoplast.docx'),
(6	,'2021-06-01', 'uranian.pptx'),
(7	,'2021-06-03', 'discuss.pdf'),
(8	,'2021-06-06', 'nontheologically.pdf'),
(9	,'2021-06-01', 'skiagrams.py'),
(10,'2021-06-04', 'flavors.py'),
(11,'2021-06-05', 'nonv.pptx'),
(12,'2021-06-01', 'under.pptx'),
(13,'2021-06-02', 'demit.csv'),
(14,'2021-06-02', 'trailings.pptx'),
(15,'2021-06-04', 'asst.py'),
(16,'2021-06-03', 'pseudo.pdf'),
(17,'2021-06-03', 'unguarded.jpeg'),
(18,'2021-06-06', 'suzy.docx'),
(19,'2021-06-06', 'anitsplentic.py'),
(20,'2021-06-03', 'tallies.py');

select * from files;

# to get extension
select id, date_modified,file_name, substr(file_name, instr(file_name, '.')+1) as extension
from files;

# Getting count
select date_modified, substr(file_name, instr(file_name, '.')+1) as extension, count(1) as cnt
from files
group by date_modified, extension
order by date_modified;

#getting max of count

with cte as
(select date_modified, substr(file_name, instr(file_name, '.')+1) as extension, count(1) as cnt
from files
group by date_modified, extension
order by 1)
select * 
from cte c1
where cnt = (select max(cnt) from cte c2 where c2.date_modified = c1.date_modified);

# final result

with cte as
(select date_modified, substr(file_name, instr(file_name, '.')+1) as extension, count(1) as cnt
from files
group by date_modified, extension
order by 1)
select date_modified, group_concat(extension order by extension DESC) as Extension, max(cnt) as count
from cte c1
where cnt = (select max(cnt) 
from cte c2 
where c2.date_modified = c1.date_modified)
group by date_modified;



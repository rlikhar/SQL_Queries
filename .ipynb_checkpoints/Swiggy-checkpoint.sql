
# CASE STUDY SWIGGY DATASET



# FIND CUSTOMER WHO HAVE NEVER ORDERED

SELECT NAME 
FROM users 
WHERE user_id NOT IN (SELECT user_id FROM orders);

# AVERAGE PRICE / DISH

select * from menu;

select f_id, Avg(price) from menu GROUP BY f_id;

SELECT f.f_name, AVG(m.price) as AVERAGE from menu m
JOIN food f
ON m.f_id = f.f_id
GROUP BY f.f_id;

# FIND TOP RESTAURENT IN TERM OF ORDER FOR A GIVEN MONTH

SELECT * FROM orders;

with cte as
(	SELECT Distinct(r_id), count(*) over(partition by r_id) as cnt 
	FROM orders 
    where monthname(date) like 'June'
    order by cnt desc limit 1)

select r.r_name 
FROM restaurant r
Join cte c
On r.r_id = c.r_id;


select r.r_name , count(*) as cnt 
from orders  o
join restaurant r 
on o.r_id = r.r_id
where monthname(date) Like 'June' 
Group by r.r_id
order by cnt desc limit 1;

# RESTAURENT WITH MONTHLY SALARY > X


# SHOW ALL THE ORDER WITH ORDER DETAILS FOR A PARTICULAR PERSON IN A PERTICULAR DATE RANGE

# FIND RESTAURENT WITH MAX REPEATED CUSTOMERS


# MONTH OVER MONTH REVENUE GROWTH OF SWIGGY

# CUSTOMER FAVORITE FOOD


# FIND THE MOST LOYAL CUSTOMER FOR ALL RESTAURANT

# MONTH OVER MONTH REVENUE GROWTH OF A RESTAURENT

# MOST PAIRED PRODUCT



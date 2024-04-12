
create database first_assignment;
use first_assignment;

create table city (ID int, NAME varchar(17) , COUNTRYCODE varchar(3), DISTRICT varchar(30), POPULATION int);
select * from city;

show tables;

insert into city values

select * from city;


#QUESTION 1
select * from CITY where COUNTRYCODE = "USA" and POPULATION >= 100000;

#QUESTION 2
select * from city;
select NAME from city where POPULATION > 120000 and COUNTRYCODE = "USA";


#QUESTION 3
select * from city;

#QUESTION 4
select * from city where ID=1661;

#QUESTION 5
select * from city where COUNTRYCODE= 'JPN';

#QUESTION 6
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'JPN';


use first_assignment;
select * from station ;

ALTER TABLE station
modify column CITY VARCHAR(21);

ALTER TABLE station
modify column STATE VARCHAR(2);

desc station;

#QUESTION 7
SELECT CITY, STATE
FROM STATION;

#QUESTION 8
SELECT DISTINCT CITY
FROM STATION
WHERE ID % 2 = 0;



#QUESTION 9
select count(CITY) "TOTAL NUMBER OF CITY" , count(distinct(CITY)) "NUMBER OF DISTINCT CITY"  from station;

select count(CITY) - count(distinct(CITY))   from station;


#QUESTION 10
SELECT CITY, LENGTH(CITY) AS CITY_LENGTH
FROM STATION
ORDER BY CITY_LENGTH, CITY
LIMIT 1;
SELECT CITY, LENGTH(CITY) AS CITY_LENGTH
FROM STATION
ORDER BY CITY_LENGTH DESC, CITY
LIMIT 1;


#QUESTION 11
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '^[aeiouAEIOU]';


#QUESTION 12
select distinct(CITY) from station where CITY like '%a' or CITY like '%e' or CITY like '%i' or CITY like '%o' or CITY like '%u';

#QUESTION 13 
select distinct(CITY) from station where CITY not like 'a%' or CITY not like 'e%' or CITY not like 'i%' or CITY not like 'o%' or CITY not like 'u%';

select count(distinct(CITY)) "total no of city" from station where CITY not like 'a%' or CITY not like 'e%' or CITY not like 'i%' or CITY not like 'o%' or CITY not like 'u%';

#QUESTION 14
select distinct(CITY) from station where CITY not like '%a' or CITY not like '%e' or CITY not like '%i' or CITY not like '%o' or CITY not like 'u%';


#QUESTION 15
select count(CITY) from station;
select distinct(CITY) from station where CITY not like 'a%' and CITY not like 'e%' and CITY not like 'i%' and CITY not like 'o%' and CITY not like 'u%' and CITY not like '%a' and CITY not like '%e' and CITY not like '%i' and CITY not like '%o' and CITY not like '%u' order by CITY asc;

select count(distinct(CITY)) from station where CITY not like 'a%' and CITY not like 'e%' and CITY not like 'i%' and CITY not like 'o%' and CITY not like 'u%' and CITY not like '%a' and CITY not like '%e' and CITY not like '%i' and CITY not like '%o' and CITY not like '%u' order by CITY asc;


#QUESTION 16
select count(CITY) from station;
select distinct(CITY) from station where CITY not like 'a%' and CITY not like 'e%' and CITY not like 'i%' and CITY not like 'o%' and CITY not like 'u%' and CITY not like '%a' and CITY not like '%e' and CITY not like '%i' and CITY not like '%o' and CITY not like '%u' order by CITY asc;

select count(distinct(CITY)) from station where CITY not like 'a%' and CITY not like 'e%' and CITY not like 'i%' and CITY not like 'o%' and CITY not like 'u%' and CITY not like '%a' and CITY not like '%e' and CITY not like '%i' and CITY not like '%o' and CITY not like '%u' order by CITY asc;

#QUESTION 17
create table Product (
product_id int,
product_name varchar(25),
unit_price int,
primary key (product_id));

create table Sales(
seller_id int,
product_id int,
buyer_id int,
sale_date date,
quantity int,
price int,
foreign key(product_id) references Product(product_id));

show tables;
desc Product;

insert into product values
(1 ,'S8', 1000),
(2,'G4',800),
(3, 'iPhone',1400);

select * from Product;

insert into Sales values
(1, 1, 1, '2019-01-21', 2, 2000),
(1 ,2, 2, '2019-02-17', 1, 800),
(2 ,2 ,3 ,'2019-06-02', 1 ,800),
(3 ,3 ,4 ,'2019-05-13' ,2 ,2800);

select * from Sales;
desc Sales;

#SOLUTION :- 
SELECT DISTINCT s.product_id, p.product_name
FROM sales s
JOIN product p ON s.product_id = p.product_id
WHERE s.sale_date BETWEEN '2019-01-01' AND '2019-03-31'
AND s.product_id NOT IN (
    SELECT DISTINCT product_id
    FROM sales
    WHERE sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31'
);


#QUESTION 18
create table Views ( 
article_id int,
author_id int,
viewer_id int,
view_date date);

insert into Views values 
(1 ,3 ,5 ,'2019-08-01'),
(1, 3, 6, '2019-08-02'),
(2 ,7 ,7 ,'2019-08-01'),
(2, 7, 6, '2019-08-02'),
(4 ,7 ,1, '2019-07-22'),
(3, 4, 4, '2019-07-21'),
(3 ,4 ,4,'2019-07-21');

desc Views;
select * from Views;

# SOLUTION :- 
select author_id from Views 
where author_id = viewer_id
group by author_id 
order by author_id;



#Question 19
create table Delivery (
delivery_id int,
customer_id int,
order_date date,
customer_pref_delivery_date date,
primary key (delivery_id));

desc Delivery;

insert into Delivery values 
(1 ,1 ,'2019-08-01' ,'2019-08-02'),
(2, 5 ,'2019-08-02', '2019-08-02'),
(3 ,1 ,'2019-08-11' ,'2019-08-11'),
(4, 3, '2019-08-24' ,'2019-08-26'),
(5 ,4, '2019-08-21' ,'2019-08-22'),
(6, 2, '2019-08-11' ,'2019-08-13');

# SOLUTION :- 
select round(count(order_date)*100 / (select count(order_date) from Delivery),2) "immediate_percentage"
from Delivery
where order_date = customer_pref_delivery_date ;


#QUESTION  20
create table Ads 
(ad_id int,
user_id int,
action enum('Clicked', 'Viewed', 'Ignored'));

alter table Ads
add constraint primary key(ad_id , user_id);
DROP TABLE ads;
desc Ads;

insert into Ads values
(1 ,1 ,'Clicked'),
(2 ,2 ,'Clicked'),
(3 ,3 ,'Viewed'),
(5, 5 ,'Ignored'),
(1 ,7 ,'Ignored'),
(2, 7, 'Viewed'),
(3 ,5 ,'Clicked'),
(1, 4, 'Viewed'),
(2 ,11 ,'Viewed'),
(1, 2, 'Clicked');

select * from Ads;

#solution
WITH AdClicks AS (
    SELECT ad_id, COUNT(*) AS total_clicks
    FROM Ads
    WHERE action = 'Clicked'
    GROUP BY ad_id
),
AdViews AS (
    SELECT ad_id, COUNT(*) AS total_views
    FROM Ads
    WHERE action = 'Viewed'
    GROUP BY ad_id
),
CTR AS (
    SELECT
        a.ad_id,
        COALESCE(ac.total_clicks, 0) AS total_clicks,
        COALESCE(av.total_views, 0) AS total_views,
        CASE
            WHEN COALESCE(ac.total_clicks, 0) + COALESCE(av.total_views, 0) > 0 THEN
                ROUND((COALESCE(ac.total_clicks, 0) / (COALESCE(ac.total_clicks, 0) + COALESCE(av.total_views, 0))) * 100, 2)
            ELSE
                0
        END AS ctr
    FROM
        Ads a
        LEFT JOIN AdClicks ac ON a.ad_id = ac.ad_id
        LEFT JOIN AdViews av ON a.ad_id = av.ad_id
    GROUP BY
        a.ad_id
)
SELECT ad_id, ctr
FROM CTR
ORDER BY ctr DESC, ad_id ASC;





#Question 21.
create table Employee (
employee_id int,
team_id int);

alter table Employee
add constraint primary key(employee_id);

desc Employee;

insert into Employee values
(1 ,8),
(2, 8),
(3, 8),
(4, 7),
(5, 9),
(6, 9);

select * from Employee;

# SOLUTION :-
SELECT e.employee_id, COUNT(*) AS team_size
FROM Employee e
JOIN Employee t
ON e.team_id = t.team_id
GROUP BY e.employee_id;





#QUESTION 22

create table Countries (
country_id int,
country_name varchar(25),
primary key(country_id));

desc Countries;


create table Weather (
country_id int,
weather_state int,
day date
);

alter table Weather 
add constraint primary key(country_id,day);

desc Weather;

insert into Countries values
(2 ,'USA'),
(3 ,'Australia'),
(7 ,'Peru'),
(5 ,'China'),
(8 ,'Morocco'),
(9 ,'Spain');

select * from Countries;

insert into Weather values
(2 ,15 ,'2019-11-01'),
(2 ,12 ,'2019-10-28'),
(2, 12 ,'2019-10-27'),
(3 ,-2, '2019-11-10'),
(3 ,0 ,'2019-11-11'),
(3 ,3 ,'2019-11-12'),
(5, 16 ,'2019-11-07'),
(5 ,18 ,'2019-11-09'),
(5 ,21 ,'2019-11-23'),
(7 ,25 ,'2019-11-28'),
(7 ,22 ,'2019-12-01'),
(7 ,20 ,'2019-12-02'),
(8 ,25 ,'2019-11-05'),
(8 ,27 ,'2019-11-15'),
(8 ,31 ,'2019-11-25'),
(9 ,7 ,'2019-10-23'),
(9 ,3, '2019-12-23');

select * from Weather;
select * from Countries;

#SOLUTION
select c.country_name,
		case
			when avg(w.weather_state) >= 25 then 'Hot'
            when avg(w.weather_state) <= 15 then "Cold"
			else "Warm"
		end as weather_type
from Countries c 
left join  Weather w 
on c.country_id = w.country_id
where w.day between '2019-11-01' and '2019-11-30'
group by c.country_name;




#QUESTION 23

create table Prices(
product_id int,
start_date date,
end_date date,
price int);

alter table Prices
add constraint primary key(product_id,start_date,end_date);

desc Prices;

create table UnitSold(
product_id int,
purchase_date date,
units int);

desc UnitSold;

insert into Prices values 
(1 ,'2019-02-17', '2019-02-28' ,5),
(1 ,'2019-03-01', '2019-03-22' ,20),
(2 ,'2019-02-01', '2019-02-20' ,15),
(2 ,'2019-02-21', '2019-03-31' ,30 );

select * from Prices;

insert into UnitSold values
(1, '2019-02-25' ,100),
(1, '2019-03-01' ,15),
(2, '2019-02-10' ,200),
(2, '2019-03-22' ,30);

select * from UnitSold;
select * from Prices;


# SOLUTION :-
WITH TotalSales AS (
    SELECT
        p.product_id,
        SUM(p.price * u.units) AS total_price,
        SUM(u.units) AS total_units
    FROM
        Prices p
        JOIN UnitSold u ON p.product_id = u.product_id
            AND u.purchase_date BETWEEN p.start_date AND p.end_date
    GROUP BY
        p.product_id
)
SELECT
    product_id,
    ROUND(total_price / total_units, 2) AS average_price
FROM
    TotalSales;




#QUESTION 24
create table Activity (
player_id int,
device_id int,
event_date date,
games_played int,
primary key(player_id, event_date));

desc Activity;
drop table activity;
INSERT INTO Activity (player_id ,device_id ,event_date ,games_played) VALUES
(1, 2, '2016-03-01', 5),
(1, 2, '2016-03-02', 6),
(2, 3, '2017-06-25', 1),
(3, 1, '2016-03-02', 0),
(3, 4, '2018-07-03', 5);



select * from Activity;

# SOLUTION :- 
SELECT player_id, MIN(event_date) AS first_login_date
FROM Activity
GROUP BY player_id;


#Question 25
select * from Activity;

SELECT player_id, MIN(device_id) AS device_id
FROM Activity
GROUP BY player_id
ORDER BY player_id;




#Question 26

create table Products (
product_id int,
product_name varchar(20),
product_category varchar(15),
primary key(product_id));

desc Products;

create table Orders(
product_id int,
order_date date,
unit int,
foreign key(product_id) references products(product_id));

desc Orders;

insert into Products values 
(1 ,'Leetcode Solutions' ,'Book'),
(2,"Jewels of Str", "Book"),
(3 ,"HP" ,"Laptop"),
(4, "Lenovo", "Laptop"),
(5 ,"Leetcode Kit" ,"T-shirt");

select * from Products;

insert into Orders values 
(1, '2020-02-05', 60),
(1, '2020-02-10', 70),
(2, '2020-01-18', 30),
(2, '2020-02-11', 80),
(3, '2020-02-17', 2),
(3, '2020-02-24', 3),
(4, '2020-03-01', 20),
(4, '2020-03-04',30),
(4, '2020-03-04', 60),
(5, '2020-02-25', 50),
(5, '2020-02-27', 50),
(5, '2020-03-01', 50)
;

select * from Orders;


# SOLUTION :-
select p.product_name ,sum(o.unit) "Total Order",
		case
			when sum(o.unit) >= 100 then "passed"
            else "Failed"
		end as "unit"
from Products p
join Orders o
on p.product_id = o.product_id
where o.order_date between "2020-02-01" and "2020-02-29"
group by p.product_name
having sum(o.unit) >= 100;


#QUESTION 27
create table User (
user_id int,
name varchar(20),
mail varchar(50),
primary key(user_id));

desc User;

insert into User values
(1, 'Winston','winston@leetcode.com'),
(2, 'Jonathan' ,'jonathanisgreat'),
(3, 'Annabelle','bella-@leetcode.com'),
(4, 'Sally','sally.come@leetcode.com'),
(5, 'Marwan','quarz#2020@leetcode.com'),
(6, 'David','david69@gmail.com'),
(7, 'Shapiro','.shapo@leetcode.com');

select * from User;

# SOLUTION :-
select user_id , name , mail from user
where mail like '%@leetcode.com'
and mail not like '.%' 
and mail not like '%*%'
and mail not like '%#%';



#QUESTION 28
create table Customers (
customer_id int,
name varchar(15),
country varchar(15),
primary key(customer_id) );


create table Products1(
product_id int,
description varchar(20),
price int,
primary key(product_id));

create table orders1(
order_id int,
customer_id int,
product_id int,
order_date date,
quantity int,
primary key(order_id));

desc Customers ;
desc products1;
desc orders1;

insert into Customers values 
(1, 'Winston', 'USA'),
(2, 'Jonathan' ,'Peru'),
(3, 'Moustafa', 'Egypt');

insert into Products1 values 
(10, 'LC Phone', 300),
(20 ,'LC T-Shirt', 10),
(30, 'LC Book' ,45),
(40 ,'LC Keychain' ,2);

insert into orders1 values 
(1, 1 ,10 ,'2020-06-10' ,1),
(2 ,1 ,20 ,'2020-07-01' ,1),
(3 ,1 ,30 ,'2020-07-08' ,2),
(4 ,2 ,10 ,'2020-06-15' ,2),
(5 ,2, 40 ,'2020-07-01' ,10),
(6 ,3, 20 ,'2020-06-24' ,2),
(7 ,3 ,30 ,'2020-06-25' ,2),
(9 ,3, 30, '2020-05-08' ,3);

select * from customers;
select * from products1;
select * from orders1;

# SOLUTION :- 
WITH MonthlySpending AS ( SELECT customer_id,
        EXTRACT(MONTH FROM order_date) AS month,
        SUM(price * quantity) AS total_spending
    FROM orders1 o
        JOIN products1 p ON o.product_id = p.product_id
    WHERE EXTRACT(YEAR FROM order_date) = 2020
        AND EXTRACT(MONTH FROM order_date) IN (6, 7)
    GROUP BY customer_id, EXTRACT(MONTH FROM order_date)
),
MonthlySpendingThreshold AS ( SELECT customer_id,
        CASE WHEN month = 6 THEN total_spending
            ELSE 0
        END AS june_spending, CASE WHEN month = 7 THEN total_spending
            ELSE 0
        END AS july_spending FROM MonthlySpending ),
TotalSpending AS ( SELECT customer_id,
        SUM(june_spending) AS total_june_spending,
        SUM(july_spending) AS total_july_spending
    FROM MonthlySpendingThreshold
    GROUP BY customer_id)
SELECT c.customer_id,
    c.name AS customer_name
FROM TotalSpending t
    JOIN Customers c ON t.customer_id = c.customer_id
WHERE total_june_spending >= 100
    AND total_july_spending >= 100;






 


#Question 29
create table TVProgramm (
program_date datetime,
content_id int,
channel varchar(20),
primary key(program_date, content_id));

create table content(
content_id int,
title varchar(25),
Kids_content enum("Y","N"),
content_type varchar(15),
primary key(content_id));

insert into TVProgramm values
('2020-06-10 08:00', 1, 'LC-Channel'),
('2020-05-11 12:00' ,2, 'LC-Channel'),
('2020-05-12 12:00' ,3, 'LC-Channel'),
('2020-05-13 14:00', 4 ,'Disney Ch'),
('2020-06-18 14:00' ,4 ,'Disney Ch'),
('2020-07-15 16:00' ,5, 'Disney Ch')
;

insert into content values
(1 ,'Leetcode Movie','N' ,'Movies'),
(2 ,'Alg. for Kids' ,'Y' ,'Series'),
(3 ,'Database Sols' ,'N' ,'Series'),
(4 ,'Aladdin', 'Y', 'Movies'),
(5 ,'Cinderella', 'Y' ,'Movies');

select * from TVProgramm;
select * from content;

select c.title 
from content c 
join TVProgramm t
on c.content_id = t.content_id
where c.Kids_content = 'Y'
and c.content_type = "Movies"
and t.program_date between "2020-06-01" and "2020-06-30";



#Question 30
create table NPV(
id int,
year int,
npv int,
primary key(id,year));

create table Queries(
id int,
year int,
primary key(id,year));

insert into NPV values
(1 ,2018 ,100),
(7 ,2020 ,30),
(13 ,2019 ,40),
(1 ,2019 ,113),
(2 ,2008 ,121),
(3 ,2009 ,12),
(11 ,2020 ,99),
(7 ,2019 ,0);

insert into Queries values
(1 ,2019),
(2 ,2008),
(3 ,2009),
(7 ,2018),
(7 ,2019),
(7 ,2020),
(13, 2019);

select * from Queries;
select * from NPV;


# SOLUTION :-
select q.id , q.year ,n.npv
from npv n 
join queries q
on n.id = q.id
and n.year = q.year
order by q.id;


#Question 31
select * from NPV;
select * from Queries;

# SOLUTION :-
select q.id , q.year ,n.npv
from npv n 
join queries q
on n.id = q.id
and n.year = q.year
order by q.id;


#Question 32
create table employees(
id int,
name varchar(10),
primary key(id));

create table EmployeeUNI(
id int,
unique_id int,
primary key(id,unique_id));

insert into employees values
(1 ,'Alice'),
(7, 'Bob'),
(11 ,'Meir'),
(90, 'Winston'),
(3 ,'Jonathan');

insert into EmployeeUNI values
(3 ,1),
(11, 2),
(90 ,3);

# SOLUTION :-
select eu.unique_id ,e.id, e.name 
from employees e
left join EmployeeUNI eu
on e.id = eu.id
order by e.id;


#Question 33
create table users(
id int,
name varchar(10),
primary key(id));

create table Rides(
id int,
user_id int,
distance int,
primary key(id)
);

desc users;
desc Rides;


insert into users values
(1 ,'Alice'),
(2 ,'Bob'),
(3 ,'Alex'),
(4 ,'Donald'),
(7 ,'Lee'),
(13 ,'Jonathan'),
(19 ,'Elvis');

insert into Rides values
(1 ,1 ,120),
(2 ,2, 317),
(3 ,3 ,222),
(4 ,7, 100),
(5 ,13, 312),
(6 ,19, 50),
(7 ,7 ,120),
(8 ,19, 400),
(9 ,7 ,230);

select * from users;
select * from Rides;

# SOLTUION :- 
select u.name , sum(r.distance) as "travelled_distance"
from users u 
left join rides r
on r.user_id = u.id
group by u.name
order by sum(r.distance) desc ;


#Question 34
select * from products;
select * from orders;

select p.product_name , sum(o.unit) as "total_order"
from products p 
left join orders o 
on p.product_id = o.product_id
where order_date between "2020-02-01" and "2020-02-29"
group by p.product_name
having sum(o.unit) >= 100 ;


#Question 35
create table movies(
movie_id int,
title varchar(10),
primary key (movie_id));

create table Movie_Users(
user_id int,
name varchar(10),
primary key(user_id));

create table MovieRating(
movie_id int,
user_id int,
rating int,
created_at date,
primary key(movie_id,user_id));

desc movies;
desc Movie_users;
desc MovieRating;

insert into movies values
(1, 'Avengers'),
(2, 'Frozen 2'),
(3, 'Joker');

insert into movie_users values
(1 ,'Daniel'),
(2 ,'Monica'),
(3 ,'Maria'),
(4 ,'James');

insert into movierating values
(1 ,1 ,3 ,'2020-01-12'),
(1 ,2 ,4 ,'2020-02-11'),
(1 ,3 ,2 ,'2020-02-12'),
(1 ,4 ,1 ,'2020-01-01'),
(2 ,1 ,5 ,'2020-02-17'),
(2 ,2 ,2 ,'2020-02-01'),
(2 ,3 ,2 ,'2020-03-01'),
(3 ,1 ,3 ,'2020-02-22'),
(3 ,2 ,4 ,'2020-02-25');

select * from movies;
select * from movie_users;
select * from movierating;

# SOLUTION :-
WITH UserRatingCounts AS (
    SELECT user_id, COUNT(DISTINCT movie_id) AS rating_count
    FROM MovieRating
    GROUP BY user_id
),
MovieAvgRatings AS (
    SELECT movie_id, AVG(rating) AS avg_rating
    FROM MovieRating
    WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY movie_id
)
SELECT 
    (SELECT name
     FROM Movie_Users
     WHERE user_id = (SELECT user_id
                      FROM UserRatingCounts
                      ORDER BY rating_count DESC, name ASC
                      LIMIT 1)) AS user_with_most_ratings,
    (SELECT title
     FROM movies
     WHERE movie_id = (SELECT movie_id
                        FROM MovieAvgRatings
                        ORDER BY avg_rating DESC, title ASC
                        LIMIT 1)) AS movie_with_highest_avg_rating_in_feb






#Question 36

select * from users;
select * from Rides;

desc users;
desc rides;

# SOLUTION :-
select u.name , sum(r.distance) as "Distance Travelled"
from users u , rides r
where u.id = r.user_id
group by u.name
order by sum(r.distance) desc,u.name ;



#Question 37
select * from employees;
select * from EmployeeUNI;

# SOLUTION :-
select eu.unique_id , e.name 
from EmployeeUNI eu 
right join employees e
on eu.id = e.id
order by eu.unique_id;




#question 38
create table departments(
id int,
name varchar(25),
primary key(id) );

create table Students(
id int,
name varchar(15),
department_id int,
primary key(id) );

insert into departments values
(1, 'Electrical Engineering'),
(7 ,'Computer Engineering'),
(13, 'Business Administration');

insert into Students values
(23 ,'Alice' ,1),
(1, 'Bob' ,7),
(5, 'Jennifer' ,13),
(2, 'John' ,14),
(4, 'Jasmine' ,77),
(3, 'Steve' ,74),
(6, 'Luis' ,1),
(8, 'Jonathan', 7),
(7, 'Daiana' ,33),
(11, 'Madelynn' ,1);

select * from departments;
select * from Students;

# SOLUTION :-
SELECT s.id, s.name
FROM Students s
LEFT JOIN Departments d ON s.department_id = d.id
WHERE d.id IS NULL;




#Question 39
create table Calls(
from_id int,
to_id int,
duration int);

insert into Calls values
(1 ,2, 59),
(2 ,1 ,11),
(1, 3, 20),
(3, 4, 100),
(3 ,4 ,200),
(3, 4, 200),
(4 ,3 ,499);

select * from Calls;

# SOLUTION :-
SELECT LEAST(from_id, to_id) AS person1,
       GREATEST(from_id, to_id) AS person2,
       COUNT(*) AS call_count,
       SUM(duration) AS total_duration
FROM Calls
GROUP BY LEAST(from_id, to_id), GREATEST(from_id, to_id);





#Question 40
select * from prices;
select * from unitsold;

# SOLUTION :-


SELECT
    U.product_id,
    ROUND(SUM(P.price * U.units) / SUM(U.units), 2) AS average_price
FROM unitsold U
JOIN Prices P ON U.product_id = P.product_id
    AND U.purchase_date >= P.start_date
    AND U.purchase_date <= P.end_date
GROUP BY U.product_id;


#Question no 41
create table warehouse(
name varchar(50),
product_id int,
units int);


ALTER TABLE orders DROP FOREIGN KEY orders_ibfk_1;

drop table products;
CREATE TABLE products (
    product_id int,
    product_name varchar(50),
    Width int,
    Length int,
    Height int,
    primary key(product_id)
);

INSERT INTO warehouse (name, product_id, units) VALUES
 ('LCHouse1', 1, 1),
 ('LCHouse1', 2, 10),
 ('LCHouse1', 3, 5),
 ('LCHouse2', 1, 2),
 ('LCHouse2', 2, 2),
 ('LCHouse3', 4, 1);

INSERT INTO products (product_id, product_name, Width, Length, Height) VALUES
(1, 'LC-TV', 5, 50, 40),
(2, 'LC-KeyChain', 5, 5, 5),
(3, 'LC-Phone', 2, 10, 10),
(4, 'LC-T-Shirt', 4, 10, 20);

select * from warehouse;
select * from products;

#solution
SELECT
    w.name AS warehouse_name,
    SUM(p.Width * p.Length * p.Height * w.units) AS cubic_feet_volume
FROM
    warehouse w
JOIN
    products p ON w.product_id = p.product_id
GROUP BY
    w.name;








#Question 42
create table FruitSales(
sale_date date,
fruit enum("apples","oranges"),
sold_num int,
primary key(sale_date,fruit));

insert into Fruitsales values
('2020-05-01', 'apples', 10),
('2020-05-01', 'oranges', 8),
('2020-05-02','apples' ,15),
('2020-05-02', 'oranges' ,15),
('2020-05-03' ,'apples' ,20),
('2020-05-03', 'oranges' ,0),
('2020-05-04' ,'apples' ,15),
('2020-05-04', 'oranges', 16);

select * from Fruitsales;

# Solution :-
select sale_date ,
sum(case when fruit ='apples' then sold_num else -sold_num end) as diff
from FruitSales
group by sale_date
order by sale_date;





#Question 43
select * from activity;
desc activity;
#solution 
WITH Logins AS (
    SELECT
        player_id,
        MIN(event_date) AS first_login_date,
        MAX(event_date) AS last_login_date
    FROM
        Activity
    GROUP BY
        player_id
),
ConsecutiveLogins AS (
    SELECT
        player_id,
        event_date,
        LEAD(event_date) OVER (PARTITION BY player_id ORDER BY event_date) AS next_login_date
    FROM
        Activity
)
SELECT
    ROUND(COUNT(DISTINCT player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM
    ConsecutiveLogins
WHERE
    next_login_date = DATE_ADD(event_date, INTERVAL 1 DAY);




#question 44
create table Employee_m(
id int,
name varchar(10),
department varchar(2),
managerId int,
primary key(id));

insert into Employee_m values
(101 ,'John' ,'A' ,null),
(102, 'Dan' ,'A' ,101),
(103, 'James', 'A' ,101),
(104 ,'Amy' ,'A' ,101),
(105, 'Anne' ,'A' ,101),
(106,'Ron', 'B' ,101);


select * from employee_m ;

# SOLUTION :-
select name
from employee_m
where managerId is NULL;


#question 45
create table StudentTable(
student_id int,
student_name varchar(5),
gender varchar(5),
dept_id int,
primary key(student_id));

create table department(
dept_id int,
dept_name varchar(12),
primary key(dept_id)
);


insert into StudentTable values
(1 ,'Jack' ,'M', 1),
(2, 'Jane', 'F', 1),
(3 ,'Mark', 'M' ,2);

insert into department values
(1 ,'Engineering'),
(2, 'Science'),
(3, 'Law');

select * from studenttable;
select * from department;


# SOLUTION :-
SELECT d.dept_name AS department_name, COUNT(s.student_id) AS student_number
FROM department d
LEFT JOIN StudentTable s ON d.dept_id = s.dept_id
GROUP BY d.dept_id, d.dept_name
ORDER BY student_number DESC, department_name;



#question 46
create table customer1(
customer_id int,
product_key int);

create table product1(
product_key int,
primary key(product_key));

insert into customer1 values
(1 ,5),
(2 ,6),
(3 ,5),
(3 ,6),
(1 ,6);

insert into product1 values
(5),
(6);

select * from customer1;
select * from product1;

# SOLTION :-
SELECT customer_id
FROM customer1
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM product1);


#question 47
create table project(
project_id int ,
employee_id int);

drop table employee;

create table Employee(
employee_id int,
name varchar(50) ,
experience_years int);

insert into project values
(1 , 1),
(1 ,2),
(1 ,3),
(2 ,1),
(2 ,4);

INSERT INTO employee (employee_id, name, experience_years) VALUES
(1, 'Khaled', 3),
(2, 'Ali', 2),
(3, 'John', 3),
(4, 'Doe', 2);


select * from Employee;
select * from project;

#solution
WITH RankedEmployees AS (
    SELECT p.project_id, e.employee_id,
        RANK() OVER (PARTITION BY p.project_id ORDER BY e.experience_years DESC) AS ranking
    FROM Project p
        JOIN Employee e ON p.employee_id = e.employee_id)
SELECT project_id, employee_id
FROM RankedEmployees
WHERE ranking = 1;



#QUESTION 48
CREATE TABLE books 
(book_id int,
name varchar(50),
available_from date,
primary key (book_id));

select * from orders;
CREATE TABLE orders
(order_id int,
book_id int,
quantity int,
dispatch_date date,
primary key(order_id),
FOREIGN KEY (book_id)
REFERENCES books(book_id));









#Question 49
create table Enrollments 
(student_id int,
course_id int,
grade int);

insert into Enrollments(student_id ,course_id ,grade) values
(2, 2, 95),
(2 ,3, 95),
(1 ,1, 90),
(1 ,2, 99),
(3 ,1 ,80),
(3 ,2, 75),
(3 ,3 ,82);

#solution
WITH RankedGrades AS (
    SELECT student_id, course_id,grade,
	RANK() OVER (PARTITION BY student_id ORDER BY grade DESC, course_id) AS RANKING
    FROM Enrollments
)
SELECT student_id, course_id, grade
FROM RankedGrades
WHERE RANKING = 1
ORDER BY student_id;
 
 
 
 
 #Question 50
create table Teams
(team_id int,
team_name varchar(50),
primary key (team_id));


drop table matches;
create table Matches
(match_id int ,
first_player int,
second_player int,
first_score int,
second_score int,
primary key (match_id));

create table players 
(player_id  int ,
group_id int);

desc teams;
desc matches;

insert into matches values
(1 ,15,45,3,0),
(2,30,25,1,2),
(3,30,15,2,0),
(4,40,20,5,2),
(5,35,50,1,1);


insert into players values
(15, 1),
(25 ,1),
(30 ,1),
(45 ,1),
(10 ,2),
(35 ,2),
(50 ,2),
(20 ,3),
(40 ,3);

select * from players;

#solution

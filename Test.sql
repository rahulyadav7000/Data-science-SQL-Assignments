create database rahul;

use rahul;

create table Ai_tools(
    id int ,
    technology varchar(50)
)


INSERT INTO Ai_tools (id, technology) 
VALUES 
(1, 'DS'),
(1, 'tableau'),
(1, 'sql'),
(2, 'r language'),
(2, 'power bi'),
(1, 'python');

select * from Ai_tools;

# solution for question no 1
select id from Ai_tools 
where technology = "DS"
AND id IN(
    select id from Ai_tools
    where technology = "sql"
    AND id IN(
        SELECT id from Ai_tools
        where technology = "python"
    )
)


create table product_info(
product_id int,
product_name varchar(10));


insert into product_info values 
(1001,'blog'),
(1002,"youtube"),
(1003,"education");

create table product_info_likes(
user_id int,
product_id int,
liked_date date);


insert into product_info_likes values
(1,1001,"2020-03-10"),
(2,1003,"2020-04-15");

select * from product_info;
select * from product_info_likes;


#solution for question no 2
select pi.product_id 
from product_info pi, product_info_likes pil
where pi.product_id != pil.product_id
and pi.product_id not in (select product_id from product_info_likes)
group by product_id;
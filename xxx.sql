create database meal_deliveries ;
use meal_deliveries;
create table customer(c_ID int primary key,
cname varchar(20),
phone int);
create table meals(
m_ID int primary key,
name varchar(20),
type varchar(20),
price int,
rating int,
quantity int);
create table orders(
O_ID int primary key,
C_ID int references customer(C_ID),
address varchar(20),
total_price int);
create table driver(
D_ID int primary key,
name varchar(20),
phone int);
create table contain(
O_ID int references orders(O_ID),
M_ID int references meals(M_ID));
create table assigned(
O_ID int references orders(O_ID),
D_ID int references driver(D_ID));
insert into customer values(1001,"ABC",9999),(1002,"abc",7777),(1003,"pqr",8888),(1004,"yz",7878);
select *from customer;
insert into meals values(2001,"chease piza","piza",250,3,10),(2002,"chicken piuza","piza",399,4,8),
(2003,"Dum biriyani","biriyani",259,4,2),
(2004,"Haidrabad Biriyani","Biriyani",399,4,1),
(2005,"veg biriyani","biriyani",269,2,1);
insert into orders values(301,1001,"xyz",5789),(302,1001,"abc",689),(303,1002,"pqr",986),(304,1003,"pqr",526),(305,1004,"xyz",256);
insert into driver values(401,"pra",5555),(402,"pqs",2545),(403,"abh",7656);
insert into assigned values(301,401),(302,402),(303,401),(304,401),(305,403);
insert into contain values(301,2001),(301,2002),(302,2002),(303,2003),(304,2005),(305,2004);
select d.name from driver d,assigned a where d.D_ID=a.D_ID and count(a.O_ID) group by a.D_ID >= ( select count(a.O_ID) group by a.D_ID);
update meals
set price=price+200
where rating <=4 and quantity<=2;
select *from meals;
create view biriyanis as (select M_ID, name, rating from meals where type="biriyani" order by rating);
select *from biriyanis;
select *from assigned;
select *from customer;
select *from driver;
select *from meals;
select *from orders;

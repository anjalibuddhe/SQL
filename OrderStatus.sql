

create table Customers
(
customerid int primary key,
customername varchar(30),
age int,
city varchar(20),
state varchar(20),
dob date
)

insert into Customers values(1,'Pratik',22,'Pune','Maharashtra','1998-1-1')
insert into Customers values(2,'Pankaj',21,'Pune','Maharashtra','1998-1-1')
insert into Customers values(3,'Anjali',23,'Nashik','Maharashtra','1998-1-1')
insert into Customers values(4,'Kishor',21,'Surat','Gaujrat','1998-1-1')
insert into Customers values(5,'Parth',30,'Noida','UP','1998-1-1')

create table Orderstatus(
statusid int primary key,
statusname varchar(20)
)

insert into Orderstatus values(1,'Order')
insert into Orderstatus values(2,'Shipped')
insert into Orderstatus values(3,'Delivered')


create table Orderss
(
orderid int primary key,
customerid int,
statusid int,
orderdate date,
shippeddate date,
deliverydate date
)

insert into Orderss values(101,1,2,'2020-05-20',null,null)
insert into Orderss values(102,2,3,null,null,null)
insert into Orderss values(103,3,2,null,'2020-09-20',null)
insert into Orderss values(104,4,4,'2020-05-20',null,null)
insert into Orderss values(105,5,5,'2020-05-20','2020-05-20',null)
insert into Orderss values(106,6,3,'2020-05-20',null,null)
insert into Orderss values(107,7,2,'2022-06-22',null,null)
insert into Orderss values(108,8,1,'2022-05-20','2022-05-25',null)
insert into Orderss values(109,9,1,'2022-05-20','2022-05-29',null)
insert into Orderss values(111,10,2,'2023-05-22','2023-05-23',null)
insert into Orderss values(112,11,3,'2023-06-20',null,null)
insert into Orderss values(113,1,3,'2022-06-21','2022-05-21',null)
insert into Orderss values(114,2,1,'2023-09-22',null,null)

truncate table orderss


--alter table  Orderss constraint fk_cus_order  foreign key (customerid) references Customers(customerid)

select c1.*, o1.*
from Customers c1
inner join Orderss o1 on o1.customerid=c1.customerid

select c1.*, o1.*
from Customers c1
left join Orderss o1 on o1.customerid=c1.customerid

select c1.*, o1.*
from Customers c1
right join Orderss o1 on o1.customerid=c1.customerid

select c1.*, o1.*
from Customers c1
full outer  join Orderss o1 on o1.customerid=c1.customerid



select * from Customers
select * from Orderstatus
select * from Orderss
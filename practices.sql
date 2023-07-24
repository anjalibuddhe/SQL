create table TQ(
id int primary key,
name varchar(20) not null,
email varchar(20) unique,
age int check (age>=18),
country varchar(15) default 'India',

)

alter table TQ add salary int

insert into TQ values(1,'Sara','sara@gmail.com',22,'USA',30000)
insert into TQ values(2,'Gita','gita@gmail.com',23,'DUBAI',20000)
insert into TQ values(3,'Hari','hari@gmail.com',24,'NEPAL',45000)
insert into TQ values(4,'Sita','sita@gmail.com',25,'USA',56700)
insert into TQ values(5,'John','john@gmail.com',23,'DUBAI',456677)
insert into TQ(id,name,email,age,salary) values(6,'Anjali','anjali@gmail.com',25,40000)
insert into TQ(id,name,email,age,salary) values(7,'Vidya','vidya@gmail.com',24,35000)
insert into TQ(id,name,email,age,salary) values(8,'Anjali','anjali1@gmail.com',21,50000)
insert into TQ(id,name,email,age,salary) values(9,'Rutik','rutik@gmail.com',25,60000)
insert into TQ(id,name,email,age,salary) values(10,'Rutuja','rutuja@gmail.com',25,20000)


select * from TQ where country='India' and salary>45000

select * from TQ where country='India'and salary>2300 and age>26

select * from TQ where not country='India'

select * from TQ where not salary>20000

select * from TQ where name like '[abcde]%'
select * from TQ where name like '%[abcde]'
select * from TQ where name like '%[abcde]%'

select * from TQ where name like '___a'
select * from TQ where name like '____a__'
select * from TQ where name like 'A___l_'

select * from TQ where age in(21,25,26)

select * from TQ where name like '%a'
select * from TQ where name like 'a%'
select * from TQ where name like '%h%h'
select * from TQ where name like '[a-k]%'
select * from TQ where name like '%[a-k]%'

select * from  TQ order by name
select * from  TQ where age>25 order by age DESC
select * from  TQ where age>20 order by age 

select max(salary) as 'Max Salary' from TQ
select min(salary) as 'Min Salary' from TQ
select sum(salary) as 'Total Salary' from TQ
select avg(salary) as 'Avag Salary' from TQ

select count (*) as 'total count' from TQ
select count (distinct id) as 'total count' from TQ 
select count (distinct country) as 'total count' from TQ 


select * from TQ where country is null
select * from TQ where country is not null

select top 3 * from TQ

select top 3 * from TQ order by salary desc

select top 2 percent * from TQ

select top 3 with ties * from TQ order by salary desc

select * from TQ order by salary desc offset 3 rows fetch next 5 rows only

--create table department(
--id int primary key,
--dept varchar(20) not null
--)
create table department1(
did int primary key,
dept varchar(20) not null
)
insert into department1 values(1,'Sales')
insert into department1 values(2,'Admin')
insert into department1 values(3,'HR')
insert into department1 values(4,'Development')
insert into department1 values(5,'Finaces')

alter table TQ add did int  foreign key (did) references department1 (did)

update TQ set did=1 where id in(2,4,5)
update TQ set did=2 where id in(1,3)
update TQ set did=4 where id in(6,7)
update TQ set did=1 where id in(8)
update TQ set did=5 where id in(10)

update TQ set did=1 where id in(9)

select e1.*,d1.dept from TQ e1 inner join department1 d1 on d1.did=e1.did



select * from department1
select * from TQ
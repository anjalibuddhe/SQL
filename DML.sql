create table Employee(
id int primary key,
name varchar(20) not null,
email varchar(20) unique,
age int check (age>=18),
country varchar(15) default 'India'
)

insert into Employee values(1,'Sara','sara@gmail.com',22,'USA')
insert into Employee values(2,'Gita','gita@gmail.com',23,'DUBAI')
insert into Employee values(3,'Hari','hari@gmail.com',24,'NEPAL')
insert into Employee values(4,'Sita','sita@gmail.com',25,'USA')
insert into Employee values(5,'John','john@gmail.com',23,'DUBAI')
insert into Employee(id,name,email,age) values(6,'Anjali','anjali@gmail.com',25)
insert into Employee(id,name,email,age) values(7,'Vidya','vidya@gmail.com',24)
insert into Employee(id,name,email,age) values(8,'Anjali','anjali1@gmail.com',21)
insert into Employee(id,name,email,age) values(9,'Rutik','rutik@gmail.com',25)
insert into Employee(id,name,email,age) values(10,'Rutuja','rutuja@gmail.com',25)


update Employee set country='UK' where id=9
update Employee set name='GitaAnjali' where id=2

update Employee set age=21 where  country='India'
update Employee set country='USA' where id in(8,10)

delete from Employee where id in(1,2)
delete from Employee where age>24

delete from Employee where name='Anjali'

alter table Employee add salary int 

update Employee set salary=2500 where id  in(1,4,6,8)

select * from Employee
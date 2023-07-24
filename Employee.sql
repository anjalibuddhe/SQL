create table Employee
(
empid int primary key,
empname varchar(20) not null,
salary int not null,
deptname varchar(20) not null unique,
address varchar(20) not null,
designation varchar(20) default 'HR',
gender varchar(10)

)
sp_help Employee

insert into  Employee values(101,'Sara',25000,'finances', 'pune','Softwere Developer','Female')
insert into Employee values(102,'Hari',26000,'Sales','Nagpur','Manger','Male')
insert into Employee values(103,'Gita',30000,'Marketing','Mumbai','HR','Female')
insert into Employee values(104,'Sita',36000,'Accounting','Nagpur','IT','Female')
insert into Employee values(105,'Shila',36000,'Shipping','Kolkata','Developer','Female')
insert into Employee values(106,'Vidya',600000,'Shipping1','Kolkata','Developer','Female')

--dispaly empid,salary and designation
select empid,salary,designation from Employee

--Update salary by10%  of employee whose is from Pune
update Employee set salary=salary+(salary*0.10) where address='pune'

--delete all employee whose salary is less than 20k and city is pune 
delete from Employee where salary>20 AND address='pune'

--update address of emp  whose degi. is manger

update Employee set address='Banglore' where  designation='Manger'

--Display all female Employee

select * from Employee where  gender='Female'
--dispaly all the employee from banglore location

select * from Employee where address='Banglore'

--display all HR dept where location is mumbai 
select * from Employee where address='Mumbai'AND deptname='HR'

--delete the emp from sales dept  and salary is more than 25k
delete from Employee where  deptname='Sales' AND salary>2500

--to find emp whose salary is more than 30k and less than 80k
select * from Employee where salary>30000 and salary<80000

--find max salary
select max(salary) as 'Max Salary' from Employee

--To find total no count
select count(*) as 'total count' from Employee

--To find emp whose salary is less than 50k and working in admin dept.
select * from Employee  where salary>50000 and deptname='Shipping1'

--WQ to arrange all the employee in decs. order
select * from Employee order by salary

--to display emp whose salary is not in range 20k to 50k
select * from Employee  where salary not between  20000 and 30000

--WQ to dispaly name and desig. of emp whose is from pune and mumbai location

select empname ,designation from Employee where address in ('pune','Mumbai')

--WQ to dispaly all the emp whose desigantion containes 'E' charc
select * from Employee where designation like '%e%'

select * from Employee
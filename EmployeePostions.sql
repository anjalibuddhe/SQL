create table EmployeeInfo
(
Empid int primary key,
firstname varchar(20),
lastname varchar(20),
Department varchar(20),
Project varchar(10),
Address varchar(20),
DOB date,
Gender varchar(10)
)


insert into EmployeeInfo values(1,'Rohit','Gupta','Admin','P1','Delhi','1992/09/02','Male')
insert into EmployeeInfo values(2,'Rahul','Mahajan','Admin','P2','Mumabi','1986/10/10','Male'),
(3,'Sonia','Banerjee','HR','P3','Pune','1983/06/05','Female'),
(4,'Ankita','Kapoor','HR','P4','Chennai','1983/11/28','Female'),
(5,'Swati','Garg','HR','P5','Delhi','1991/04/06','Female')

create table EmployeePosition
(
Empid int foreign key (Empid) references EmployeeInfo (Empid),
EmpPostion varchar(20),
DateOfJoining varchar(20),
Salary int
)

insert into EmployeePosition values (1,'Executive','2020-04-01',75000)
insert into EmployeePosition values (2,'Manager','2020-04-03',500000)
insert into EmployeePosition values (3,'Manager','2020-04-02',1500000)
insert into EmployeePosition values (2,'Officer','2020-04-02',90000)
insert into EmployeePosition values (1,'Manager','2020-04-03',300000)




--1. Create a query to generate the first records from the EmployeeInfo table.

select * from EmployeeInfo where Empid=1
--2. Create a query to generate the last records from the EmployeeInfo table.
select * from EmployeeInfo where Empid=5

--3. Create a query to fetch the third-highest salary from the EmpPosition table.


select * from EmployeePosition order by salary desc offset 2 rows fetch next 1 rows only





--4. Write a query to find duplicate records from a table.



select Empid,count(*) as duplicate_count
FROM EmployeePosition
GROUP BY Empid
HAVING COUNT(*) > 1


--5. Create an SQL query to fetch EmpPostion and the total salary paid for each employee position.


select EmpPostion, sum(Salary) as Total_salary from EmployeePosition 
group by EmpPostion



--6. Create a query to obtain display employees having salaries equal to or greater than 150000.


select Empid, EmpPostion, Salary
from EmployeePosition
where Salary >= 150000





--7. Create a query to fetch the list of employees of the same department

select Department, count(*) from EmployeeInfo
group by Department
having count(*)>1
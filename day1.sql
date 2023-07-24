create table Employee
(
id int,
name varchar(25),
salary numeric(10,2)
)

sp_help Employee

alter table Employee add qualification varchar(10)

alter table Employee alter column qualification varchar(16)

alter table Employee drop column qualification

alter table Employee add constraint en_emp unique(id,email)

--alter table Employee drop constraint um_emp

sp_rename 'Employee.salary' ,'empsalary'

alter table Employee alter column name varchar(20) not null

alter table Employee alter column empsalary numeric(10,2) not null

alter table Employee alter column id int not null

--alter table Employee add email varchar(40) not null unique

--alter table Employee add constraint un_emp unique(email)

alter table Employee drop constraint un_emp

alter table Employee add constraint pk_emp primary key(id)

alter table Employee drop constraint pk_emp

sp_help Employee

create table Student
(
id int,
name varchar(30),
constraint pk_stud primary key(id)
)


alter table Student drop constraint pk_stud

create table Book
(
book_id int primary key,
book_name varchar(20) not null,
author_name varchar(25) not null,
price float not null

)

sp_help Book

create table Dept
(
	did int primary key,
	dname varchar(20)

)

create table Emp
(
empid int primary key,
ename varchar(20) not null,
did int,
constraint fk_dept_emp foreign key (did) references Dept(did)

)

sp_help Emp
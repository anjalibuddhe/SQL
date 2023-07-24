create table Customers (
id int primary key,
name varchar(20) not null,
city varchar(20),
country varchar(20),
DOB varchar(20),
postalcode int
)

create table Products(
pruductid int,
productname varchar(20),
productprice int
)

insert into Products values(1,'Tata',2000)
insert into Products values(2,'Mobile',1000)
insert into Products values(3,'Mouse',4000)
insert into Products values(4,'Keyboard',5000)
insert into Products values(5,'Laptop',7000)

sp_help Products

insert into Customers values(1,'anjali','Oslo','Norway','12-4-98',411021)
insert into Customers values(2,'Sara','London','England','1-3-99',413210)
insert into Customers values(3,'John','Berlin','Germany','6-07-20',413210)
insert into Customers values(4,'Hari','Pune','India','3-05-22',915421)
insert into Customers values(5,'Vidya','France','Paris','8-05-20',315422)

select * from Customers

--Write a statement that will select the City column from the Customers table
Select city from Customers

--Select all the different values from the Country column in the Customers table.
SELECT DISTINCT country from Customers

--Select all records where the City column has the value "London"
select * from Customers where city ='London'

--Use the NOT keyword to select all records where City is NOT "Berlin".
select * from Customers where  not city in('Berlin')

--Select all records where the CustomerID column has the value 3.
select * from Customers where id=3

--Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 121110.
select * from Customers where city='Berlin' and postalcode=413210

--Select all records where the City column has the value 'Berlin' or 'London'.
select * from Customers where city='Berlin' or city='London'

--Select all records from the Customers table, sort the result alphabetically by the column City.
select * from Customers order by city

--Select all records from the Customers table, sort the result reversed alphabetically by the column City.
select * from Customers order by city desc

--Select all records from the Customers table, sort the result alphabetically, first by the column Country, then, by the column Citysel
select * from Customers order by country, city

--Select all records from the Customers where the PostalCode column is empty.
select * from Customers where postalcode is null

--Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value "Norway".
update Customers set City='Oslo' where country='Norway'

--Delete all the records from the Customers table where the Country value is 'Norway'.
delete  from Customers where country='Norway'

--Use the MIN function to select the record with the smallest value of the Price column.
select min(productprice) as 'smallprice' from Products

--Use an SQL function to select the record with the highest value of the Price column.
select max(productprice) as 'higestprice' from Products

--Use the correct function to return the number of records that have the Price value set to 20
select * from Products where productprice=20000


--Use an SQL function to calculate the average price of all products.

select avg(productprice) as 'avgprice' from Products
--Use an SQL function to calculate the sum of all the Price column values in the Products table

select sum(productprice) as 'totalprices' from Products
--Select all records where the value of the City column starts with the letter "a".
select * from Customers where city like '%a'

--Select all records where the value of the City column ends with the letter "a".
select * from Customers where city like 'a%'

--Select all records where the value of the City column contains the letter "a".

select * from Customers where city like '%a%'


--Select all records where the value of the City column starts with letter "a" and ends with the letter "b".
select * from Customers where city like 'a%b'

--Select all records where the value of the City column does NOT start with the letter "a".
select * from Customers where city like 'a%'

--Select all records where the second letter of the City is an "a".
select * from Customers where city like '_a'

--Select all records where the first letter of the City is an "a" or a "c" or an "s".
select * from Customers where city like '%[ask]'

--Select all records where the first letter of the City starts with anything from an "a" to an "f".
select * from Customers where city like '%[a-f]%'

--Select all records where the first letter of the City is NOT an "a" or a "c" or an "f".

select * from Customers where city not like '[acf]%'

--Use the IN operator to select all the records where the Country is either "Norway" or "France".
select * from Customers where country in('Norway','France')

--Use the IN operator to select all the records where Country is NOT "Norway" and NOT "France".
select * from Customers where city not in('Norway', 'France')

--Use the BETWEEN operator to select all the records where the value of the Price column is between 10 and 20
select * from Products where productprice between 2000 and 3000

--Use the BETWEEN operator to select all the records where the value of the Price column is NOT between 10 and 20.
select * from Products where productprice not between 2000 and 3000
--Use the BETWEEN operator to select all the records where the value of the ProductName column is alphabetically between 'Geitost' and 'Pavlova'.
select * from Products where productname between 'Tata' and 'Laptop'
--When displaying the Customers table, make an ALIAS of the PostalCode column, the column should be called Pno instead.
select postalcode AS Pno from Customers

--When displaying the Customers table, refer to the table as Consumers instead of Customers.
select  'Customers' AS Consumers

--List the number of customers in each country.
select country,count(id) from Customers group by country

--List the number of customers in each country, ordered by the country with the most customers first.
select country,count(id) from Customers group by country
order by count(id) desc

--Write the correct SQL statement to create a new database called testDB.
create database testDB

--Write the correct SQL statement to delete a database named testDB
drop database testDB

--Add a column of type DATE called Birthday in Persons table

alter table Persons add Birthday DATE


--Delete the column Birthday from the Persons table

alter table Persons drop column Birthday
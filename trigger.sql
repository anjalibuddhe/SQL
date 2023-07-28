create table Traceproduct(
id int primary key identity(1,1),
description varchar(200)
)

create table products(
id int,
name varchar(20),
price int
)

insert into products values(1,'Pen',200)
insert into products values(2,'Book',500)
insert into products values(3,'Mouse',1000)
insert into products values(4,'Mobile',2000)

create trigger tr_Product_Insert1
on products after insert
as begin
declare @id int;
declare @name varchar(20);
declare @price int;
select @id=id,@name=name,@price=price from inserted
insert into Traceproduct values('new recored add '+cast(@id as varchar)+' name='+
@name+' price='+cast(@price as varchar)+' date ='+cast (GETDATE()as varchar))
end


create trigger tr_Product_Delete
on products after delete
as begin
declare @id int;
declare @name varchar(20);
declare @price int;
select @id=id,@name=name,@price=price from deleted
insert into Traceproduct values('record delete '+cast(@id as varchar)+' name='+
@name+' price='+cast(@price as varchar)+' date ='+cast (GETDATE()as varchar))
end


delete from products where id=1

select * from products
select * from Traceproduct


select * from Products


create function GetDetails(@productprice int, @discountprice int)

returns int

as begin

declare @discount int
set @discount = @productprice-(@productprice*@discountprice/100)

return @discount
end


select dbo.GetDetails(productprice,5) as 'Discount',productname,productprice from Products








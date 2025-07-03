create database task7;
use task7;
create table Orders (
    OrderID int,
    CustomerName varchar(100),
    ProductName varchar(100),
    Quantity int,
    Price decimal(10,2),
    OrderDate date
);
insert into Orders values 
(1, 'Diya', 'Laptop', 1, 75000, '2024-01-15'),
(2, 'Annanya', 'Mouse', 2, 500, '2024-02-20'),
(3, 'Diya', 'Keyboard', 1, 1200, '2024-02-22');

#view 1 - View Displaying Total Bill Per Customer
create view CustomerBill as
select CustomerName, sum(Quantity * Price) as TotalAmount from Orders group by CustomerName;

#query 1
select * from CustomerBill;
#query 2
select * from CustomerBill where TotalAmount > 5000;

#view 2 - View for Monthly Sales
create view MonthlySales as
select date_format(OrderDate, '%Y-%m') as Month,
    sum(Quantity * Price) as TotalSales from Orders
group by date_format(OrderDate, '%Y-%m');

#query 3
select * from MonthlySales;

#query 4
select * from MonthlySales where TotalSales > 10000;

#view 3 - View Showing Top Customers (Total > 5000)
create view TopCustomers as
select * from CustomerBill where TotalAmount > 5000;

#query 5
select * from TopCustomers;

#view 4 - View Showing Product Popularity
create view ProductSales as
select ProductName,
    count(OrderID) as OrdersCount,
    sum(Quantity) as TotalUnitsSold
from Orders
group by ProductName
order by TotalUnitsSold desc;

#query 6
select * from ProductSales;
#query 7
select * from ProductSales where TotalUnitsSold > 1;

#query 8
select 
    O.CustomerName,
    O.ProductName,
    O.Quantity,
    CB.TotalAmount
from Orders O
join CustomerBill CB on O.CustomerName = CB.CustomerName;




create database store

use store

create table orders(
orderID int,
customerID int,
empID int,
orderDate date,
requiredDate date,
shippedDate date,
shipperID int,
freight int)

~TASK 1~

SELECT * ,
ROW_NUMBER() OVER(PARTITION BY customerID ORDER BY freight) AS 'RowNumber'
FROM orders


create table stock(
storeID int,
productID int,
quantity int)

~TASK2~


select productID,product_sum,  
case when product_sum > (select avg(quantity) from stock) then 'Stock Normal' 
        when product_sum = (select avg(quantity) from stock) then 'Stock Go Out' 
        else  'Stock Out' end stock_condition 
        from ( 
select productID, sum(quantity) product_sum from stock 
group by productID) A 
order by 1


create table order_items(
orderID int,
itemID int,
productID int,
quantity int,
list_price float,
discount float)


~TASK3~

select productID, sum(quantity*list_price * (1-discount/100)) total_spend from order_items 
group by productID



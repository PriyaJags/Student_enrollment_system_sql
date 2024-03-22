use guvi_q4_project;
select * from dataset ;
select count(*) from dataset;

-- 1. select the data who is making profit
select * from dataset where Profit > 0;

-- 2. select the data who is making profit with discount >= 0.5
select * from dataset where Profit > 0 and  discount >= 0.5;

-- 3. select unique customerID
select distinct(customerID) from dataset order by customerID;

-- 4. Take the categories & subcategories in where this unique customerID present
select customerID,category,subcategory from dataset order by customerID,category;

-- 5. select most profit making city
select city as highest_profit_making_city ,sum(profit) as Profit from dataset 
group by city having profit>0 order by  profit desc limit 1;

-- 6. create a newtable duplicate TABLE
-- imported  csv file again and created duplicate_dataset

-- 7. In new table delete the rows whos discount < 0.3;
-- select * from duplicate_dataset;
-- select * from duplicate_dataset where discount < 0.3;
set sql_safe_updates=0;
delete from duplicate_dataset where  discount < 0.3;

-- 8. find what category is sold most
select category as category_sold_most,sum(quantity)as quantity
 from dataset group by category order by quantity desc limit 1;

-- 9. find which shipmode made most profit 
-- individual transaction
select shipmode as shipmode_ofhighest_profit, profit from 
dataset order by profit desc limit 1;

-- all transactions
select shipmode as shipmode_ofhighest_profit, sum(profit) as profit from 
dataset group by shipmode  order by profit desc limit 1;
 
-- 10. GET which subcategories quantity is high
select subcategory as subcategory_of_higest_sales,sum(quantity) as quantity 
from dataset group by subcategory order by quantity desc limit 1;

-- 11. select the rank of 21-31 most sales record
select sales,category,SubCategory,productname,Quantity,city,Country
 from dataset order by sales desc limit 20,11 ;
 
 -- or
select sales,category,SubCategory,productname,Quantity,city,Country,
rank() over(order by sales desc) from dataset limit 20,11 ;

-- 12. create a new column combining category & subcategories ex category = 'Office Supplies' 
-- subcategories = 'Binders' newColumn = 'Office Supplies-Binders'
alter table dataset add column newcol_cat_subcategory text;
update dataset newcol_cat_subcategory 
set newcol_cat_subcategory =concat(category,'-',subcategory);

-- 13. select the data shipped after 8/3/2015 and before 1/10/2017
select * from dataset
where str_to_date(OrderDate, '%m/%d/%Y') > '2015/08/03'
and str_to_date(OrderDate, '%m/%d/%Y') < '2017/01/10';

-- 14. find the most used customerID
select customerid,count(customerid) from dataset group by customerid 
order by count(customerid) desc limit 4;

-- 15. create a new column having customer_name_lenght
alter table dataset add customer_name_length int;
update dataset set customer_name_length = LENGTH(customername);

-- 16. how many unique orders created
select count(distinct(orderid)) as number_of_unique_orders from dataset;

-- 17. what orderID has the most saled
select orderid as orderid_with_maxsales, sum(sales) as sales
 from dataset group by orderid order by sales desc limit 1;
 
 -- 18. randk the ordID based on the sales, grouped on city
 /* created a table to fetch sum of sales for one particular orderid and city
 and then ranking on sales w grouped on city*/ 
 select * from dataset;
 create table total_sales as select orderid,city,sum(sales) as total_sales
 from dataset group by orderid,city ;
select *,rank() over (partition by city order by total_sales desc) as Rank_basedon_total_sales
 from total_sales;

/*this is without summing up the sales of one particular orderid*/
select orderid,city,sales,rank() over (partition by city
order by sales desc) as salesrank from dataset;

-- 19.  find the windowfunction-sum basedon partition by date
select productid,productname,orderdate,sales,sum(sales)
 over (partition by str_to_date(orderdate,'%m/%d/%Y')) as total_sales_per_date from dataset;
 
 -- 20. productID sales
  select productid,productname ,sum(sales) as total_sales from dataset group by productid, productname
 order by sum(sales) desc;

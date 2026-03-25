-- data exploration
-- count of rows
select * from zepto
limit 10;
-- null count
select * from zepto
where category is null
or
Product_name is null
or
mrp is null
or
discount_percent is null
or
Available_quantity is null
or
discounted_selling_price is null
or
weight_gms is null
or
Out_of_stock is null
or
product_quantity is null;

-- product category
select distinct category
from zepto
order by category;
-- products in stock and out of stock
select Out_of_stock ,
 count( Sku_id)
 from zepto
 group by Out_of_stock;
 -- product names precent multiple times
 select Product_name , count(Sku_id) as "number of sku"
 from zepto
 group by Product_name
 having count(Sku_id)>1
 order by count(Sku_id) desc;
 
 -- data cleaning
 -- products with price = 0
 select * from zepto
 where mrp = 0 or discounted_selling_price = 0;
 
 -- deleting the row
 SET SQL_SAFE_UPDATES = 0;

DELETE FROM zepto
WHERE mrp = 0;

-- convert paise to rupees 
update zepto
set mrp = mrp/100.0,
discounted_selling_price = discounted_selling_price/100.0;

select mrp , discounted_selling_price from zepto;


-- Q1. Find the top 10 best-value products based on the discount percentage.
select distinct Product_name,mrp,discount_percent from zepto
order by discount_percent desc
limit 10;

-- Q2. What are the Products with High MRP but Out of Stock
select Product_name,mrp from zepto
where Out_of_stock = 1 and mrp > 300.00
order by mrp desc;

-- Q3. Calculate Estimated Revenue for each category
select category,
sum(discounted_selling_price * Available_quantity) as total_revenue from zepto
group by category
order by total_revenue desc;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
select Product_name , mrp , discount_percent from zepto
where mrp >500.00 and discount_percent <10.00
order by mrp desc , discount_percent desc;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
select category ,
round(avg(discount_percent),2) as avg_discount
from zepto
group by category
order by avg_discount desc
limit 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
select distinct Product_name , mrp , weight_gms , discounted_selling_price,
round(discounted_selling_price/weight_gms,2) as price_per_gram
from zepto
where weight_gms > 100
order by price_per_gram desc;


-- Q7. Group the products into categories like Low, Medium, Bulk.
select Product_name , weight_gms,
case when weight_gms < 1000 then 'low'
when weight_gms < 5000 then 'medium'
else 'bulk'
end as weight_category
from zepto;

-- Q8. What is the Total Inventory Weight Per Category
select category,
sum(weight_gms * Available_quantity)/1000 as total_inventory_weight
from zepto
group  by category
order by total_inventory_weight desc;

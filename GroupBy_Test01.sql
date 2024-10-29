select count(ProductID) as 'Count' from Product where ProductCategoryID = 2		--count stuffs in specific category

select count(ProductID) as 'Count' from Product		--count all the stuffs in any category

select count(ProductID) as 'Count' from Product where ProductCategoryID between 1 and 4		--count stuffs between categoryid 1 to 4

select  ProductCategoryID,count(ProductID) as 'Count' from Product		-- give the full result of productcategoryid and count	
Group by ProductCategoryID

select ProductCategory.Title ,count(ProductID) as 'Count' from Product , ProductCategory
where Product.ProductCategoryID = ProductCategory.ProductCategoryID							--use titles in productcategory table and group by
Group by ProductCategory.Title 


select ProductCategory.Title , Count(ProductID) as 'Number of Products' from Product , ProductCategory
where Product.ProductCategoryID = ProductCategory.ProductCategoryID and Product.Price >= 10000			--filds wich are not accepted by the condition are not visible here
group by ProductCategory.Title

select ProductCategory.Title , Count(ProductID) as 'Number of Products' from Product , ProductCategory
where Product.ProductCategoryID = ProductCategory.ProductCategoryID and Product.Price >= 10000			--for showing them we can use gorup by all		
group by all ProductCategory.Title

select DATEPART(YEAR,OrderDate) as 'Year' , count(OrderID)
From Orders
group by OrderDate
																					--Test both and see the diffrent!
select DATEPART(YEAR,OrderDate) as 'Year' , count(OrderID)
From Orders
group by DATEPART(YEAR,OrderDate)

select DATEPART(YEAR,OrderDate) as 'Year' , DATEPART(MONTH,OrderDate) as 'Month'
,count(OrderID) as 'Number of Orders'
From Orders																			--using month too and sorting it			
group by DATEPART(YEAR,OrderDate),DATEPART(MONTH,OrderDate)
order by DATEPART(YEAR,OrderDate) , DATEPART(MONTH,OrderDate)


Select DATEPART(Year,OrderDate) as 'Year' , Count(OrderID) as 'Number of orders' From Orders
group by DATEPART(Year,OrderDate) with Rollup														--gives a sum for all group by Column		
--group by Rollup(DATEPART(Year,OrderDate))															-- <= also can be used this way

Select DATEPART(Year,OrderDate) as 'Year' , DATEPART(MONTH,OrderDate) as 'Month',
Count(OrderID) as 'Number of orders'																--gives a sum for all records	
From Orders
group by DATEPART(Year,OrderDate) , DATEPART(MONTH,OrderDate) with cube 


Select DATEPART(Year,OrderDate) as 'Year' , DATEPART(MONTH,OrderDate) as 'Month',
Count(OrderID) as 'Number of orders',																--gives a flag so you know wich record is the extended with cube or rollup	
grouping(DATEPART(Year,OrderDate)) as 'Grouping Year'
From Orders
group by DATEPART(Year,OrderDate) , DATEPART(MONTH,OrderDate) with cube 

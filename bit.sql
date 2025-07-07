select * from BlinkIT_Grocery_Data ;
describe BlinkIT_Grocery_Data ;
select count(*) from BlinkIT_Grocery_Data;

ALTER TABLE BlinkIT_Grocery_Data
CHANGE COLUMN `Outlet Size` Outlet_Size VARCHAR(100);


UPDATE BlinkIT_Grocery_Data
SET Item_Fat_Content = CASE
    WHEN (Item_Fat_Content) IN ('lf', 'low fat') THEN 'Low Fat'
    WHEN (Item_Fat_Content)IN ('reg', 'regular') THEN 'Regular'
    ELSE Item_Fat_Content
END;
select distinct(Item_Fat_Content) from BlinkIT_Grocery_Data;
SELECT cast(SUM(Sales)/1000000 as decimal(10,2)) AS Total_sales_Millions
FROM BlinkIT_Grocery_Data where Outlet_Establishment_Year= 2022;
select avg(Sales)  as Total_Average from  BlinkIT_Grocery_Data where Outlet_Establishment_Year=2022;
select count(*) as NO_OF_ITEMS from BlinkIT_Grocery_Data where Outlet_Establishment_Year =2022;
select avg(Rating) as Average_Rating from BlinkIT_Grocery_Data where Outlet_Establishment_Year =2022;

SELECT 
    Item_Fat_Content,
  cast(SUM(Sales) as decimal(10,2)) AS Total_sales_Millions,
    cast(AVG(Sales) AS decimal(10,1)) as Total_Average,
    COUNT(*) AS NO_OF_ITEMS,
    AVG(Rating) AS Average_Rating
FROM BlinkIT_Grocery_Data where Outlet_Establishment_Year=2020
GROUP BY Item_Fat_Content
ORDER BY sum(Sales) desc; 

SELECT 
    Item_Type,
  cast(SUM(Sales)/1000 as decimal(10,2)) AS Total_sales_Thousands,
    cast(AVG(Sales) AS decimal(10,1)) as Total_Average,
    COUNT(*) AS NO_OF_ITEMS,
    AVG(Rating) AS Average_Rating
FROM BlinkIT_Grocery_Data
GROUP BY Item_Type
ORDER BY sum(Sales) desc; 


SELECT 
    Item_Fat_Content,
  cast(SUM(Sales)/1000000 as decimal(10,2)) AS Total_sales_Millions,
    cast(AVG(Sales) AS decimal(10,1)) as Total_Average,
    COUNT(*) AS NO_OF_ITEMS,
    AVG(Rating) AS Average_Rating
FROM BlinkIT_Grocery_Data
GROUP BY Item_Fat_Content
ORDER BY sum(Sales) desc; 

SELECT 
    Item_Type,
  cast(SUM(Sales) as decimal(10,2)) AS Total_sales,
    cast(AVG(Sales) AS decimal(10,1)) as Total_Average,
    COUNT(*) AS NO_OF_ITEMS,
    AVG(Rating) AS Average_Rating
FROM BlinkIT_Grocery_Data
GROUP BY Item_Type
ORDER BY sum(Sales) desc limit 5 ;

SELECT 
     Outlet_Location_Type,Item_Fat_Content,
    CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_sales,
    CAST(AVG(Sales) AS DECIMAL(10,1)) AS Total_Average,
    COUNT(*) AS NO_OF_ITEMS,
    AVG(Rating) AS Average_Rating
FROM BlinkIT_Grocery_Data
GROUP BY Outlet_Location_Type , Item_Fat_Content
ORDER BY SUM(Sales) DESC;
SELECT 
    Outlet_Location_Type,
    ROUND(SUM(CASE WHEN Item_Fat_Content = 'Low Fat' THEN Sales ELSE 0 END), 2) AS Low_Fat,
    ROUND(SUM(CASE WHEN Item_Fat_Content = 'Regular' THEN Sales ELSE 0 END), 2) AS Regular
FROM BlinkIT_Grocery_Data
GROUP BY Outlet_Location_Type
ORDER BY Outlet_Location_Type;
SELECT  
    Outlet_Establishment_Year,
    CAST(SUM(Sales) AS DECIMAL(10,1)) AS Total_sales,
    CAST(AVG(Sales) AS DECIMAL(10,1)) AS Total_Average,
    COUNT(*) AS NO_OF_ITEMS,
    AVG(Rating) AS Average_Rating
FROM blinkit_grocery_data
GROUP BY Outlet_Establishment_Year
ORDER BY Total_sales ASC;
SELECT  
    Outlet_Establishment_Year,
    CAST(SUM(Sales) AS DECIMAL(10,1)) AS Total_sales,
    CAST(AVG(Sales) AS DECIMAL(10,1)) AS Total_Average,
    COUNT(*) AS NO_OF_ITEMS,
    AVG(Rating) AS Average_Rating
FROM blinkit_grocery_data
GROUP BY Outlet_Establishment_Year
ORDER BY Total_sales ASC;
SELECT  
    Outlet_Establishment_Year,
    CAST(SUM(Sales) AS DECIMAL(10,1)) AS Total_sales,
    CAST(AVG(Sales) AS DECIMAL(10,1)) AS Total_Average,
    COUNT(*) AS NO_OF_ITEMS,
    AVG(Rating) AS Average_Rating
FROM blinkit_grocery_data
GROUP BY Outlet_Establishment_Year
ORDER BY Total_sales ASC;
SELECT  
    Outlet_Size,
    ROUND(SUM(Sales) * 100.0 / 
          (SELECT SUM(Sales) FROM blinkit_grocery_data), 2) AS Total_sales,
    CAST(AVG(Sales) AS DECIMAL(10,1)) AS Total_Average,
    COUNT(*) AS NO_OF_ITEMS,
    ROUND(AVG(Rating), 2) AS Average_Rating
FROM blinkit_grocery_data
GROUP BY Outlet_Size
ORDER BY Total_sales ASC;

SELECT  
    Outlet_Location_Type,
    ROUND(SUM(Sales) * 100.0 / 
          (SELECT SUM(Sales) FROM blinkit_grocery_data), 2) AS Total_sales,
    CAST(AVG(Sales) AS DECIMAL(10,1)) AS Total_Average,
    COUNT(*) AS NO_OF_ITEMS,
    ROUND(AVG(Rating), 2) AS Average_Rating
FROM blinkit_grocery_data where Outlet_Establishment_Year = 2020
GROUP BY Outlet_Location_Type
ORDER BY Total_sales ASC;


describe BlinkIT_Grocery_Data ;
 



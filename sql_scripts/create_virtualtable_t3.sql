create view ordermorethantwotimes as 
SELECT 
p.ProductID, 
p.CusineName, 
p.StarterName,
p.CourseName,
p.DesertName,
p.Drink, 
p.Sides 
FROM 
products p 
WHERE p.ProductID IN (
    SELECT o.ProductID
    FROM orderdetails o 
    GROUP BY o.ProductID 
    HAVING SUM(o.Quantity) > 2
)

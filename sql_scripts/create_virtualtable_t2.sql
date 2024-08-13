create view ordersale_w_customer as
SELECT 
    od.OrderID, 
    c.CustomerName, 
    p.CusineName , 
    p.StarterName, 
    p.CourseName, 
    p.DesertName , 
    p.Drink, 
    p.Sides, 
    od.Quantity, 
    s.Cost, 
    s.Sales 
FROM 
    orderdetails od 
INNER JOIN 
    products p ON od.ProductID = p.ProductID 
INNER JOIN 
    orders o ON o.OrderID = od.OrderID 
INNER JOIN 
    customers c ON o.CustomerID = c.CustomerID  -- Assuming there's a CustomerID in orders
INNER JOIN 
    sales s ON od.OrderDetailID = s.OrderDetailID;
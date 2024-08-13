create view OrderSaleView as	
select 
o.OrderDetailID ,o.OrderID , p.CusineName , p.StarterName ,p.CourseName ,p.DesertName ,p.Drink ,p.Sides ,o.Quantity , s.Cost ,s.Sales 
from orderdetails o 
inner join products p on o.ProductID  = p.ProductID 
inner join sales s on o.OrderDetailID = s.OrderDetailID ;
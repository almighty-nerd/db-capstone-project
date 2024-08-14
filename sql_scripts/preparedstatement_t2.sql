use mydb;

-- Step 1: Prepare the statement
PREPARE GetOrderDetail FROM 
    'SELECT o.OrderID, od.Quantity, s.Cost
     FROM Orders o 
	 INNER JOIN orderdetails od ON o.OrderID = od.OrderID
	 INNER JOIN sales s ON s.orderdetailid = od.orderdetailid 
     WHERE CustomerID = ?'
		;

-- Step 2: Create a variable and assign it a value
SET @id = "01-889-1994";  -- Assigning CustomerID value

-- Step 3: Execute the prepared statement
EXECUTE GetOrderDetail USING @id;


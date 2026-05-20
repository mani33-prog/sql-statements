
SELECT
Retrieve and transform data from one or more columns.
Q1. Retrieve all columns from the Employees table. [Basic]

SELECT * FROM Employees;


Q2. Retrieve only EmpName and Salary from Employees. [Basic]

 
 SELECT EmpName, Salary FROM Employees;

Q3. Display all distinct DeptID values present in the Employees table. [Basic]

SELECT DISTINCT DeptID FROM Employees;

Q4. List all employees and display their salary increased by 10% (alias the column as NewSalary).
[Basic]
  
  SELECT EmpName ,Salary *1.10 AS NewSalary FROM Employees;


Q5. Concatenate EmpName with the text ' works in dept ' and DeptID into a single column called
Description. [Basic]

  SELECT EmpName || ' works in dept' || DeptID AS Description FROM Employees;
 
 
 
Q6. Select the top 5 highest-paid employees. [Intermediate]

    SELECT TOP 5 EmpName,salary FROM Employees ORDER BY Salary DESC;
Q7. List all projects along with the number of days between StartDate and EndDate (NULL if
ongoing). Alias as DurationDays. [Intermediate]

SELECT * FROM Projects;

SELECT ProjectName,  DATEDIFF(DAY , StartDate , EndDate) AS DurationDays From Projects;


Q8. Display each employee's name and the year they were hired. [Intermediate]

  SELECT * FROM Employees;

  SELECT EmpName, YEAR(HireDate) As HiredYear FROM Employees; 

Q9. Using a subquery in the SELECT clause, display each employee's name and the total amount
of orders they placed. [Advanced]

Select * from Orders;

SELECT EmpName 
FROM Employees 
WHERE EmpID IN (SELECT EmpID FROM Orders);

SELECT E.EmpName, O.Amount
FROM Employees E
JOIN Orders O ON E.EmpID = O.EmpID
ORDER BY O.Amount;

SELECT E.EmpName, (SELECT SUM(Amount) FROM Orders O WHERE O.EmpID = E.EmpID) AS TotalOrders
FROM Employees E;


Q10. Use a CTE to rank employees within each department by salary (highest first) and show only
rank 1 per department. [Advanced]

SELECT 
    E.EmpName,
    ISNULL((SELECT SUM(O.Amount) 
             FROM Orders O
             WHERE O.EmpID = E.EmpID), 0) AS TotalOrderAmount,

    ISNULL((SELECT COUNT(O.OrderID) 
             FROM Orders O
             WHERE O.EmpID = E.EmpID), 0) AS TotalOrdersPlaced,

    ISNULL((SELECT AVG(O.Amount) 
             FROM Orders O
             WHERE O.EmpID = E.EmpID), 0) AS AvgOrderAmount,

    ISNULL((SELECT MAX(O.Amount) 
             FROM Orders O
             WHERE O.EmpID = E.EmpID), 0) AS HighestOrder,

    ISNULL((SELECT MIN(O.Amount) 
             FROM Orders O
             WHERE O.EmpID = E.EmpID), 0) AS LowestOrder

FROM Employees E
ORDER BY TotalOrderAmount DESC;


SELECT 
    EmpName,
    ISNULL((SELECT SUM(Amount) 
             FROM Orders 
             WHERE Orders.EmpID = Employees.EmpID), 0) AS TotalAmount
FROM Employees;
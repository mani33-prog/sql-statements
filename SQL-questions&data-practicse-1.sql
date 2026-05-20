



-- 1. Departments
CREATE TABLE Departments (
DeptID INT PRIMARY KEY,
DeptName VARCHAR(50),
Location VARCHAR(50)
);

-- 2. Employees
CREATE TABLE Employees (
EmpID INT PRIMARY KEY,
EmpName VARCHAR(100),
DeptID INT REFERENCES Departments(DeptID),
Salary DECIMAL(10,2),
HireDate DATE,
ManagerID INT NULL
);



-- 3. Projects
CREATE TABLE Projects (
ProjectID INT PRIMARY KEY,
ProjectName VARCHAR(100),
DeptID INT REFERENCES Departments(DeptID),
Budget DECIMAL(12,2),
StartDate DATE,
EndDate DATE NULL
);

-- 4. EmpProjects (bridge table)
CREATE TABLE EmpProjects (
EmpID INT REFERENCES Employees(EmpID),
ProjectID INT REFERENCES Projects(ProjectID),
HoursWorked INT,
PRIMARY KEY (EmpID, ProjectID)
);

-- 5. Orders
CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
EmpID INT REFERENCES Employees(EmpID),
OrderDate DATE,
Amount DECIMAL(10,2),
Status VARCHAR(20)
);


-- ■■■■■■■■■■■■■■■■ INSERT DATA ■■■■■■■■■■■■■■■■
INSERT INTO Departments VALUES
(1,'Engineering','New York'),
(2,'Marketing','Chicago'),
(3,'Sales','Houston'),
(4,'HR','Boston'),
(5,'Finance','Seattle');


INSERT INTO Employees VALUES
(101,'Alice Johnson',1,95000,'2019-03-15',NULL),
(102,'Bob Smith',1,85000,'2020-07-01',101),
(103,'Carol White',2,72000,'2018-11-20',NULL),
(104,'David Brown',3,68000,'2021-01-10',NULL),
(105,'Eva Green',3,74000,'2017-05-30',104),
(106,'Frank Lee',4,61000,'2022-02-14',NULL),
(107,'Grace Kim',1,91000,'2016-09-09',101),
(108,'Henry Park',2,65000,'2023-06-01',103),
(109,'Iris Chen',5,88000,'2020-12-01',NULL),
(110,'Jack Wilson',NULL,52000,'2024-01-15',NULL);

INSERT INTO Projects VALUES
(1001,'Apollo',1,500000,'2022-01-01','2023-06-30'),
(1002,'Beacon',2,120000,'2023-03-01',NULL),
(1003,'Comet',3,80000,'2021-06-01','2022-12-31'),
(1004,'Delta',1,350000,'2023-07-01',NULL),
(1005,'Echo',5,200000,'2022-09-01','2024-01-01');

INSERT INTO EmpProjects VALUES
(101,1001,200),(101,1004,150),(102,1001,300),(102,1004,100),
(103,1002,250),(104,1003,180),(105,1003,220),(107,1001,400),
(107,1004,200),(108,1002,130),(109,1005,300),(106,1005,50);

INSERT INTO Orders VALUES
(2001,101,'2023-01-15',4500.00,'Completed'),
(2002,102,'2023-02-20',1200.00,'Pending'),
(2003,103,'2023-03-10',3300.00,'Completed'),
(2004,101,'2023-04-05',8700.00,'Completed'),
(2005,105,'2023-05-18',2200.00,'Cancelled'),
(2006,104,'2023-06-22',1750.00,'Pending'),
(2007,107,'2023-07-30',9900.00,'Completed'),
(2008,102,'2023-08-14',650.00,'Completed'),
(2009,109,'2023-09-01',5500.00,'Pending'),
(2010,101,'2023-10-11',3100.00,'Completed');

-- SCHEMA
CREATE TABLE customers (
    customer_id     INT PRIMARY KEY,
    name            VARCHAR(100),
    dob             DATE,
    interest_rate   DECIMAL(5,2),
    balance         DECIMAL(12,2),
    is_vip          VARCHAR(5) DEFAULT 'FALSE'
);

create table accounts(
  accountid int primary key,
  customerid int,
  accounttype varchar(20),
  balance int,
  lastmodified date,
  Foreign key(customerid) references customers(customer_id)
);
CREATE TABLE Transactions (
    TransactionID int PRIMARY KEY,
    AccountID int,
    TransactionDate DATE,
    Amount int,
    TransactionType VARCHAR(10),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);
CREATE TABLE Employees (
    EmployeeID int PRIMARY KEY,
    Name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10,2),
    Department VARCHAR(50),
    HireDate DATE
); 

-- INSERT DATA
INSERT INTO customers VALUES 
(1, 'Kushal', '1964-06-20', 8.5, 9500.00, 'FALSE'),
(2, 'Aarav', '1955-01-15', 9.0, 12000.00, 'FALSE'),
(3, 'Diya', '1985-11-02', 7.8, 15000.00, 'FALSE'),
(4, 'Rohit', '1960-06-20', 8.2, 5000.00, 'FALSE'),
(5, 'Meera', '1990-12-10', 9.5, 11000.00, 'FALSE');

INSERT INTO accounts (accountid, customerid, accounttype, balance, lastmodified) VALUES
(1, 1, 'Savings', 9500, CURDATE()),
(2, 2, 'Current', 12000, CURDATE()),
(3, 3, 'Savings', 15000, CURDATE()),
(4, 4, 'Current', 5000, CURDATE()),
(5, 5, 'Savings', 11000, CURDATE());

INSERT INTO transactions (transactionid, accountid, transactiondate, amount, transactiontype) VALUES
(201, 1, CURDATE(), 2000, 'Deposit'),
(202, 1, CURDATE(), 500, 'Withdrawal'),

(203, 2, CURDATE(), 1000, 'Deposit'),
(204, 2, CURDATE(), 800, 'Withdrawal'),

(205, 3, CURDATE(), 5000, 'Deposit'),
(206, 3, CURDATE(), 1000, 'Withdrawal'),

(207, 4, CURDATE(), 1500, 'Deposit'),
(208, 4, CURDATE(), 100, 'Withdrawal'),

(209, 5, CURDATE(), 3000, 'Deposit'),
(210, 5, CURDATE(), 700, 'Withdrawal');

INSERT INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate)
VALUES (1, 'Alice Johnson', 'HR Manager', 70000, 'HR', '2015-06-15');

INSERT INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate)
VALUES (2, 'Bob Brown', 'Software Developer', 85000, 'IT', '2018-03-20');

INSERT INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate)
VALUES (3, 'Clara Singh', 'Data Analyst', 75000, 'Analytics', '2020-11-05');

INSERT INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate)
VALUES (4, 'David Lee', 'System Administrator', 68000, 'IT', '2017-09-10');

INSERT INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate)
VALUES (5, 'Eva Desai', 'Marketing Specialist', 72000, 'Marketing', '2019-01-25');
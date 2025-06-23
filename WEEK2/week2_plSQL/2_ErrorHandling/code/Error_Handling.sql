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
  cousotmerid int,
  accounttype varchar(20),
  balance int,
  lastmodified date,
  Foreign key(cousotmerid) references customers(customer_id)
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

INSERT INTO accounts (accountid, cousotmerid, accounttype, balance, lastmodified) VALUES
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

select * from accounts;
select * from transactions;
select * from Employees;

DELIMITER $$

CREATE PROCEDURE SafeTransferFunds(
  IN FROM_ACC INT,
  IN TO_ACC INT,
  IN TRANSFER_AMOUNT INT
)
BEGIN
DECLARE BAL INT;


  START TRANSACTION;
  SELECT balance INTO BAL  FROM accounts WHERE accountid = FROM_ACC;
  IF BAL < TRANSFER_AMOUNT THEN 
    ROLLBACK;
    SELECT CONCAT('INSUFFICIENT FUND FOR ACC: ',FROM_ACC) AS insufficient_fundMSG;
  ELSE 
    UPDATE accounts
    SET BALANCE = BALANCE - TRANSFER_AMOUNT, lastmodified = CURDATE()
    WHERE accountid = FROM_ACC;
    
    UPDATE accounts
    SET BALANCE= BALANCE + TRANSFER_AMOUNT,lastmodified = CURDATE()
    WHERE accountid = TO_ACC;
  COMMIT;
    
  SELECT CONCAT('AMOUNT ',TRANSFER_AMOUNT,' TRANSFERRED FROM ACC NO:',FROM_ACC,' TO ACC NO:',TO_ACC) AS MSG;
  END IF;

END;
$$
DELIMITER ;



CALL SafeTransferFunds(1,2,20000);

DELIMITER $$

CREATE PROCEDURE UpdateSalary(
  IN EID INT,
  IN PERCENTAGE INT
)
BEGIN
  DECLARE NF INT DEFAULT 0;
  DECLARE EMPID INT;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET NF = 1;
  
  START TRANSACTION;
  SELECT EmployeeID INTO EMPID FROM Employees WHERE EmployeeID =  EID;
  
  
  IF NF = 1 THEN
    ROLLBACK;
    SELECT CONCAT('INVALID EmployeeID. EMPLOYEE DOES NOT EXIST') AS NO_FOUNDMSG;
  ELSE
    UPDATE EMPLOYEES SET
    Salary = Salary + Salary * (PERCENTAGE/100)
    WHERE EmployeeID = EID;
    COMMIT;
    SELECT CONCAT('SALARY UPDATED FOR EMPLOYEE ID: ',EID) AS UPDATEMSG;
  END IF;
  

END;
$$
DELIMITER ;

CALL UpdateSalary(100,50);


DELIMITER $$
create procedure AddNewCustomeR(
  IN customer_id INT,
  IN  name          VARCHAR(100),
  IN  dob           DATE,
  IN  interest_rate DECIMAL(5,2),
  IN  balance       DECIMAL(12,2),
  IN  is_vip        VARCHAR(5)
)
BEGIN
  DECLARE DUPLICATE VARCHAR(10) DEFAULT 'FALSE';
  DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SET DUPLICATE = 'TRUE';

    INSERT INTO customers VALUES(
      customer_id,
      NAME,
      DOB,
      interest_rate,
      balance,
      is_vip
    );
  
  IF DUPLICATE = 'TRUE' THEN
    SELECT CONCAT('CUSTOMER WITH THIS ID ALREADY EXISTS.') AS ERRMSG;
  ELSE
    SELECT CONCAT('CUSTOMER ADDED SUCCESSFULLY.') AS SUCCMSG;
  END IF;
END;
$$
DELIMITER ;

CALL AddNewCustomer(1, 'John Doe', '1985-01-01', 7.5, 12000.00, 'FALSE');




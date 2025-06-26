-- ======================== TABLE CREATION ========================

CREATE TABLE customers (
    customer_id     NUMBER PRIMARY KEY,
    name            VARCHAR2(100),
    dob             DATE,
    interest_rate   NUMBER(5,2),
    balance         NUMBER(12,2),
    is_vip          VARCHAR2(5) DEFAULT 'FALSE'
);

CREATE TABLE accounts (
    accountid       NUMBER PRIMARY KEY,
    customerid      NUMBER,
    accounttype     VARCHAR2(20),
    balance         NUMBER,
    lastmodified    DATE,
    FOREIGN KEY (customerid) REFERENCES customers(customer_id)
);

CREATE TABLE loans (
    loan_id         NUMBER PRIMARY KEY,
    customer_id     NUMBER,
    loan_amount     NUMBER(12,2),
    interest_rate   NUMBER(5,2),
    start_date      DATE,
    end_date        DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE transactions (
    transactionid     NUMBER PRIMARY KEY,
    accountid         NUMBER,
    transactiondate   DATE,
    amount            NUMBER,
    transactiontype   VARCHAR2(10),
    FOREIGN KEY (accountid) REFERENCES accounts(accountid)
);

CREATE TABLE employees (
    employeeid     NUMBER PRIMARY KEY,
    name           VARCHAR2(100),
    position       VARCHAR2(50),
    salary         NUMBER(10,2),
    department     VARCHAR2(50),
    hiredate       DATE
);

-- ======================== INSERT DATA ========================

-- Customers
INSERT INTO customers VALUES (1, 'Kushal', TO_DATE('1964-06-20', 'YYYY-MM-DD'), 8.5, 9500.00, 'FALSE');
INSERT INTO customers VALUES (2, 'Aarav', TO_DATE('1955-01-15', 'YYYY-MM-DD'), 9.0, 12000.00, 'FALSE');
INSERT INTO customers VALUES (3, 'Diya', TO_DATE('1985-11-02', 'YYYY-MM-DD'), 7.8, 15000.00, 'FALSE');
INSERT INTO customers VALUES (4, 'Rohit', TO_DATE('1960-06-20', 'YYYY-MM-DD'), 8.2, 5000.00, 'FALSE');
INSERT INTO customers VALUES (5, 'Meera', TO_DATE('1990-12-10', 'YYYY-MM-DD'), 9.5, 11000.00, 'FALSE');

-- Loans
INSERT ALL
  INTO loans (loan_id, customer_id, loan_amount, interest_rate, start_date, end_date)
    VALUES (101, 1, 50000.00, 7.5, SYSDATE, SYSDATE + 15)
  INTO loans (loan_id, customer_id, loan_amount, interest_rate, start_date, end_date)
    VALUES (102, 2, 30000.00, 8.0, SYSDATE, SYSDATE + 5)
  INTO loans (loan_id, customer_id, loan_amount, interest_rate, start_date, end_date)
    VALUES (103, 3, 70000.00, 6.9, SYSDATE, SYSDATE + 45)
  INTO loans (loan_id, customer_id, loan_amount, interest_rate, start_date, end_date)
    VALUES (104, 4, 20000.00, 8.5, SYSDATE, SYSDATE + 25)
  INTO loans (loan_id, customer_id, loan_amount, interest_rate, start_date, end_date)
    VALUES (105, 5, 45000.00, 7.9, SYSDATE, SYSDATE - 10)
SELECT * FROM dual;

-- Accounts
INSERT ALL
  INTO accounts (accountid, customerid, accounttype, balance, lastmodified)
    VALUES (1, 1, 'Savings', 9500, SYSDATE)
  INTO accounts (accountid, customerid, accounttype, balance, lastmodified)
    VALUES (2, 2, 'Current', 12000, SYSDATE)
  INTO accounts (accountid, customerid, accounttype, balance, lastmodified)
    VALUES (3, 3, 'Savings', 15000, SYSDATE)
  INTO accounts (accountid, customerid, accounttype, balance, lastmodified)
    VALUES (4, 4, 'Current', 5000, SYSDATE)
  INTO accounts (accountid, customerid, accounttype, balance, lastmodified)
    VALUES (5, 5, 'Savings', 11000, SYSDATE)
SELECT * FROM dual;


-- Transactions
INSERT ALL
  INTO transactions (transactionid, accountid, transactiondate, amount, transactiontype)
    VALUES (201, 1, SYSDATE, 2000, 'Deposit')
  INTO transactions (transactionid, accountid, transactiondate, amount, transactiontype)
    VALUES (202, 1, SYSDATE, 500, 'Withdrawal')
  INTO transactions (transactionid, accountid, transactiondate, amount, transactiontype)
    VALUES (203, 2, SYSDATE, 1000, 'Deposit')
  INTO transactions (transactionid, accountid, transactiondate, amount, transactiontype)
    VALUES (204, 2, SYSDATE, 800, 'Withdrawal')
  INTO transactions (transactionid, accountid, transactiondate, amount, transactiontype)
    VALUES (205, 3, SYSDATE, 5000, 'Deposit')
  INTO transactions (transactionid, accountid, transactiondate, amount, transactiontype)
    VALUES (206, 3, SYSDATE, 1000, 'Withdrawal')
  INTO transactions (transactionid, accountid, transactiondate, amount, transactiontype)
    VALUES (207, 4, SYSDATE, 1500, 'Deposit')
  INTO transactions (transactionid, accountid, transactiondate, amount, transactiontype)
    VALUES (208, 4, SYSDATE, 100, 'Withdrawal')
  INTO transactions (transactionid, accountid, transactiondate, amount, transactiontype)
    VALUES (209, 5, SYSDATE, 3000, 'Deposit')
  INTO transactions (transactionid, accountid, transactiondate, amount, transactiontype)
    VALUES (210, 5, SYSDATE, 700, 'Withdrawal')
SELECT * FROM dual;

-- Employees
INSERT ALL
  INTO employees (employeeid, name, position, salary, department, hiredate)
    VALUES (1, 'Alice Johnson', 'HR Manager', 70000, 'HR', TO_DATE('2015-06-15', 'YYYY-MM-DD'))
  INTO employees (employeeid, name, position, salary, department, hiredate)
    VALUES (2, 'Bob Brown', 'Software Developer', 85000, 'IT', TO_DATE('2018-03-20', 'YYYY-MM-DD'))
  INTO employees (employeeid, name, position, salary, department, hiredate)
    VALUES (3, 'Clara Singh', 'Data Analyst', 75000, 'Analytics', TO_DATE('2020-11-05', 'YYYY-MM-DD'))
  INTO employees (employeeid, name, position, salary, department, hiredate)
    VALUES (4, 'David Lee', 'System Administrator', 68000, 'IT', TO_DATE('2017-09-10', 'YYYY-MM-DD'))
  INTO employees (employeeid, name, position, salary, department, hiredate)
    VALUES (5, 'Eva Desai', 'Marketing Specialist', 72000, 'Marketing', TO_DATE('2019-01-25', 'YYYY-MM-DD'))
SELECT * FROM dual;

-- ======================== OUTPUT MESSAGE ========================
SELECT * FROM Customers;
SELECT * FROM Accounts;
SELECT * FROM Loans;
SELECT * FROM Loans;
SELECT * FROM Transactions;
SELECT * FROM employees;

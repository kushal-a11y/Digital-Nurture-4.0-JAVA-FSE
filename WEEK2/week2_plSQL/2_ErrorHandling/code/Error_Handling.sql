-- view the table creation == D:\Digital-Nurture-4.0-JAVA-FSE\WEEK2\week2_plSQL\Table creation

CREATE OR REPLACE PROCEDURE SafeTransferFunds (
  FROM_ACC         IN NUMBER,
  TO_ACC           IN NUMBER,
  TRANSFER_AMOUNT  IN NUMBER
) AS
  BAL NUMBER;
  ex_insufficient_funds EXCEPTION;  
BEGIN
 
  SELECT balance INTO BAL FROM accounts WHERE accountid = FROM_ACC;

  IF BAL < TRANSFER_AMOUNT THEN
    RAISE ex_insufficient_funds;
  END IF;

  UPDATE accounts
  SET balance = balance - TRANSFER_AMOUNT,
      lastmodified = SYSDATE
  WHERE accountid = FROM_ACC;

  UPDATE accounts
  SET balance = balance + TRANSFER_AMOUNT,
      lastmodified = SYSDATE
  WHERE accountid = TO_ACC;

  DBMS_OUTPUT.PUT_LINE('AMOUNT ' || TRANSFER_AMOUNT || ' TRANSFERRED FROM ACC NO: ' || FROM_ACC || ' TO ACC NO: ' || TO_ACC);

EXCEPTION
  WHEN ex_insufficient_funds THEN
    DBMS_OUTPUT.PUT_LINE('INSUFFICIENT FUNDS FOR ACCOUNT: ' || FROM_ACC);
    ROLLBACK;
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('ACCOUNT NOT FOUND.');
    ROLLBACK;
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
    ROLLBACK;
END;
/

CREATE OR REPLACE PROCEDURE UpdateSalary (
  EID        IN NUMBER,
  PERCENTAGE IN NUMBER
) AS
  EMPID NUMBER;
BEGIN
  SELECT employeeid INTO EMPID FROM employees WHERE employeeid = EID;

  UPDATE employees
  SET salary = salary + salary * (PERCENTAGE / 100)
  WHERE employeeid = EID;

  DBMS_OUTPUT.PUT_LINE('SALARY UPDATED FOR EMPLOYEE ID: ' || EID);

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('INVALID EmployeeID. EMPLOYEE DOES NOT EXIST.');
    ROLLBACK;
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
    ROLLBACK;
END;
/


CREATE OR REPLACE PROCEDURE AddNewCustomer (
  customer_id     IN NUMBER,
  name            IN VARCHAR2,
  dob             IN DATE,
  interest_rate   IN NUMBER,
  balance         IN NUMBER,
  is_vip          IN VARCHAR2
) AS
BEGIN
  INSERT INTO customers (customer_id, name, dob, interest_rate, balance, is_vip)
  VALUES (customer_id, name, dob, interest_rate, balance, is_vip);

  DBMS_OUTPUT.PUT_LINE('CUSTOMER ADDED SUCCESSFULLY.');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    DBMS_OUTPUT.PUT_LINE('CUSTOMER WITH THIS ID ALREADY EXISTS.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END;
/

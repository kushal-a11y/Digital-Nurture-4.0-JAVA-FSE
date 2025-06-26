CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
  accid     NUMBER;
  cust_id   NUMBER;
  bal       NUMBER(12,2);

  CURSOR c IS
    SELECT accountid, customerid, balance
    FROM accounts
    WHERE accounttype = 'Savings';

BEGIN
  FOR rec IN c LOOP
    accid := rec.accountid;
    cust_id := rec.customerid;
    bal := rec.balance;

    UPDATE accounts
    SET balance = bal + bal * 0.01,
        lastmodified = SYSDATE
    WHERE accountid = accid;

    DBMS_OUTPUT.PUT_LINE('BALANCE UPDATED TO ' || TO_CHAR(bal + bal * 0.01, '999999.99') || ' FOR ACCNO. ' || accid);
  END LOOP;
END;
/


CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
  dept        IN VARCHAR2,
  percentage  IN NUMBER
) IS
  updated_rows NUMBER := 0;
BEGIN
  UPDATE employees
  SET salary = salary + (salary * percentage / 100)
  WHERE department = dept;

  updated_rows := SQL%ROWCOUNT;

  IF updated_rows = 0 THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Department: ' || dept || ' does not exist.');
  ELSE
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Salary UPDATED for department: ' || dept);
  END IF;

EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('CAN NOT GIVE BONUS: ' || SQLERRM);
END;
/



CREATE OR REPLACE PROCEDURE SafeTransferFunds(
  FROM_ACC        IN NUMBER,
  TO_ACC          IN NUMBER,
  TRANSFER_AMOUNT IN NUMBER
) IS
  bal   NUMBER;
  ex_insufficient_funds EXCEPTION;
BEGIN
  SELECT balance INTO bal FROM accounts WHERE accountid = FROM_ACC;

  IF bal < TRANSFER_AMOUNT THEN
    RAISE ex_insufficient_funds;
  END IF;

  -- Perform Transfer
  UPDATE accounts
  SET balance = balance - TRANSFER_AMOUNT,
      lastmodified = SYSDATE
  WHERE accountid = FROM_ACC;

  UPDATE accounts
  SET balance = balance + TRANSFER_AMOUNT,
      lastmodified = SYSDATE
  WHERE accountid = TO_ACC;

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('AMOUNT ' || TRANSFER_AMOUNT || ' TRANSFERRED FROM ACC NO: ' || FROM_ACC || ' TO ACC NO: ' || TO_ACC);

EXCEPTION
  WHEN ex_insufficient_funds THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('INSUFFICIENT FUND FOR ACC: ' || FROM_ACC);
  WHEN NO_DATA_FOUND THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('ACCOUNT NOT FOUND');
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('UNEXPECTED ERROR: ' || SQLERRM);
END;
/


BEGIN
  ProcessMonthlyInterest;
  UpdateEmployeeBonus('IT', 8);
  SafeTransferFunds(1, 2, 20000);
  SafeTransferFunds(3, 4, 5000);
END;
/

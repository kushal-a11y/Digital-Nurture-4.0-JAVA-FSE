-- for tables view D:\Digital-Nurture-4.0-JAVA-FSE\WEEK2\week2_plSQL\Table creation\output

select * from accounts;
select * from transactions;
select * from Employees;

DELIMITER $$

CREATE PROCEDURE ProcessMonthlyInterest()
BEGIN
  DECLARE accid INT ;
  DECLARE cust_id INT ;
  DECLARE BAL DECIMAL(12,2);
  DECLARE DONE INT DEFAULT 0;
  
  DECLARE C CURSOR FOR 
    select accountid , customerid , balance FROM accounts
    WHERE accounttype = 'Savings';
  
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET DONE = 1;
  
  open c;
  
  R_LOOP:LOOP
    fetch c into accid,cust_id,BAL;
    IF DONE = 1 then
      LEAVE R_LOOP;
    END IF;
    
    UPDATE accounts 
      SET balance = BAL + BAL * 0.01, 
      lastmodified = CURDATE()
      where accountid = accid;
    
    SELECT CONCAT('BALANCE UPDATED TO ',
              CAST(FORMAT((BAL + BAL * 0.01), 2) AS CHAR),
              ' FOR ACCno.', accid) AS msg;    
  END LOOP;
  
  close c;
END;
$$
DELIMITER ;



CALL ProcessMonthlyInterest();



DELIMITER $$

CREATE PROCEDURE UpdateEmployeeBonus(
  dept varchar(15),
  percentage DECIMAL(5,2)
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
      rollback;
      SELECT 'CAN NOT GIVE BONUS.' AS ERROR_MSG;
    END;
  
  START TRANSACTION;
  
  UPDATE Employees
    SET Salary = Salary + (Salary * percentage/100)
    WHERE Department = dept;
    
  IF ROW_COUNT() = 0 then
    ROLLBACK;
    SELECT CONCAT('Department: ',dept,' does not exist.') AS NODEPT;
  ELSE
    COMMIT;
    SELECT 'Salary UPDATED 'AS msg;  
  END IF;
END;
$$
DELIMITER ;

CALL UpdateEmployeeBonus('IT',8);

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

CALL SafeTransferFunds(3,4,5000);

select * from accounts;


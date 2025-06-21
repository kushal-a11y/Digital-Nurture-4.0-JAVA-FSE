-- Test Table
CREATE TABLE customers (
    customer_id     INT PRIMARY KEY,
    name            VARCHAR(100),
    dob             DATE,
    interest_rate   DECIMAL(5,2),
    balance         DECIMAL(12,2),
    is_vip          VARCHAR(5) DEFAULT 'FALSE'
);
CREATE TABLE loans (
    loan_id         INT PRIMARY KEY,
    customer_id     INT REFERENCES customers(customer_id),
    due_date        DATE,
    amount          DECIMAL(12,2)
);
-- Test Inputs
INSERT INTO customers VALUES (1, 'Kushal', '1964-06-20', 8.5, 9500.00, 'FALSE');
INSERT INTO customers VALUES (2, 'Aarav','1955-01-15', 9.0, 12000.00, 'FALSE');
INSERT INTO customers VALUES (3, 'Diya', '1985-11-02', 7.8, 15000.00, 'FALSE');
INSERT INTO customers VALUES (4, 'Rohit','1960-06-20', 8.2, 5000.00, 'FALSE');
INSERT INTO customers VALUES (5, 'Meera', '1990-12-10', 9.5, 11000.00, 'FALSE');

INSERT INTO loans VALUES (101, 1, DATE_ADD(CURDATE(), INTERVAL 15 DAY), 50000.00);  -- due in 15 days
INSERT INTO loans VALUES (102, 2, DATE_ADD(CURDATE(), INTERVAL 5 DAY), 30000.00);   -- due in 5 days
INSERT INTO loans VALUES (103, 3, DATE_ADD(CURDATE(), INTERVAL 45 DAY), 70000.00);  -- due later
INSERT INTO loans VALUES (104, 4, DATE_ADD(CURDATE(), INTERVAL 25 DAY), 20000.00);  -- due in 25 days
INSERT INTO loans VALUES (105, 5, DATE_SUB(CURDATE(), INTERVAL 10 DAY), 45000.00);  -- overdue

select * from customers;

DELIMITER $$

-- core procedure
create procedure update_interestrate()
  begin
    DECLARE done INT DEFAULT FALSE;
    DECLARE ID INT;
    DECLARE AGE INT;
    DECLARE RATE DECIMAL(5,3);

    DECLARE C CURSOR FOR 
        SELECT customer_id, timestampdiff(year, dob, curdate()), interest_rate from customers;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET DONE = TRUE;
  
  
    OPEN C;

    LOOP_CURSOR: LOOP 
        FETCH C INTO ID, AGE,RATE;
        IF DONE THEN
            LEAVE LOOP_CURSOR;
        END IF;

        IF age > 60 THEN
            UPDATE customers SET
                interest_rate = interest_rate - interest_rate * 0.01
                WHERE customer_id = ID;
            -- Show updated interestrate
            select concat('Customer id:', ID, ' age:', age, ' interest rate updated to ',CAST(format(rate - (rate * 0.01),2) as char)) as msg;
        END IF;
    END LOOP; 
       
    close c;
       
  end;
  $$

DELIMITER ;

-- calling procedure
call update_interestrate();

DELIMITER $$


CREATE PROCEDURE update_status()
begin
  UPDATE customers 
  SET is_vip = 'TRUE' 
  WHERE balance > 10000;
  
  select CONCAT('vip status updated for customers with balance over 10,000') as message;
end;
$$

DELIMITER ;

call update_status();


DELIMITER $$


CREATE PROCEDURE SEND_REMINDER()
begin
  SELECT C.customer_id,
  C.name,
  l.Loan_id,
  L.due_date,
  L.amount,
  CONCAT('ATTENTION: ',C.NAME,' ID:',C.customer_id,' DUE WINTIN 30 DAYS. LAST DATE ', DATE_FORMAT(L.due_date, 'DD-MON-YYYY'))AS DUE_MSG
  
  FROM 
  
  customers C JOIN loans L 
  ON C.customer_id = L.customer_id
  
  WHERE DUE_DATE between curdate() AND curdate() + INTERVAL 30 DAY;
  
END;
$$
DELIMITER ;

call SEND_REMINDER();

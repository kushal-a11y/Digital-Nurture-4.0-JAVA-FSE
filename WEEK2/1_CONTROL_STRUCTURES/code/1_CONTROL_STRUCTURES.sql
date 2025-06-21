-- Test Table
CREATE TABLE customers (
    customer_id     INT PRIMARY KEY,
    name            VARCHAR(100),
    dob             DATE,
    interest_rate   DECIMAL(5,2)
);
-- Test Inputs
INSERT INTO customers VALUES (1, 'Kushal', '1964-06-20', 8.5); -- age > 60
INSERT INTO customers VALUES (2, 'Aarav', '1958-06-20', 9.0);  -- age > 60
INSERT INTO customers VALUES (3, 'Gaurav', '1999-06-1', 9.0);  -- age < 60

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

select * from customers;
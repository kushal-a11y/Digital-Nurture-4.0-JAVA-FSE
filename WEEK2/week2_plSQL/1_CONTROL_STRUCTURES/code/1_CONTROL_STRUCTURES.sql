START TRANSACTION;

BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE ID INT;
  DECLARE AGE INT;
  DECLARE RATE DECIMAL(5,2);
  DECLARE BAL DECIMAL(12,2);
  DECLARE VIP VARCHAR(5);

  -- Cursor for customer data
  DECLARE cur CURSOR FOR
    SELECT customer_id, TIMESTAMPDIFF(YEAR, dob, CURDATE()), interest_rate, balance, is_vip
    FROM customers;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;

  read_loop: LOOP
    FETCH cur INTO ID, AGE, RATE, BAL, VIP;
    IF done THEN
      LEAVE read_loop;
    END IF;

    -- 1. Apply 1% discount on interest rate for age > 60
    IF AGE > 60 THEN
      UPDATE customers
      SET interest_rate = interest_rate - interest_rate * 0.01
      WHERE customer_id = ID;

      SELECT CONCAT('Discount applied for customer ID: ', ID) AS msg;
    END IF;

    -- 2. Update VIP status if balance > 10,000
    IF BAL > 10000 THEN
      UPDATE customers
      SET is_vip = 'TRUE'
      WHERE customer_id = ID;

      SELECT CONCAT('VIP status granted to customer ID: ', ID) AS msg;
    END IF;

  END LOOP;

  CLOSE cur;

  -- 3. Send Reminders for loans due within 30 days
  SELECT 
    c.customer_id,
    c.name,
    l.loan_id,
    l.due_date,
    l.amount,
    CONCAT('REMINDER: ', c.name, ' (ID:', c.customer_id, ') loan due on ', DATE_FORMAT(l.due_date, '%d-%b-%Y')) AS reminder
  FROM 
    customers c
    JOIN loans l ON c.customer_id = l.customer_id
  WHERE 
    l.due_date BETWEEN CURDATE() AND CURDATE() + INTERVAL 30 DAY;

END;

COMMIT;

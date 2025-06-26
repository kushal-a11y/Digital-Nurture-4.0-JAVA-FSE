-- view the table creation == D:\Digital-Nurture-4.0-JAVA-FSE\WEEK2\week2_plSQL\Table creation
CREATE OR REPLACE PROCEDURE update_interestrate IS
  CURSOR c IS
    SELECT customer_id, FLOOR(MONTHS_BETWEEN(SYSDATE, dob) / 12) AS age, interest_rate
    FROM customers;

  v_id   customers.customer_id%TYPE;
  v_age  NUMBER;
  v_rate customers.interest_rate%TYPE;
BEGIN
  OPEN c;
  LOOP
    FETCH c INTO v_id, v_age, v_rate;
    EXIT WHEN c%NOTFOUND;

    IF v_age > 60 THEN
      UPDATE customers
      SET interest_rate = interest_rate - (interest_rate * 0.01)
      WHERE customer_id = v_id;

      DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_id || ', Age: ' || v_age ||
                           ' → Interest rate updated to ' || TO_CHAR(v_rate - (v_rate * 0.01), '0.00'));
    END IF;
  END LOOP;
  CLOSE c;
END;
/

CREATE OR REPLACE PROCEDURE update_status IS
BEGIN
  UPDATE customers
  SET is_vip = 'TRUE'
  WHERE balance > 10000;

  DBMS_OUTPUT.PUT_LINE('VIP status updated for customers with balance over 10,000');
END;
/

CREATE OR REPLACE PROCEDURE send_reminder IS
BEGIN
  FOR r IN (
    SELECT c.customer_id, c.name, l.loan_id, l.end_date, l.loan_amount
    FROM customers c
    JOIN loans l ON c.customer_id = l.customer_id
    WHERE l.end_date BETWEEN SYSDATE AND SYSDATE + 30
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('ATTENTION: ' || r.name || ' (ID: ' || r.customer_id ||
                         ') → DUE WITHIN 30 DAYS. LAST DATE: ' || TO_CHAR(r.end_date, 'DD-MON-YYYY'));
  END LOOP;
END;
/

BEGIN
  update_interestrate;
  update_status;
  send_reminder;
END;
/


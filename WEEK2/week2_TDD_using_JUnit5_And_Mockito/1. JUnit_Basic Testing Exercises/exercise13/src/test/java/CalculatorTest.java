import org.junit.Before;

import static org.junit.Assert.assertEquals;

import org.junit.After;
import org.junit.Test;

public class CalculatorTest {
    private Calculator calc;

    // A1 -> Arrange Creting objects and setting state
    @Before
    public void setUp(){
        System.out.println("Setting up calculator...");
        calc = new Calculator();
    }
    @After
    public void tearDown(){
        System.out.println("Cleaning up...");
        calc = null;
    }
    
    @Test 
    public void testAdd(){
        // A2 -> Act Calling Methods
        int result = calc.add(2, 3);
        // A3 -> Checking results
        assertEquals(5, result);
    }

    @Test
    public void testSubtract(){
        // A2 -> Act Calling Methods
        int result = calc.subtract(2, 3);
        // A3 -> Checking results
        assertEquals(-1, result);
    }


}

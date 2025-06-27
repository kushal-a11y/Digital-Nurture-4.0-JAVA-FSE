import org.junit.Before;
import org.junit.After;
import org.junit.Test;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class PasswordValidatorTest {
    PasswordValidator obj;
    // Arrange
    @Before
    public void setUp(){
        System.out.println("Starting the validator....");
        obj = new PasswordValidator();
    }

    @After
    public void tearDown(){
        System.out.println("Cleaning up...");
        obj = null;//De-referencing the obj
    }

    @Test
    public void testValidateUserName(){
        assertTrue(obj.isValidUsername("kushaldas"));
        assertFalse(obj.isValidUsername(""));
        assertFalse(obj.isValidUsername("   "));
        assertFalse(obj.isValidUsername("kushal das"));
    }
    @Test
    public void testValidatePassword(){
        assertTrue(obj.isValidPassword("abc12345"));
        assertFalse(obj.isValidPassword("abc1de"));//length < 8
        assertFalse(obj.isValidPassword("abcdef11gh"));
        assertFalse(obj.isValidPassword("abc1defgh"));
    }
    @Test
    public void testValidEmail() {
        assertTrue(obj.isValidEmail("user@example.com"));
        assertFalse(obj.isValidEmail("userexample.com"));   // missing @
        assertFalse(obj.isValidEmail("user@com"));          // missing dot
    }

}

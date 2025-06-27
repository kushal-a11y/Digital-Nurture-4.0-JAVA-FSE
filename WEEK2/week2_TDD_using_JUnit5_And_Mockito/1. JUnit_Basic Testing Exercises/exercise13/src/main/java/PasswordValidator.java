public class PasswordValidator {
    public boolean isValidUsername(String name){
        return name!=null && !name.trim().isEmpty() && !name.contains(" ");
    }

    public boolean isValidPassword(String pwd){
        if(pwd == null && pwd.length() < 8) return false;
        return pwd.matches(".*\\d.*");
    }
    public boolean isValidEmail(String email){
        return email!=null && email.contains("@") && email.contains(".");
    }
}

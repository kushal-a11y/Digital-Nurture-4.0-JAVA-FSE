public class SingletonPatternExample{
    static class Logger{
        private static Logger instance = new Logger();//Thread Safe

        private Logger(){};

        //get instance
        public static  Logger getInstance(){
            return instance;
        }
    }
    public static void main(String[] args) {
        Logger x = Logger.getInstance();
        Logger y = Logger.getInstance();

        //If this class has only one object then 
        //both of this x and y should
        //point to same object reference

        if(x == y){
            System.out.println("Same object");
        }else{
            System.out.println("Different object. Not sngleton class.");
        }
    }
}
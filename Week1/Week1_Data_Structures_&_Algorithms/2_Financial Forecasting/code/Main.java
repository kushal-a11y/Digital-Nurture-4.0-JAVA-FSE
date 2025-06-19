import java.util.*;
class Main{
    public static double forecast(double currval, double growthrate, double year){
        if(year == 0) return currval;
        return forecast(currval * (1 + growthrate), growthrate, year - 1);
    }
    public static double optimized(double currval, double growthrate, int year, Map<Integer, Double> m){
        if(year == 0) return currval;
        if(m.containsKey(year)){
            return m.get(year);
        }
        double res = optimized(currval, growthrate, year - 1, m)* (1 + growthrate);
        m.put(year,res);
        return res;
    }
    public static void main(String args[]){
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter the current value: ");
        double currentValue = sc.nextDouble();
        System.out.println("Enter growth rate: ");
        double growthRate = sc.nextDouble();
        System.out.println("Enter no of year...");
        int years = sc.nextInt();

        double future1 = forecast(currentValue, growthRate, years);
        System.out.println("Recursive Forecast: " + future1);

        Map<Integer, Double> memo = new HashMap<>();
        double future2 = optimized(currentValue, growthRate, years, memo);
        System.out.println("Optimized Forecast: " + future2);

        sc.close();
    }
}